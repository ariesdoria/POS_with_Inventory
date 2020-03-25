using System;
using System.Data.SqlClient;

public partial class Employee_index : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    int accountNum;
    string passWord;
    string error = "<script language='javascript'>alert('Account number and password don't match!')</script>";


    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        accountNum = Convert.ToInt32(txtAccountNumber.Text);
        passWord = Convert.ToString(txtPassword.Text);
        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True")) 
                con.Open();
            {
                using (cmd = new SqlCommand("employeeLogin", con))
                {
                    cmd.Parameters.AddWithValue("empAccount", accountNum);
                    cmd.Parameters.AddWithValue("empPassword", passWord);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        Session["empAccount"] = accountNum;
                        Session["empPassword"] = passWord;
                        Session["emp_username"] = accountNum;
                        Server.Transfer("~/Employee/EmployeeMainPage.aspx");
                        txtAccountNumber.Text = "";
                        txtPassword.Text = "";
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong..", error);
                    }
                    dr.Close();
                    cmd.Dispose();
                    con.Close();
                    txtAccountNumber.Text = "";
                    txtPassword.Text = "";
                }
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }
}