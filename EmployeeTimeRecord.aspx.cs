using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EmployeeTimeRecord : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter adr;
    DataTable dt;
    Regex r;

    /*Page methods*/
    public bool indexSearch(string indexValue = "")
    {
        r = new Regex("[a-zA-Z0-9!/ ]*$");

        if (r.IsMatch(indexValue))
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
            using (adr = new SqlDataAdapter("SelectAllEmployeeTimeRecord", con))
            {
                dt = new DataTable();
                adr.Fill(dt);
                GridView1.DataBind();
                adr.Dispose();
                con.Close();
            }
        }
        return dataBind;
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindData();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        base.VerifyRenderingInServerForm(control);
    }
    /*Page load functions*/
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                lblTimeRecordCount.Visible = true;

                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("CountTotalEmployeeTimeRecord", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblTimeRecordCount.Text = dr["totalEmployeeRecord"].ToString();
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
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnSearchTimeRecord_Click(object sender, EventArgs e)
    {
        string searchError = "<script language='javascript'>alert('Search field is empty!')</script>";
        string timeRecord;

        timeRecord = Convert.ToString(txtSearchEmployeeTime.Text);

        if (txtSearchEmployeeTime.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", searchError);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Employee_Daily_TimeRecord WHERE (empAccountNumber LIKE '" + timeRecord + "') OR (empLoginTime LIKE '" + timeRecord + "') OR (empLoginDay LIKE '" + timeRecord + "')";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchEmployeeTime.Text = "";
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=EmployeeDailyTimeRecord.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        StringWriter sw;
        HtmlTextWriter hw;

        using (sw = new StringWriter())
        {
            using (hw = new HtmlTextWriter(sw))
            {
                //export the table in excel
                GridView1.AllowPaging = false;
                bindData();

                GridView1.HeaderRow.BackColor = System.Drawing.Color.White;

                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }

                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }
                GridView1.RenderControl(hw);
                string style = "<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }
}