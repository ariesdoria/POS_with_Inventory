using System;
using System.Data.SqlClient;

public partial class Admin_ViewEmployee : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string emp_id;
    string accountNum;
    string password;
    string fname;
    string lname;
    string gender;
    string bmonth;
    string bday;
    string byear;
    string phone;
    string location;
    string comments;
    string date_hired;
    string status;

    public void pageLoad()
    {
        accountNum = Convert.ToString(lblEmpAccountNo.Text);
        bday = Convert.ToString(lblEmpBday.Text);
        byear = Convert.ToString(lblEmpBYear.Text);
        password = Convert.ToString(lblEmpPassword.Text);
        fname = Convert.ToString(lblEmpFirstName.Text);
        lname = Convert.ToString(lblEmpLastName.Text);
        gender = Convert.ToString(lblEmpGender.Text);
        bmonth = Convert.ToString(lblEmpBMonth.Text);
        phone = Convert.ToString(lblEmpPhoneNo.Text);
        location = Convert.ToString(lblLocation.Text);
        comments = Convert.ToString(lblEmpComments.Text);
        status = Convert.ToString(lblStatus.Text);
        date_hired = Convert.ToString(lblDateHired.Text);

        try
        {
            //transfer database values to page
            emp_id = Request.QueryString["empAccountNumber"];
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("viewEmployee", con))
                    {
                        cmd.Parameters.AddWithValue("empAccountNumber", con);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                accountNum = dr["empAccountNumber"].ToString();
                                password = dr["emp_password"].ToString();
                                fname = dr["empFirstname"].ToString();
                                lname = dr["empLastname"].ToString();
                                gender = dr["empGender"].ToString();
                                bmonth = dr["empBmonth"].ToString();
                                bday = dr["empBday"].ToString();
                                byear = dr["empByear"].ToString();
                                phone = dr["empPhone"].ToString();
                                location = dr["empLocation"].ToString();
                                comments = dr["empComments"].ToString();
                                date_hired = dr["date_hired"].ToString();
                                status = dr["empStatus"].ToString();
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
            Server.Transfer("404.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();  
    }
}