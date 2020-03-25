using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ArchiveExchangeItems : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter adr;
    DataTable dt;
    ArrayList arr;
    CheckBox chkAll, chk, cb;
    Regex r;
    StringBuilder sb;
    StringWriter sw;
    int i, currentCount, count;

    /*Page and button functions*/
    public bool regExpress(string inputString = "")
    {
        r = new Regex("[a-zA-Z0-9!/ ]*$");
        if (r.IsMatch(inputString))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private string bindData(string dataBind = "")
    {
        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (adr = new SqlDataAdapter("SelectTotalArchivedExchangeItems", con))
            {
                dt = new DataTable();
                adr.Fill(dt);
                GridView1.DataBind();
                con.Close();
            }
        }
        return dataBind;
    }

    private void deleteRecord(string exchange_ID)
    {
        string status = "DELETED";

        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("addTrashArchiveExchangeItems", con))
            {
                cmd.Parameters.AddWithValue("exchangeID", exchange_ID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            using (cmd = new SqlCommand("updateTrashExchangeItem", con))
            {
                cmd.Parameters.AddWithValue("trashStatus", status);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            using (cmd = new SqlCommand("trashArchiveExchangeItems", con))
            {
                cmd.Parameters.AddWithValue("exchangeID", exchange_ID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            con.Close();
        }
    }

    private void getData()
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
                GridView1.Rows[i].Cells[0].FindControl("chkRow");

                if (chk.Checked)
                {
                    if (!arr.Contains(GridView1.DataKeys[i].Value))
                    {
                        arr.Add(GridView1.DataKeys[i].Value);
                    }
                    else
                    {
                        if (arr.Contains(GridView1.DataKeys[i].Value))
                        {
                            arr.Remove(GridView1.DataKeys[i].Value);
                        }
                    }
                }
            }
        }
        ViewState["SelectedRecords"] = arr;
    }

    private void setData()
    {
        currentCount = 0;
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

    private void showMessage(int count)
    {
        sb.Append("<script language='javascript'>");
        sb.Append("alert('");
        sb.Append(count.ToString());
        sb.Append(" record(s) deleted.');");
        sb.Append("</script>");
        ClientScript.RegisterStartupScript(GetType(), "script", sb.ToString());
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

    /*Page and button methods*/
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                lblArchiveExchangeItemCount.Visible = true;

                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("CountTotalArchivedExchangeItems", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblArchiveExchangeItemCount.Text = dr["totalExchanges"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                        con.Close();
                        getData();
                        bindData();
                    }
                }
            }
            else
            {
                Session.Clear();
                Server.Transfer("Login_Page.aspx");
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
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You might want to check your entries...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Archived_Item_Exchange WHERE (ProductID LIKE '" + searchExchangeItem + "') OR (ItemName LIKE '" + searchExchangeItem + "') OR (Category LIKE '" + searchExchangeItem + "') OR (Description LIKE '" + searchExchangeItem + "') OR (CostPrice LIKE '" + searchExchangeItem + "') OR (SellingPrice LIKE '" + searchExchangeItem + "') OR (Quantity LIKE '" + searchExchangeItem + "') OR (DateExchanged LIKE '" + searchExchangeItem + "')";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchExchangedItem.Text = "";
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Exchanged_Item_Archives.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";

        HtmlTextWriter hw;

        hw = new HtmlTextWriter(sw);

        bool isSelected = false;

        foreach (GridViewRow i in GridView1.Rows)
        {
            cb = (CheckBox)i.FindControl("chkRow");
            if (cb != null && cb.Checked)
            {
                isSelected = true;
            }
        }

        if (isSelected)
        {
            GridView gvExport = GridView1;

            gvExport.Columns[0].Visible = false;
            foreach (GridViewRow i in GridView1.Rows)
            {
                gvExport.Rows[i.RowIndex].Visible = false;

                cb = (CheckBox)i.FindControl("chkRow");
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

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        count = 0;
        setData();
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        arr = (ArrayList)ViewState["SelectedRecords"];
        count = arr.Count;

        for (i = 0; i <= (GridView1.Rows.Count - 1); i++)
        {
            if (arr.Contains(GridView1.DataKeys[i].Value))
            {
                deleteRecord(GridView1.DataKeys[i].Value.ToString());
                arr.Remove(GridView1.DataKeys[i].Value);
            }
        }
        ViewState["SelectedRecords"] = arr;
        hfCount.Value = "0";
        GridView1.AllowPaging = true;
        bindData();
        showMessage(count);
    }
}