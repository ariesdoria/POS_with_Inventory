using System;
using System.Data.SqlClient;
public partial class Admin_AdminMainPage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin_username"] != null)
        {
            try
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    //count and display total customers
                    using (cmd = new SqlCommand("countTotalCustomers", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblCustomers.Visible = true;
                                lblCustomers.Text = dr["totalCustomers"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblCustomers.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total employees
                    using (cmd = new SqlCommand("countTotalEmployees", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblEmployees.Visible = true;
                                lblEmployees.Text = dr["totalEmployees"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblEmployees.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total exchange items
                    using (cmd = new SqlCommand("countTotalExchangedItems", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblExchangedItems.Visible = true;
                                lblExchangedItems.Text = dr["totalExchanges"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblExchangedItems.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count & display total giftcards
                    using (cmd = new SqlCommand("CountTotalGiftCards", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblGiftCards.Visible = true;
                                lblGiftCards.Text = dr["totalGiftcard"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblGiftCards.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total stocks
                    using (cmd = new SqlCommand("countTotalStocks", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblStocks.Visible = true;
                                lblStocks.Text = dr["totalStocks"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblStocks.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total locations
                    using (cmd = new SqlCommand("CountTotalLocation", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblLocations.Visible = true;
                                lblLocations.Text = dr["totalLocation"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblLocations.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total sales
                    using (cmd = new SqlCommand("CountTotalSales", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblSales.Visible = true;
                                lblSales.Text = dr["totalSales"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblSales.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total profit
                    using (cmd = new SqlCommand("CountTotalProfit", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblProfit.Visible = true;
                                lblProfit.Text = dr["totalProfit"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblProfit.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total return items
                    using (cmd = new SqlCommand("CountTotalReturnedItems",con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblReturnedItems.Visible = true;
                                lblReturnedItems.Text = dr["totalReturns"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblReturnedItems.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    //count and display total announcements
                    using (cmd = new SqlCommand("CountTotalAnnouncements",con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblAnnouncements.Visible = true;
                                lblAnnouncements.Text = dr["totalAnnouncements"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("Login_Page.aspx");
                            lblAnnouncements.Visible = false;
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    con.Close();
                }
            }
            catch (Exception)
            {
                Session.Clear();
                Server.Transfer("Login_Page.aspx");
                //make the count stats invisible to the user
                lblAnnouncements.Visible = false;
                lblCustomers.Visible = false;
                lblEmployees.Visible = false;
                lblExchangedItems.Visible = false;
                lblGiftCards.Visible = false;
                lblLocations.Visible = false;
                lbLocations.Visible = false;
                lblProfit.Visible = false;
                lblReturnedItems.Visible = false;
                lblSales.Visible = false;
                lblStocks.Visible = false;
            }
        }
    }
}