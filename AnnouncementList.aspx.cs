using System;
using System.Text.RegularExpressions;


public partial class Employee_AnnouncementList : System.Web.UI.Page
{
    Regex r;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["emp_username"] != null)
            {

            }
            else
            {
                Session.Clear();
                Server.Transfer("index.aspx");
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
        string errorScript = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchPost;

        searchPost = Convert.ToString(txtSearchAnnouncement.Text);
        if (txtSearchAnnouncement.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong..", errorScript);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Announcements WHERE (announcement_subject LIKE '" + searchPost + "') OR (announcement LIKE '" + searchPost + "') OR (date_posted LIKE '" + searchPost + "')";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchAnnouncement.Text = "";
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
}