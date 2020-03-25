using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ExchangedItems : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter adr;
    SqlDataReader dr;
    DataTable dt;
    ArrayList arr;
    StringBuilder sb;
    Regex r;
    CheckBox cb, chk, chkAll;
    string status = "ARCHIVED";
    string delStatus = "DELETED";
    int currentCount, count, i;

    /*Page load methods*/
    private string bindData(string dataBind = "")
    {
        using (con = new SqlConnection(@" Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
        {
            using (adr = new SqlDataAdapter("selectAllItemExchange", con))
            {
                dt = new DataTable();
                adr.Fill(dt);
                GridView1.DataBind();
                con.Close();
            }
        }
        return dataBind;
    }
    
    private void GetData()
    {
        if (ViewState["SelectedRecords"] != null)
        {
            arr = (ArrayList)ViewState["SelectedRecords"];
        }
        else
        {
            arr = new ArrayList();
        }

        GridView1.HeaderRow.Cells[0].FindControl("chkAll");

        for (i = 0; i <= (GridView1.Rows.Count - 1); i++)
        {
            if (chkAll.Checked)
            {
                if (!arr.Contains(GridView1.DataKeys[i].Value))
                {
                    arr.Add(GridView1.DataKeys[i].Value);
                }
            }
            else
            {
                GridView1.HeaderRow.Cells[0].FindControl("chkRow");

                if (chk.Checked)
                {
                    if (!arr.Contains(GridView1.DataKeys[i].Value))
                    {
                        arr.Remove(GridView1.DataKeys[i].Value);
                    }
                }
            }
        }
        ViewState["SelectedRecords"] = arr;
    }

    private void ArchiveRecord(string exchangeID)
    {
        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("addArchiveItemExchange", con))
            {
                cmd.Parameters.AddWithValue("exchangeID", exchangeID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            using (cmd = new SqlCommand("updateArchivedItemExchange", con))
            {
                cmd.Parameters.AddWithValue("status", status);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            con.Close();
        }
    }

    private void showMessage(int count)
    {
        sb.Append("<script language='javascript'>");
        sb.Append("alert('");
        sb.Append(count.ToString());
        sb.Append(" record(s) archived.');");
        sb.Append("</script>");
        ClientScript.RegisterStartupScript(GetType(), "script", sb.ToString());
    }

    private void setData()
    {
        GridView1.HeaderRow.Cells[0].FindControl("chkAll");
        chkAll.Checked = true;
        arr = (ArrayList)ViewState["SelectedRecords"];

        for (i = 0; i <= (GridView1.Rows.Count - 1); i++)
        {
            GridView1.Rows[i].Cells[0].FindControl("chkRow");
            if (chk != null)
            {
                chk.Checked = arr.Contains(GridView1.DataKeys[i].Value);
                if (!chk.Checked)
                {
                    chk.Checked = false;
                }
                else
                {
                    currentCount += 1;
                }
            }
        }
        hfCount.Value = (arr.Count - currentCount).ToString();
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        setData();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        base.VerifyRenderingInServerForm(control);  
    }

    public bool regExpress(string input)
    {
        r = new Regex("[a-zA-Z0-9!/ ]*$");

        if (r.IsMatch(input))
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    /*Page load and button event functions*/
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                lblExchangedItemCount.Visible = true;

                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("CountTotalExchangedItems", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblExchangedItemCount.Text = dr["totalExchanges"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    con.Close();
                }
            }
            else
            {
                Session.Clear();
                Server.Transfer("Login_Page.aspx");
                lblExchangedItemCount.Visible = false;
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnSearchExchangedItem_Click(object sender, EventArgs e)
    {
        string errorMessage = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchExchangeItem;

        searchExchangeItem = Convert.ToString(txtSearchExchangedItem.Text);

        if (txtSearchExchangedItem.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Item_Exchange WHERE (ItemName LIKE '" + searchExchangeItem + "') OR (Category LIKE '" + searchExchangeItem + "') OR (Description LIKE '" + searchExchangeItem + "') OR (CostPrice LIKE '" + searchExchangeItem + "') OR (SellingPrice LIKE '" + searchExchangeItem + "') OR (Quantity LIKE '" + searchExchangeItem + "') OR (DateExchanged LIKE '" + searchExchangeItem + "') OR (Status LIKE '" + searchExchangeItem + "')";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchExchangedItem.Text = "";
    }

    protected void btnArchive_Click(object sender, EventArgs e)
    {
        count = 0;
        setData();
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        arr = (ArrayList)ViewState["SelectedRecords"];
        count = arr.Count;

        for (i = 0; i <= (GridView1.Rows.Count -1); i++)
        {
            if (arr.Contains(GridView1.DataKeys[i].Value))
            {
                ArchiveRecord(GridView1.DataKeys[i].Value.ToString());
                arr.Remove(GridView1.DataKeys[i].Value);
            }
        }
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=ExchangeItems.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        bool isSelected = false;

        foreach (GridViewRow i in GridView1.Rows)
        {
            i.FindControl("chkRow");
            if (cb != null && cb.Checked)
            {
                isSelected = true;
                break;
            }
        }

        if (isSelected)
        {
            GridView gvExport = GridView1;
            gvExport.Columns[0].Visible = false;
            gvExport.Columns[5].Visible = false;

            foreach (GridViewRow i in GridView1.Rows)
            {
                gvExport.Rows[i.RowIndex].Visible = false;
                i.FindControl("chkRow");
                if (cb != null && cb.Checked)
                {
                    gvExport.Rows[i.RowIndex].Visible = true;
                }
                gvExport.CssClass = "textmode";
            }
            gvExport.RenderControl(hw);
            string style = "<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.End();
        }
    }

    protected void btnCleanup_Click(object sender, EventArgs e)
    {
        string deleteScript = "<script language='javascript'>alert('You have successfully cleanup old exchanged items!')</script>";
        string errorDelete = "<script language='javascript'>alert('Unfortunately, there are no records of old exchanged items that needs to be cleaned up.')</script>";

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("selectTotalArchivedExchangeItems",con))
                {
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        using (cmd = new SqlCommand("addTrashExchangeItems",con))
                        {
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("updateTrashExchangeItem",con))
                        {
                            cmd.Parameters.AddWithValue("trashStatus", status);
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("deleteArchivedExchangeItem", con))
                        {
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            //call the delete script
                            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Success", deleteScript);
                            Server.TransferRequest(Request.Url.AbsolutePath, false);
                        }
                        dr.Close();
                    }
                    cmd.Dispose();
                }
                con.Close();
            }
        }
        catch (Exception)
        {
            //call the error delete exception
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You might want to check it first...", errorDelete);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
    }
}