using System;
using System.Data.SqlClient;

public partial class MasterPages_EmployeeMasterPage : System.Web.UI.MasterPage
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
                        cmd.Parameters.AddWithValue("empUsername", Session["emp_username"]);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                Label1.Text = dr["empFirstname"].ToString();
                                Label2.Text = dr["empFirstname"].ToString();
                                Label3.Text = dr["empLastname"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    using (cmd = new SqlCommand("countTotalAnnouncements",con ))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblAnnouncements.Text = dr["totalAnnouncements"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    using (cmd = new SqlCommand("countTotalStocks", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblStocks.Text = dr["totalStocks"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    using (cmd = new SqlCommand("CountTotalCustomers", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblCustomers.Text = dr["totalCustomers"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    using (cmd = new SqlCommand("CountTotalGiftCards", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblGiftcards.Text = dr["totalGiftcard"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    using (cmd = new SqlCommand("CountTotalOrders", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblOrders.Text = dr["totalOrders"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    con.Close();
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

    protected void lblLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Server.Transfer("index.aspx");
    }

    protected void btnNewSalesTransaction_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Server.Transfer("EmployeeMainPage.aspx");
    }

    protected void btnProfileAndSettings_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Server.Transfer("EmployeeProfile.aspx");
    }
}
