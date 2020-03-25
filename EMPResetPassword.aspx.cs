using System;
using System.Data.SqlClient;

public partial class Employee_EMPResetPassword : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    int employeeID;
    string newPassword;
    string errorUpdate = "<script language='javascript'>alert('There is an error in updating the password!')</script>";
    string errorUpdate2 = "<script language='javascript'>alert('There is no record for the selected employee!')</script>";
    /*protected void Page_Load(object sender, EventArgs e)
    {

    }*/

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        employeeID = Convert.ToInt32(txtEmployeeID.Text);
        newPassword = Convert.ToString(txtConfirmPassword.Text);

        if (txtNewPassword.Text != txtConfirmPassword.Text)
        {
            Label2.ForeColor = System.Drawing.Color.Red;
            Label2.Text = "Passwords don't match!";
            Label2.Visible = true;
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        else
        {
            try
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("SelectEmployeeLogin", con))
                    {
                        cmd.Parameters.AddWithValue("empUsername", employeeID);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            using (cmd = new SqlCommand("updateEmployeePassword",con))
                            {
                                cmd.Parameters.AddWithValue("empPassword", newPassword);
                                cmd.Parameters.AddWithValue("empAccountNum", employeeID);
                                cmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorUpdate2);
                            Server.TransferRequest(Request.Url.AbsolutePath, false);
                        }
                        cmd.Dispose();
                    }
                }
                dr.Close();
                cmd.Dispose();
                con.Close();

                Label2.ForeColor = System.Drawing.Color.Green;
                Label2.Text = "Password successfully changed!";
                Label2.Visible = true;
                txtEmployeeID.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";

            }
            catch (Exception)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorUpdate);
                txtEmployeeID.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }
    }
}