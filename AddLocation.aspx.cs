using System;
using System.Data.SqlClient;

public partial class Admin_AddLocation : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    //for variable conversion
    string locationName;
    string locationAddress;
    string locationPhone;
    string locationFax;
    string locationEmail;
    string locationStatus = "ACTIVE";   
    //success script
    string success_Script = "<script language='javascript'>alert('You have successfully added a new location!')</script>";
    //error script
    string error_Script = "<script language='javascript'>alert('There is already a location with the specified location number!')</script>";

    //page load and add location function
    public void pageLoad()
    {
        try
        {
            if (Session["Admin_username"] != null)
            {

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

    public void addLocation()
    {
        locationName = Convert.ToString(txtLocationName.Text);
        locationAddress = Convert.ToString(txtLocationAddress.Text);
        locationPhone = Convert.ToString(txtLocationNumber.Text);
        locationFax = Convert.ToString(txtLocationFax.Text);
        locationEmail = Convert.ToString(txtLocationEmail.Text);

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addLocation", con))
                {
                    cmd.Parameters.AddWithValue("LocationName", locationName);
                    cmd.Parameters.AddWithValue("LocationAddress", locationAddress);
                    cmd.Parameters.AddWithValue("PhoneNum", locationPhone);
                    cmd.Parameters.AddWithValue("FaxNum", locationFax);
                    cmd.Parameters.AddWithValue("LocationEmail", locationEmail);
                    cmd.Parameters.AddWithValue("LocationStatus", locationStatus);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            //load script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Success", success_Script);
            //reload the page by itself
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            //empty the textboxes
            txtLocationName.Text = "";
            txtLocationAddress.Text = "";
            txtLocationNumber.Text = "";
            txtLocationFax.Text = "";
            txtLocationEmail.Text = "";
            txtLocationName.Focus();
        }
        catch (Exception)
        {
            //load error script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", error_Script);
            //reload the page by itself
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            //empty the textboxes
            txtLocationName.Text = "";
            txtLocationAddress.Text = "";
            txtLocationNumber.Text = "";
            txtLocationFax.Text = "";
            txtLocationEmail.Text = "";
            txtLocationName.Focus();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }

    protected void btnAddLocation_Click(object sender, EventArgs e)
    {
        addLocation();
    }
}