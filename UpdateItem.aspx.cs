using System;
using System.Data.SqlClient;

public partial class Admin_UpdateItem : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string itemCode;
    string itemName;
    string itemCategory;
    string itemDesc;
    string itemCost;
    string itemSell;
    string itemQuantity;
    //success script
    string success_script = "<script language='javascript'>alert('You have successfully updated an item in the database!')</script>";
    //page load and update item functions
    public void pageLoad()
    {
        //transfer database values to page
        itemCode = Request.QueryString["ProductID"];
        try
        {
            if (Session["Admin_username"] != null)
            {
                con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True");
                con.Open();
                cmd = new SqlCommand("selectStock", con);
                cmd.Parameters.AddWithValue("ProductID", itemCode);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblItemID.Text = dr["ProductID"].ToString();
                    }
                }
                dr.Close();
                cmd.Dispose();
                con.Close();
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

    public void updateItem()
    {
        itemName = Convert.ToString(txtItemName.Text);
        itemCategory = Convert.ToString(txtCategory.Text);
        itemDesc = Convert.ToString(txtDescription.Text);
        itemCost = Convert.ToString(txtCostPrice.Text);
        itemSell = Convert.ToString(txtSellingPrice.Text);
        itemQuantity = Convert.ToString(txtQuantity.Text);

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("updateStocks1", con))
                {
                    cmd.Parameters.AddWithValue("ProductID", itemCode);
                    cmd.Parameters.AddWithValue("ProductName", itemName);
                    cmd.Parameters.AddWithValue("ProductCategory", itemCategory);
                    cmd.Parameters.AddWithValue("ProductDesc", itemDesc);
                    cmd.Parameters.AddWithValue("ProductCostPrice", itemCost);
                    cmd.Parameters.AddWithValue("ProductSellingPrice", itemSell);
                    cmd.Parameters.AddWithValue("ProductQuantity", itemQuantity);
                    cmd.Parameters.AddWithValue("RemainingProduct", itemQuantity);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            //display client side script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Successfully updated an item!", success_script);
            //reload the page
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            //empty the textboxes
            txtItemName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtCostPrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
            txtItemName.Focus();
        }
        catch (Exception)
        {
            Response.Redirect("500.html");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }

    protected void btnUpdateItem_Click(object sender, EventArgs e)
    {
        updateItem();
    }
}