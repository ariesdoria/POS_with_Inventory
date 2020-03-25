using System;
using System.Data.SqlClient;
public partial class Admin_UpdateLocation : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string locationID;
    string locationName;
    string locationAddress;
    string locationPhone;
    string locationFax;
    string locationEmail;
    string success_script = "<script language='javascript'>alert('You have successfully updated a location in the database!')</script>";
    //page load and update location function

    public void pageLoad()
    {
        try
        {
            if (Session["Admin_username"] != null)
            {

            }
            else
            {
                Session.Abandon();
                Server.Transfer("Login_Page.aspx;");
            }
        }
        catch (Exception)
        {
            Server.Transfer("404.aspx");
        }
    }

    public void updateLocation()
    {
        //Transfer database values to page
        locationID = Request.QueryString["LocationID"];

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("updateLocation", con))
                {
                    cmd.Parameters.AddWithValue("LocationID", locationID);
                    cmd.Parameters.AddWithValue("LocationName", locationName);
                    cmd.Parameters.AddWithValue("LocationAddress", locationAddress);
                    cmd.Parameters.AddWithValue("PhoneNum", locationPhone);
                    cmd.Parameters.AddWithValue("FaxNum", locationFax);
                    cmd.Parameters.AddWithValue("LocationEmail", locationEmail);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            //display client side script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Successfully updated a location", success_script);
            //reload the page
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            //empty the textboxes
            txtLocationName.Text = "";
            txtLocationAddress.Text = "";
            txtLocationPhoneNo.Text = "";
            txtLocationFax.Text = "";
            txtLocationEmail.Text = "";
            txtLocationName.Focus();
        }
        catch (Exception)
        {
            Response.Redirect("500.html");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }

    protected void btnUpdateLocation_Click(object sender, EventArgs e)
    {
        updateLocation();
    }
       
}