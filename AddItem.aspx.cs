using System;
using System.Data.SqlClient;

public partial class Admin_AddItem : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    //for variable conversion
    int productId;
    int costPrice;
    int sellingPrice;
    int quantity;
    string itemName;
    string category;
    string description;
    string datePurchased;
    string status = "ACTIVE";
    //error scripts
    string first_errorScript = "<script language='javascript'>alert('The value of the selling price must be higher than the cost price!')</script>";
    string second_errorScript = "<script language='javascript'>alert('The value of the selling price must not be equal to zero!')</script>";
    string third_errorScript = "<script language='javascript'>alert('The value of the cost price must not be equal to zero!')</script>";
    string fourth_errorScript = "<script language='javascript'>alert('There is already an item with the specified product ID!')</script>";
    //success scripts
    string success_Script = "<script language='javascript'>alert('You have sucessfully added an item!')</script>";
    //page load and add item functions
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

    public void addItem()
    {
        productId = Convert.ToInt32(txtProductID.Text);
        costPrice = Convert.ToInt32(txtCostPrice.Text);
        sellingPrice = Convert.ToInt32(txtSellingPrice.Text);
        quantity = Convert.ToInt32(txtQuantity.Text);
        itemName = Convert.ToString(txtItemName.Text);
        category = Convert.ToString(txtCategory.Text);
        description = Convert.ToString(txtDescription.Text);
        datePurchased = Convert.ToString(DateTime.Today.ToShortDateString());

        try
        {
            if (sellingPrice <= costPrice)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", first_errorScript);
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            else if (sellingPrice == 0)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", second_errorScript);
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            else if (costPrice == 0)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", third_errorScript);
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            else
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (new SqlCommand("addStocks", con))
                    {
                        cmd.Parameters.AddWithValue("ProductID", productId);
                        cmd.Parameters.AddWithValue("ProductName", itemName);
                        cmd.Parameters.AddWithValue("ProductCategory", category);
                        cmd.Parameters.AddWithValue("ProductDesc", description);
                        cmd.Parameters.AddWithValue("ProductCostPrice", costPrice);
                        cmd.Parameters.AddWithValue("ProductSellingPrice", sellingPrice);
                        cmd.Parameters.AddWithValue("ProductQuantity", quantity);
                        cmd.Parameters.AddWithValue("RemainingProduct", quantity);
                        cmd.Parameters.AddWithValue("ProductPurchased", datePurchased);
                        cmd.Parameters.AddWithValue("ProductStatus", status);
                        cmd.ExecuteNonQuery();
                    }
                    cmd.Dispose();
                    con.Close();
                }
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", success_Script);
                Server.TransferRequest(Request.Url.AbsolutePath, false);

                txtProductID.Text = "";
                txtItemName.Text = "";
                txtCategory.Text = "";
                txtDescription.Text = "";
                txtCostPrice.Text = "";
                txtSellingPrice.Text = "";
                txtQuantity.Text = "";
                txtProductID.Focus();
            }
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", fourth_errorScript);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            txtProductID.Text = "";
            txtItemName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtCostPrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
            txtProductID.Focus();
        } 
}

    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }

    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        addItem();
    }
}