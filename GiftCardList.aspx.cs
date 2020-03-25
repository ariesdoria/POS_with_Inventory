using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_GiftCardList : Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter adr;
    SqlDataReader dr;
    DataTable dt;
    ArrayList arr;
    StringBuilder sb;
    StringWriter sw;
    Regex r;
    CheckBox cb, chk, chkAll;
    string status = "ARCHIVED";
    string delStatus = "DELETED";
    int currentCount, count, i;

    /*Page load and event methods*/
    private string bindData(string dataBind = "")
    {
        using (con = new SqlConnection(@" Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
        {
            using (adr = new SqlDataAdapter("selectAllGiftCard", con))
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

    private void ArchiveRecord(string giftCardID)
    {
        using (con = new SqlConnection(@" Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("addArchivedGiftCard", con))
            {
                cmd.Parameters.AddWithValue("giftCardNum", giftCardID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            using (cmd = new SqlCommand("updateArchivedGiftCard", con))
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

        for (i = 0; i <= (GridView1.Rows.Count -1); i++)
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

    /*Page load and event functions*/
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                lblGiftcardCount.Visible = true;

                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("CountTotalGiftCards", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblGiftcardCount.Text = dr["totalGiftcard"].ToString();
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
                lblGiftcardCount.Visible = false;
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnSearchGiftCard_Click(object sender, EventArgs e)
    {
        string errorMessage = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchGiftCard;

        searchGiftCard = Convert.ToString(txtSearchGiftCard.Text);

        if (txtSearchGiftCard.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Giftcard WHERE (Giftcard_Number LIKE '" + searchGiftCard + "') OR (Giftcard_Value LIKE '" + searchGiftCard + "') OR (Customer LIKE '" + searchGiftCard + "') OR (Status LIKE '" + searchGiftCard + "')";
        }

    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchGiftCard.Text = "";
    }

    protected void btnBulkUpdate_Click(object sender, EventArgs e)
    {
        string errorScript = "<script language='javascript'>alert('There is no record in the database!')</script>";

        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("selectAllGiftCard",con))
            {
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    txtGiftCardValue.Text = "";
                    txtCustomer.Text = "";
                    mpGiftCard.Show();
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorScript);
                    Server.TransferRequest(Request.Url.AbsolutePath, false);
                }
                dr.Close();
                cmd.Dispose();
            }
            con.Close();
        }
    }

    protected void btnArchive_Click(object sender, EventArgs e)
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
                ArchiveRecord(GridView1.DataKeys[i].Value.ToString());
                arr.Remove(GridView1.DataKeys[i].Value);
            }
        }
        ViewState["SelectedRecords"] = arr;
        hfCount.Value = "0";
        GridView1.AllowPaging = true;
        bindData();
        showMessage(count);
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Giftcard.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";   
        HtmlTextWriter hw;

        hw = new HtmlTextWriter(sw);

        bool isSelected = false;

        foreach (GridViewRow i in GridView1.Rows)
        {
            i.FindControl("chkRow");

            if (cb != null && cb.Checked)
            {
                isSelected = true;
            }
        }

        if (isSelected)
        {
            GridView gvExport = GridView1;

            gvExport.Columns[0].Visible = false;
            gvExport.Columns[5].Visible = false;
            gvExport.Columns[6].Visible = false;

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

    protected void btnAddGiftCard_Click(object sender, EventArgs e)
    {
        Server.Transfer("AddGiftcard.aspx");
    }

    protected void btnUpdateGiftCard_Click(object sender, EventArgs e)
    {
        string giftCardCustomer;
        int giftCardValue;

        string updateScript = "<script language='javascript'>alert('You have successfully updated the Giftcard list!')</script>";

        giftCardCustomer = Convert.ToString(txtCustomer.Text);
        giftCardValue = Convert.ToInt32(txtGiftCardValue.Text);

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("updateBulkGiftCard", con))
                {
                    cmd.Parameters.AddWithValue("giftCardValue", giftCardValue);
                    cmd.Parameters.AddWithValue("customer", giftCardCustomer);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                con.Close();
            }

            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", updateScript);
            Server.TransferRequest(Request.Url.AbsolutePath, false);

            txtCustomer.Text = "";
            txtGiftCardValue.Text = "";
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }
}