using System;
using System.Data.SqlClient;

public partial class Employee_UpdateProfile : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;


    protected void Page_Load(object sender, EventArgs e)
    {
        string errorMessage = "<script language='javascript'>alert('There is no employee with the given account number!')</script>";

        try
        {
            if (Session["emp_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
                {
                    using (cmd = new SqlCommand("SelectEmployeeLogin", con))
                    {
                        cmd.Parameters.AddWithValue("empUsername", Session["emp_username"]);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblAccountNumber.Text = dr["empAccountNumber"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("index.aspx");
                        }
                        dr.Close();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        
    }

    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        string password, fname, lname, gender, Bmonth, location, description;
        int Bday, Byear, phone;
        //Success and error messages
        string updatePrompt = "<script language='javascript'>alert('You have successfully updated your profile!')</script>";
        string recaptchaNotValid = "<script language='javascript'>alert('The captcha text that you entered is not valid!')</script>";
        string recaptchaNull = "<script language='javascript'>alert('Please enter the correct captcha text!')</script>";

        password = Convert.ToString(txtEmpPassword.Text);
        fname = Convert.ToString(txtEmpFirstName.Text);
        lname = Convert.ToString(txtEmpLastName.Text);
        gender = Convert.ToString(ddlEmpGender.SelectedValue);
        Bmonth = Convert.ToString(ddlEmpMonth.SelectedValue);
        location = Convert.ToString(ddlEmpLocation.SelectedValue);
        description = Convert.ToString(txtEmpComments.Text);
        Bday = Convert.ToInt32(txtEmpDate.Text);
        Byear = Convert.ToInt32(txtEmpYear.Text);
        phone = Convert.ToInt32(txtEmpPhone.Text);

        try
        {
            if (!recaptcha.IsValid)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", recaptchaNotValid);
                Server.TransferRequest(Request.Url.AbsolutePath, false);  
            }
            else if(recaptcha == null)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", recaptchaNull);
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            else if(recaptcha.IsValid)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("updateEmployee", con))
                    {
                        cmd.Parameters.AddWithValue("empPassword", password);
                        cmd.Parameters.AddWithValue("empFname", fname);
                        cmd.Parameters.AddWithValue("empLname", lname);
                        cmd.Parameters.AddWithValue("empGender", gender);
                        cmd.Parameters.AddWithValue("empBmonth", Bmonth);
                        cmd.Parameters.AddWithValue("empBday", Bday);
                        cmd.Parameters.AddWithValue("empByear", Byear);
                        cmd.Parameters.AddWithValue("empPhone", phone);
                        cmd.Parameters.AddWithValue("empLocation", location);
                        cmd.Parameters.AddWithValue("empComments", description);
                        cmd.Parameters.AddWithValue("empAccountNumber", Session["emp_username"]);
                        cmd.ExecuteNonQuery();
                    }
                    cmd.Dispose();
                    con.Close();

                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", updatePrompt);
                    Server.TransferRequest(Request.Url.AbsolutePath, false);

                    txtEmpPassword.Text = "";
                    txtEmpFirstName.Text = "";
                    txtEmpLastName.Text = "";
                    ddlEmpGender.SelectedIndex = 0;
                    ddlEmpMonth.SelectedIndex = 0;
                    ddlEmpLocation.SelectedIndex = 0;
                    txtEmpDate.Text = "";
                    txtEmpYear.Text = "";
                    txtEmpPhone.Text = "";
                    txtEmpComments.Text = "";
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