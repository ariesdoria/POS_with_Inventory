﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.UI;
using System.Text.RegularExpressions;
using System.IO;


public partial class Admin_AnnouncementList : Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter adapter;
    DataTable dt;
    ArrayList arr;
    CheckBox chkAll, chk;
    StringBuilder sb;
    Regex r;
    CheckBox cb;
    int i;
    string status = "ARCHIVED";
    int currentCount;
    int count;

    /*Page functions*/

    //Bind data function
    private string bindData(string dataBind = "")
    {
        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (adapter = new SqlDataAdapter("selectAllAnnouncements", con))
            {
                dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataBind();
                con.Close();
            }
        }
        return dataBind;
    }

    //Get data function
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
                        arr.Add(GridView1.DataKeys[i].Value);
                    }
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
        ViewState["SelectedRecords"] = arr;
    }

    private void ArchiveRecord(string announcement_id)
    {
        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("addArchiveAnnouncements", con))
            {
                cmd.Parameters.AddWithValue("announcementID", announcement_id);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            using (cmd = new SqlCommand("updateArchivedAnnouncements", con))
            {
                cmd.Parameters.AddWithValue("announcementStatus", status);
                cmd.ExecuteNonQuery();
            }
            cmd.Dispose();
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
        ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
    }

    private void setData()
    {
        GridView1.HeaderRow.Cells[0].FindControl("chkAll");
        chkAll.Checked = true;
        arr = (ArrayList)ViewState["SelectedRecords"];
        for (int i = 0; i <= (GridView1.Rows.Count - 1); i++)
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

    /*Page load and button controls*/
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if(Session["Admin_username"] != null)
            {
                lblAnnouncementCount.Visible = true;

                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("CountTotalAnnouncements",con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblAnnouncementCount.Text = dr["totalAnnouncements"].ToString();
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
                lblAnnouncementCount.Visible = false;
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string errorMsg = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchPost;

        searchPost = Convert.ToString(txtSearchAnnouncement.Text);

        if (txtSearchAnnouncement.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", errorMsg);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Announcements WHERE (announcement LIKE '" + searchPost + "') OR (date_posted LIKE '" + searchPost + "') ";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchAnnouncement.Text = "";
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
        Response.AddHeader("content-disposition", "attachment;filename=Announcement.xls");
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

    protected void btnAddAnnouncement_Click(object sender, EventArgs e)
    {
        Server.Transfer("AddAnnouncement.aspx");
    }

    protected void btnCleanup_Click(object sender, EventArgs e)
    {
        string status = "DELETED";
        string deleteScript = "<script language='javascript'>alert('You have successfully cleanup old announcements!')</script>";
        string errorDelete = "<script language='javascript'>alert('Unfortunately, there are no records of old announcements that needs to be cleaned up.')</script>";


        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("SelectTotalArchivedAnnouncements", con))
                {
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        using (cmd = new SqlCommand("addTrashAnnouncements", con))
                        {
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("updateTrashAnnouncements", con))
                        {
                            cmd.Parameters.AddWithValue("status", status);
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("deleteArchivedAnnouncement", con))
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