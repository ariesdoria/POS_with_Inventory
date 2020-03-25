using System;
using System.Data.SqlClient;


public partial class Admin_Login_Page : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string adminUsername;
    string adminPassword;
    //error scripts
    string first_error_Username = "<script language='javascript'>alert('Username and password must not be empty!')</script>";
    string second_error_Username = "<script language='javascript'>alert('Username or password must not be empty!')</script>";
    //success scripts
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //login function
    public void loginVerification()
    {
        adminUsername = Convert.ToString(txtUsername.Text);
        adminPassword = Convert.ToString(txtPassword.Text);

        if (txtUsername.Text == "" || txtPassword.Text == "")
        {
            if (txtUsername.Text == "" && txtPassword.Text == "")
            {
                //display client side script
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", second_error_Username);
                //reload the page
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            //display client side script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", first_error_Username);
            //reload the page
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            try
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("adminLogin", con))
                    {
                        cmd.Parameters.AddWithValue("admin_username", adminUsername);
                        cmd.Parameters.AddWithValue("admin_password", adminPassword);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            Session["admin_username"] = adminUsername;
                            Session["admin_password"] = adminPassword;
                            Response.Redirect("AdminMainPage.aspx");
                            txtUsername.Text = "";
                            txtPassword.Text = "";
                        }
                        else
                        {
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Text = "Username and password don't match!";
                            Label1.Visible = true;
                        }
                        dr.Close();
                        cmd.Dispose();
                        con.Close();
                    }
                }
                //clear textbox values
                txtPassword.Text = "";
                txtUsername.Text = "";
            }
            catch (Exception)
            {
                Server.Transfer("404.aspx");
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //call login function
        loginVerification();
    }
}