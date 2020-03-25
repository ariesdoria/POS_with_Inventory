using System;
using System.Data.SqlClient;

public partial class Employee_EmployeeProfile : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["emp_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("SelectEmployeeLogin", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblEmpAccountNo.Text = dr["empAccountNumber"].ToString();
                                lblEmpFirstName.Text = dr["empFirstname"].ToString();
                                lblEmpLastName.Text = dr["empLastname"].ToString();
                                lblEmpGender.Text = dr["empGender"].ToString();
                                lblEmpBMonth.Text = dr["empBmonth"].ToString();
                                lblEmpBDay.Text = dr["empBday"].ToString();
                                lblEmpBYear.Text = dr["empByear"].ToString();
                                lblEmpPhoneNo.Text = dr["empPhone"].ToString();
                                lblEmpLocation.Text = dr["empLocation"].ToString();
                                lblEmpComments.Text = dr["empComments"].ToString();
                                lblDateHired.Text = dr["date_hired"].ToString();
                            }
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
                Server.Transfer("index.aspx");
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Server.Transfer("UpdateProfile.aspx");
    }
}