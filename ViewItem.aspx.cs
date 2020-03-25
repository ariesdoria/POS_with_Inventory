using System;
using System.Data.SqlClient;

public partial class Employee_ViewItem : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string itemCode;


    protected void Page_Load(object sender, EventArgs e)
    {
        itemCode = Request.QueryString["ProductID"];

        try
        {
            if (Session["emp_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("selectStock2",con))
                    {
                        cmd.Parameters.AddWithValue("itemcode", itemCode);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblProductID.Text = dr["ProductID"].ToString();
                                lblItemName.Text = dr["ItemName"].ToString();
                                lblCategory.Text = dr["Category"].ToString();
                                lblDescription.Text = dr["Description"].ToString();
                                lblCostPrice.Text = dr["CostPrice"].ToString();
                                lblSellingPrice.Text = dr["SellingPrice"].ToString();
                                lblQuantity.Text = dr["Quantity"].ToString();
                                lblRemainingStock.Text = dr["RemainingStock"].ToString();
                                lblDatePurchased.Text = dr["DatePurchased"].ToString();
                                lblItemStatus.Text = dr["Status"].ToString();
                            }
                            dr.Close();
                        }
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
}