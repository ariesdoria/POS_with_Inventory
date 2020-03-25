using System;
using System.Data.SqlClient;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("selectAdmin", con))
                    {
                        cmd.Parameters.AddWithValue("@username", Session["Admin_username"]);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblAdminfname.Text = dr["admin_fname"].ToString();
                                lblAdminlname.Text = dr["admin_lname"].ToString();
                                Label1.Text = dr["admin_fname"].ToString();
                                Label2.Text = dr["admin_lname"].ToString();
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

    protected void lblLogout1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Server.Transfer("Login_Page.aspx");
    }

    protected void lbLogout2_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Server.Transfer("Login_Page.aspx");
    }
}
