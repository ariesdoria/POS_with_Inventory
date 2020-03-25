using System;
using System.Data.SqlClient;

public partial class Admin_ViewReturnedItem : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string returnID;
    string item;
    string category;
    string description;
    string cost;
    string sell;
    string quantity;
    string condition;
    string date_returned;

    public void pageLoad()
    {
        item = Convert.ToString(lblItemName.Text);
        category = Convert.ToString(lblCategory.Text);
        description = Convert.ToString(lblDescription.Text);
        cost = Convert.ToString(lblCostPrice.Text);
        sell = Convert.ToString(lblSellingPrice.Text);
        quantity = Convert.ToString(lblQuantity.Text);
        condition = Convert.ToString(lblCondition.Text);
        date_returned = Convert.ToString(lblDateReturned.Text);

        try
        {
            //transfer database values to page
            returnID = Request.QueryString["returnID"];
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("viewItem_Return", con))
                    {
                        cmd.Parameters.AddWithValue("returnID", returnID);
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
                                condition = dr["Condition"].ToString();
                                date_returned = dr["DateReturned"].ToString();
                            }
                        }
                        else
                        {
                            Session.Clear();
                            Server.Transfer("500.aspx");
                        }
                    }
                    dr.Close();
                    cmd.Dispose();
                    con.Close();
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