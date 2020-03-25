using System;
using System.Data.SqlClient;

public partial class Employee_ViewAnnouncement : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        string announce_id;

        announce_id = Request.QueryString["announcement_id"];

        try
        {
            if (Session["emp_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("selectAnnouncement", con))
                    {
                        cmd.Parameters.AddWithValue("announcement_id", announce_id);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblDatePosted.Text = dr["date_posted"].ToString();
                                LblSender.Text = dr["sender_name"].ToString();
                                lblAnnouncement.Text = dr["announcement"].ToString();
                                lblStatus.Text = dr["announcement_status"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                        con.Close();
                    }
                }
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
}