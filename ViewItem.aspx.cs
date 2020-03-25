using System;
using System.Data.SqlClient;

public partial class Admin_ViewItem : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string itemCode;
    string item;
    string category;
    string description;
    string cost;
    string sell;
    string quantity;
    string remaining_stock;
    string date_purchased;
    string status;

    public void pageLoad()
    {
        itemCode = Convert.ToString(lblProductID.Text);
        item = Convert.ToString(lblItemName.Text);
        category = Convert.ToString(lblCategory.Text);
        description = Convert.ToString(lblDescription.Text);
        cost = Convert.ToString(lblCostPrice.Text);
        sell = Convert.ToString(lblSellingPrice.Text);
        quantity = Convert.ToString(lblQuantity.Text);
        remaining_stock = Convert.ToString(lblRemainingStock.Text);
        date_purchased = Convert.ToString(lblDatePurchased.Text);
        status = Convert.ToString(lblItemStatus.Text);

        try
        {
            //transfer database values to page
            itemCode = Request.QueryString["ProductID"];
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("selectStock", con))
                    {
                        cmd.Parameters.AddWithValue("ProductID", itemCode);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                itemCode = dr["ProductID"].ToString();
                                item = dr["ItemName"].ToString();
                                category = dr["Category"].ToString();
                                description = dr["Description"].ToString();
                                cost = dr["CostPrice"].ToString();
                                sell = dr["SellingPrice"].ToString();
                                quantity = dr["Quantity"].ToString();
                                remaining_stock = dr["RemainingStock"].ToString();
                                date_purchased = dr["DatePurchased"].ToString();
                                status = dr["Status"].ToString();
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