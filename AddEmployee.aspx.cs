using System;
using System.Data.SqlClient;

public partial class Admin_AddEmployee : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string status = "ACTIVE";
    //for variable conversion
    int accountNo;
    int empDate;
    int empYear;
    string passWord;
    string Fname;
    string Lname;
    string empGender;
    string empMonth;
    string empPhone;
    string empLocation;
    string empComments;
    string empHired;
    string script = "<script language='javascript'>alert('You successfully added a new employee!')</script>";
    string errorScript = "<script language='javascript'>alert('There is already an employee with the given account number!')</script>";

    //page load and add employee functions
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

    public void addEmployee()
    {
        accountNo = Convert.ToInt32(txtAccountNo.Text);
        empDate = Convert.ToInt32(txtEmpDate.Text);
        empYear = Convert.ToInt32(txtEmpYear.Text);
        passWord = Convert.ToString(txtEmpPassword.Text);
        Fname = Convert.ToString(txtEmpFirstName.Text);
        Lname = Convert.ToString(txtEmpLastName.Text);
        empGender = Convert.ToString(ddlEmpGender.SelectedValue);
        empMonth = Convert.ToString(ddlEmpMonth.SelectedValue);
        empPhone = Convert.ToString(txtEmpPhone.Text);
        empLocation = Convert.ToString(ddlEmpLocation.SelectedValue);
        empComments = Convert.ToString(txtEmpComments.Text);
        empHired = Convert.ToString(DateTime.Today.ToShortDateString());

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addEmployee", con))
                {
                    cmd.Parameters.AddWithValue("empAccountNum", accountNo);
                    cmd.Parameters.AddWithValue("empPassword", passWord);
                    cmd.Parameters.AddWithValue("empFname", Fname);
                    cmd.Parameters.AddWithValue("empLname", Lname);
                    cmd.Parameters.AddWithValue("empGender", empGender);
                    cmd.Parameters.AddWithValue("empBmonth", empMonth);
                    cmd.Parameters.AddWithValue("empBday", empDate);
                    cmd.Parameters.AddWithValue("empByear", empYear);
                    cmd.Parameters.AddWithValue("empPhone", empPhone);
                    cmd.Parameters.AddWithValue("empLocation", empLocation);
                    cmd.Parameters.AddWithValue("empComments", empComments);
                    cmd.Parameters.AddWithValue("empDateHired", empHired);
                    cmd.Parameters.AddWithValue("empStatus", status);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }

            //display client side script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Success!", script);
            //reload the page
            Server.TransferRequest(Request.Url.AbsolutePath, false);

            txtAccountNo.Focus();
            //clear textbox values
            txtAccountNo.Text = "";
            txtEmpPassword.Text = "";
            txtEmpFirstName.Text = "";
            txtEmpLastName.Text = "";
            ddlEmpGender.SelectedIndex = 0;
            ddlEmpMonth.SelectedIndex = 0;
            txtEmpDate.Text = "";
            txtEmpYear.Text = "";
            txtEmpPhone.Text = "";
            ddlEmpLocation.SelectedIndex = 0;
            txtEmpComments.Text = "";
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", errorScript);
            Server.TransferRequest(Request.Url.AbsolutePath, false);

            txtAccountNo.Text = "";
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
    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }

    protected void btnAddEmployee_Click(object sender, EventArgs e)
    {
        addEmployee();
    }    
}