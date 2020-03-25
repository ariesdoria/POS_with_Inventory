using System;
using System.Drawing;
using System.Data.SqlClient;


public partial class Admin_ResetPassword : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string username;
    string password;
    string script = "<script language='javascript'>alert('The username for the account does not exist!')</script>";

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void resetPassword()
    {
        username = Convert.ToString(txtUsername.Text);
        password = Convert.ToString(txtConfirmPassword.Text);

        if(txtNewPassword.Text != txtConfirmPassword.Text)
        {
            Label2.ForeColor = Color.Red;
            Label2.Text = "Password's don't match! Please try again.";
            Label2.Visible = true;
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        else
        {
            try
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                {
                    con.Open();
                    using (cmd = new SqlCommand("selectAdmin", con))
                    {
                        cmd.Parameters.AddWithValue("username", username);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                            {
                                con.Open();
                                {
                                    using (cmd = new SqlCommand("updateAdmin", con))
                                    {
                                        cmd.Parameters.AddWithValue("adminPassword", password);
                                        cmd.Parameters.AddWithValue("adminUserName", username);
                                        cmd.ExecuteNonQuery();
                                    }
                                }
                                cmd.Dispose();
                                con.Close();
                            }
                        }
                        else
                        {
                            //display client side script
                            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", script);
                            //reload the page
                            Server.TransferRequest(Request.Url.AbsolutePath, false);
                        }
                    }
                    dr.Close();
                    cmd.Dispose();
                    con.Close();
                    //show message and empty textboxes
                    Label2.ForeColor = Color.Green;
                    Label2.Text = "Password successfully changed!";
                    Label2.Visible = true;
                    txtUsername.Text = "";
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
            }
            catch (Exception)
            {
                Server.Transfer("500.aspx");
                txtUsername.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }
    }

    protected void btnResetpassword_Click(object sender, EventArgs e)
    {
        resetPassword();
    }
}