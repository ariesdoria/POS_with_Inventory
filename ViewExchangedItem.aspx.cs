using System;
using System.Data.SqlClient;
public partial class Admin_ViewExchangedItem : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string itemExchangeID;
    string item;
    string category;
    string description;
    string cost;
    string sell;
    string quantity;
    string date_exchange;

    public void pageLoad()
    {
        item = Convert.ToString(lblItemName.Text);
        category = Convert.ToString(lblCategory.Text);
        description = Convert.ToString(lblDescription.Text);
        cost = Convert.ToString(lblCostPrice.Text);
        sell = Convert.ToString(lblSellingPrice.Text);
        quantity = Convert.ToString(lblQuantity.Text);
        date_exchange = Convert.ToString(lblDateExchange.Text);

        try
        {
            //transfer database values to page
            itemExchangeID = Request.QueryString["exchangeID"];
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("viewItem_Exchange", con))
                    {
                        cmd.Parameters.AddWithValue("exchangeID", con);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                item = dr["ItemName"].ToString();
                                category = dr["Category"].ToString();
                                description = dr["Description"].ToString();
                                cost = dr["CostPrice"].ToString();
                                sell = dr["SellingPrice"].ToString();
                                quantity = dr["Quantity"].ToString();
                                date_exchange = dr["DateExchanged"].ToString();
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