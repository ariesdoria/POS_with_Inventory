using System;
using System.Data.SqlClient;

public partial class Employee_EmployeeReturnAndExchanged : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_username"] != null)
        {

        }
        else
        {
            Session.Clear();
            Server.Transfer("index.aspx");
        }
    }

    protected void btnSearchItem_Click(object sender, EventArgs e)
    {
        int productID;
        string itemName;

        productID = Convert.ToInt32(txtSearchItem.Text);
        itemName = Convert.ToString(txtSearchItem.Text);

        string errorMessage = "<script language='javascript'>alert('There is no item match with the product number or name that you entered!')</script>";

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("selectStock", con))
                {
                    cmd.Parameters.AddWithValue("ProductID", productID);
                    cmd.Parameters.AddWithValue("ProductName", itemName);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtReturnItemNumber.Text = dr["ProductID"].ToString();
                            txtReturnItemNumber.Style["text-align"] = "center";
                            txtReturnItemName.Text = dr["ItemName"].ToString();
                            txtReturnItemName.Style["text-align"] = "center";
                            txtReturnItemCategory.Text = dr["Category"].ToString();
                            txtReturnItemCategory.Style["text-align"] = "center";
                            txtItemDescription.Text = dr["Description"].ToString();
                            txtItemDescription.Style["text-align"] = "center";
                            txtCostPrice.Text = dr["CostPrice"].ToString();
                            txtCostPrice.Style["text-align"] = "center";
                            txtSellingPrice.Text = dr["SellingPrice"].ToString();
                            txtSellingPrice.Style["text-align"] = "center";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
                        Server.TransferRequest(Request.Url.AbsolutePath, false);
                    }
                    dr.Close();
                    cmd.Dispose();
                    con.Close();
                }
                txtReturnItemName.Text = "";
                txtReturnItemCategory.Text = "";
                txtItemDescription.Text = "";
                txtCostPrice.Text = "";
                txtSellingPrice.Text = "";
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnReturnItem_Click(object sender, EventArgs e)
    {

        string status = "ACTIVE";
        string returnStatus = "<script language='javascript'>alert('You have successfully returned an item!')</script>";
        int productID, productCost, productSellingPrice, productQuantity;
        string productName, productCategory, productDescription, productCondition, productReturned;

        productID = Convert.ToInt32(txtReturnItemNumber.Text);
        productCost = Convert.ToInt32(txtCostPrice.Text);
        productSellingPrice = Convert.ToInt32(txtSellingPrice.Text);
        productQuantity = Convert.ToInt32(txtQuantity.Text);

        productName = Convert.ToString(txtReturnItemName.Text);
        productCategory = Convert.ToString(txtReturnItemCategory.Text);
        productDescription = Convert.ToString(txtItemDescription.Text);
        productCondition = Convert.ToString(txtItemCondition.Text);
        productReturned = Convert.ToString(DateTime.Today.ToShortDateString());

        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("addItemReturn", con))
            {
                cmd.Parameters.AddWithValue("ProductID", productID);
                cmd.Parameters.AddWithValue("ProductName", productName);
                cmd.Parameters.AddWithValue("ProductCategory", productCategory);
                cmd.Parameters.AddWithValue("ProductDesc", productDescription);
                cmd.Parameters.AddWithValue("ProductCostPrice", productCost);
                cmd.Parameters.AddWithValue("productSellingPrice", productSellingPrice);
                cmd.Parameters.AddWithValue("ProductQuantity", productQuantity);
                cmd.Parameters.AddWithValue("ProductCondition", productCondition);
                cmd.Parameters.AddWithValue("ProductReturned", productReturned);
                cmd.Parameters.AddWithValue("ProductStatus", status);
                cmd.ExecuteNonQuery();
            }
            cmd.Dispose();
            con.Close();
        }
        Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", returnStatus);
        Server.TransferRequest(Request.Url.AbsolutePath, false);

        txtReturnItemNumber.Text = "";
        txtReturnItemName.Text = "";
        txtReturnItemCategory.Text = "";
        txtItemDescription.Text = "";
        txtCostPrice.Text = "";
        txtSellingPrice.Text = "";
        txtQuantity.Text = "";
        txtItemCondition.Text = "";
    }

    protected void btnCancelReturn_Click(object sender, EventArgs e)
    {
        txtSearchItem.Text = "";
        txtReturnItemNumber.Text = "";
        txtReturnItemName.Text = "";
        txtReturnItemCategory.Text = "";
        txtItemDescription.Text = "";
        txtCostPrice.Text = "";
        txtSellingPrice.Text = "";
        txtQuantity.Text = "";
        txtItemCondition.Text = "";
    }

    protected void btnExchangeItem_Click(object sender, EventArgs e)
    {
        string status = "ACTIVE";
        string errorMessage = "<script langauge='javascript'>alert('You must specify the returning item first before making any item exchanges')</script>";
        string exchangeStatus = "<script language='javascript'>alert('You have successfully exchanged an item!')</script>";

        int exProductID, exProductCost, exProductSellPrice, exProductQuantity;
        string exProductName, exProductCategory, exProductDesc, exDate;

        exProductID = Convert.ToInt32(txtExchangeProductID.Text);
        exProductCost = Convert.ToInt32(txtExCostPrice.Text);
        exProductSellPrice = Convert.ToInt32(txtExCostPrice.Text);
        exProductQuantity = Convert.ToInt32(txtItemQuantity.Text);

        exProductName = Convert.ToString(txtExchangeItemName.Text);
        exProductCategory = Convert.ToString(txtExchangeCategory.Text);
        exProductDesc = Convert.ToString(txtDescription.Text);
        exDate = Convert.ToString(DateTime.Today.ToShortDateString());

        if (txtReturnItemName.Text == "" || txtReturnItemCategory.Text == "" || txtItemDescription.Text == "" || txtCostPrice.Text == "" ||txtSellingPrice.Text == "" || txtQuantity.Text == ""|| txtItemCondition.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);    
        }
        else
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addItemExchange", con))
                {
                    cmd.Parameters.AddWithValue("ProductID", exProductID);
                    cmd.Parameters.AddWithValue("ProductName", exProductName);
                    cmd.Parameters.AddWithValue("ProductCategory", exProductCategory);
                    cmd.Parameters.AddWithValue("ProductDesc", exProductDesc);
                    cmd.Parameters.AddWithValue("ProductCostPrice", exProductSellPrice);
                    cmd.Parameters.AddWithValue("ProductSellingPrice", exProductSellPrice);
                    cmd.Parameters.AddWithValue("ProductQuantity", exProductQuantity);
                    cmd.Parameters.AddWithValue("ProductExchanged", exDate);
                    cmd.Parameters.AddWithValue("ProductStatus", status);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", exchangeStatus);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        txtExchangeProductID.Text = "";
        txtExchangeItemName.Text = "";
        txtExchangeCategory.Text = "";
        txtDescription.Text = "";
        txtExCostPrice.Text = "";
        txtItemQuantity.Text = "";
    }

    protected void btnCancelExchange_Click(object sender, EventArgs e)
    {
        txtExchangeProductID.Text = "";
        txtExchangeItemName.Text = "";
        txtExchangeCategory.Text = "";
        txtDescription.Text = "";
        txtExCostPrice.Text = "";
        txtItemQuantity.Text = "";
    }

    protected void btnSearchNewItem_Click(object sender, EventArgs e)
    {
        int productID;
        string itemName;

        productID = Convert.ToInt32(txtSearchItem.Text);
        itemName = Convert.ToString(txtSearchItem.Text);

        string errorSearch = "<script language='javascript'>alert('There is no product that matches with the item you entered!')</script>";

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("selectStock", con))
                {
                    cmd.Parameters.AddWithValue("ProductID", productID);
                    cmd.Parameters.AddWithValue("ProductName", itemName);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtExchangeProductID.Text = dr["ProductID"].ToString();
                            txtExchangeProductID.Style["text-align"] = "center";
                            txtExchangeItemName.Text = dr["ItemName"].ToString();
                            txtExchangeItemName.Style["text-align"] = "center";
                            txtExchangeCategory.Text = dr["Category"].ToString();
                            txtExchangeCategory.Style["text-align"] = "center";
                            txtDescription.Text = dr["Description"].ToString();
                            txtDescription.Style["text-align"] = "center";
                            txtExCostPrice.Text = dr["CostPrice"].ToString();
                            txtExCostPrice.Style["text-align"] = "center";
                            txtExSellingPrice.Text = dr["SellingPrice"].ToString();
                            txtExSellingPrice.Style["text-align"] = "center";
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorSearch);
                        Server.TransferRequest(Request.Url.AbsolutePath, false);
                    }
                    dr.Close();
                    cmd.Dispose();
                    con.Close();
                }
                txtExchangeItemName.Text = "";
                txtExchangeCategory.Text = "";
                txtDescription.Text = "";
                txtExCostPrice.Text = "";
                txtSellingPrice.Text = "";
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }
}