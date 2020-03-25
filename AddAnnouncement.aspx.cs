using System;
using System.Data.SqlClient;

public partial class Admin_AddAnnouncement : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }

    protected void btnPostAnnouncement_Click(object sender, EventArgs e)
    {
        addAnnouncement();
    } 
    //Page load and add announcement functions
    public void pageLoad()
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True");
                con.Open();
                cmd = new SqlCommand("adminLogin", con);
                cmd.Parameters.AddWithValue("admin_username", Session["Admin_username"]);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Label1.Text = dr["admin_fname"].ToString();
                    }
                }
                dr.Close();
                cmd.Dispose();
                con.Close();
            }
            else
            {
                Session.Clear();
                Server.Transfer("Login_Page.aspx");
            }
        }
        catch (Exception)
        {
            Server.Transfer("404.aspx");
        }
    }
    public void addAnnouncement()
    {
        //For variable conversion
        string subject;
        string announcement;
        string datePosted;
        string announcementStatus = "ACTIVE";
        string sender_name;
        string script = "<script language='javascript'>alert('You've successfully posted an announcement!')</script>";


        subject = Convert.ToString(txtSubject.Text);
        announcement = Convert.ToString(txtSubject.Text);
        datePosted = Convert.ToString(System.DateTime.Today);
        sender_name = Session["Admin_username"].ToString();

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addAnnouncement", con))
                {
                    cmd.Parameters.AddWithValue("announcement_subject", subject);
                    cmd.Parameters.AddWithValue("announcement", announcement);
                    cmd.Parameters.AddWithValue("date_posted", datePosted);
                    cmd.Parameters.AddWithValue("sender", sender_name);
                    cmd.Parameters.AddWithValue("announcement_status", announcementStatus);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("addEmployeeAnnouncement", con))
                {
                    cmd.Parameters.AddWithValue("announcement_subject", subject);
                    cmd.Parameters.AddWithValue("announcement", announcement);
                    cmd.Parameters.AddWithValue("date_posted", datePosted);
                    cmd.Parameters.AddWithValue("sender", sender_name);
                    cmd.Parameters.AddWithValue("announcement_status", announcementStatus);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }
            }
            //display client side script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Success!", script);
            txtAnnouncement.Text = "";
            txtSubject.Text = "";
        }
        catch (Exception)
        {
            Server.Transfer("500.aspx");
        }
    }
}

