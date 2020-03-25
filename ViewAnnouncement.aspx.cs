using System;
using System.Data.SqlClient;

public partial class Admin_ViewAnnouncement : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string announce_id;
    string datePosted;
    string sender;
    string subject;
    string status;

    public void pageLoad()
    {
        datePosted = Convert.ToString(lblDatePosted.Text);
        sender = Convert.ToString(LblSender.Text);
        subject = Convert.ToString(lblSubject.Text);
        status = Convert.ToString(lblStatus.Text);

        try
        {
            //transfer database values to page
            announce_id = Request.QueryString["announcement_id"];
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("viewAnnouncement", con))
                    {
                        cmd.Parameters.AddWithValue("announcement_id", announce_id);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                datePosted = dr["date_posted"].ToString();
                                sender = dr["sender_name"].ToString();
                                subject = dr["announcement_subject"].ToString();
                                status = dr["announcement_status"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("500.aspx");
                        }
                        dr.Close();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
            else
            {
                Session.Abandon();
                Server.Transfer("Login_Page.aspx");
            }
        }
        catch (Exception)
        {
            Server.Transfer("404.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();  
    }
}