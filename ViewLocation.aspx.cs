using System;
using System.Data.SqlClient;

public partial class Admin_ViewLocation : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string locationID;
    string location;
    string address;
    string phone;
    string fax;
    string email;
    string status;

    public void pageLoad()
    {
        location = Convert.ToString(lblLocationName.Text);
        address = Convert.ToString(lblLocationAddress.Text);
        phone = Convert.ToString(lblLocationFax.Text);
        fax = Convert.ToString(lblLocationFax.Text);
        email = Convert.ToString(lblLocationEmail.Text);
        status = Convert.ToString(lblLocationStatus.Text);

        try
        {
            //transfer database values to page
            locationID = Request.QueryString["LocationID"];
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("selectLocation", con))
                    {
                        cmd.Parameters.AddWithValue("LocationID", locationID);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                location = dr["LocationName"].ToString();
                                address = dr["Address"].ToString();
                                phone = dr["PhoneNumber"].ToString();
                                fax = dr["FaxNumber"].ToString();
                                email = dr["Email"].ToString();
                                status = dr["Status"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("500.aspx");
                        }
                    }
                    dr.Close();
                    cmd.Dispose();
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
            Server.Transfer("404.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }
}