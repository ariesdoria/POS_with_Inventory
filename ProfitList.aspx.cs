using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Text;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.IO;

public partial class Admin_ProfitList : Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter adr;
    DataTable dt;
    ArrayList arr;
    CheckBox chkAll, chk, cb;
    StringBuilder sb;
    Regex r;
    int i, currentCount, count;
    string status = "ARCHIVED";

    //Page event and data functions
    private string bindData(string dataBind = "")
    {
        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (adr = new SqlDataAdapter("selectAllProfit",con))
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
                GridView1.Rows[i].Cells[0].FindControl("chkRow");

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

    private void ArchiveRecord(string profitID)
    {
        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("addArchivedProfit", con))
            {
                cmd.Parameters.AddWithValue("profitID", profitID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            using (cmd = new SqlCommand("updateArchivedProfit", con))
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
    //Page event functions
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                lblProfitCount.Visible = true;

                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("CountTotalProfit", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblProfitCount.Text = dr["totalProfit"].ToString();
                            }
                        }
                        dr.Close();
                    }
                    cmd.Dispose();
                    con.Close();
                }
            }
            else
            {
                Session.Clear();
                Server.Transfer("Login_Page.aspx");
                lblProfitCount.Visible = false;
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
            lblProfitCount.Visible = false;
        }
    }

    protected void btnSearchProfit_Click(object sender, EventArgs e)
    {
        string errorMsg = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchPost;

        searchPost = Convert.ToString(txtSearchProfit.Text);

        if (txtSearchProfit.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", errorMsg);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Proft WHERE (Amount LIKE '" + searchPost + "') OR (Employee_Name LIKE '" + searchPost + "') OR (Payment_Mode LIKE '" + searchPost + "') OR (Customer_Name LIKE '" + searchPost + "') OR (DateReceived LIKE '" + searchPost + "') OR (Status LIKE '" + searchPost + "')";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchProfit.Text = "";
    }

    protected void btnArchive_Click(object sender, EventArgs e)
    {
        count = 0;
        setData();
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        arr = (ArrayList)ViewState["SelectedRecords"];
        count = arr.Count;

        for (int i = 0; i <= (GridView1.Rows.Count - 1); i++)
        {
            if (arr.Contains(GridView1.DataKeys[i].Value))
            {
                ArchiveRecord(GridView1.DataKeys[i].Value.ToString());
                arr.Remove((GridView1.DataKeys[i].Value));
            }
        }
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Profit.xls");
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
        string status = "DELETED";
        string deleteScript = "<script language='javascript'>alert('You have successfully cleanup old profit list!')</script>";
        string errorDelete = "<script language='javascript'>alert('Unfortunately, there are no records of old profit list that needs to be cleaned up.')</script>";


        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("SelectTotalArchivedProfit", con))
                {
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        using (cmd = new SqlCommand("addTrashProfit", con))
                        {
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("updateTrashProfit", con))
                        {
                            cmd.Parameters.AddWithValue("trashStatus", status);
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("deleteArchivedProfit", con))
                        {
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            //load deleteScript
                            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Success", deleteScript);
                            //reload the page
                            Server.TransferRequest(Request.Url.AbsolutePath, false);
                        }
                    }
                    dr.Close();
                }
                cmd.Dispose();
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
