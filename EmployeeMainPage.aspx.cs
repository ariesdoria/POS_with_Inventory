using System;
using System.Web.UI;
using System.Data.SqlClient;

public partial class Employee_EmployeeMainPage : Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string status = "ACTIVE";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
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
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnSearchItem_Click(object sender, EventArgs e)
    {
        string errorSearch = "<script language='javascript'>alert('There is no matching product with the given product number!')</script>";
        int productID;
        string itemName;

        productID = Convert.ToInt32(txtSearchItem.Text);
        itemName = Convert.ToString(txtSearchItem.Text);

        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("selectEmployeeStocks", con))
            {
                cmd.Parameters.AddWithValue("productID", productID);
                cmd.Parameters.AddWithValue("itemName", itemName);
                dr = cmd.ExecuteReader();
                try
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtProductID.Text = dr["ProductID"].ToString();
                            txtProductID.Style["text-align"] = "center";
                            txtItemName.Text = dr["ItemName"].ToString();
                            txtItemName.Style["text-align"] = "center";
                            txtCategory.Text = dr["Category"].ToString();
                            txtCategory.Style["text-align"] = "center";
                            txtDescription.Text = dr["Description"].ToString();
                            txtDescription.Style["text-align"] = "center";
                            txtCostPrice.Text = dr["CostPrice"].ToString();
                            txtCostPrice.Style["text-align"] = "center";
                            txtSellingPrice.Text = dr["SellingPrice"].ToString();
                            txtSellingPrice.Style["text-align"] = "center";
                            txtRemainingStock.Text = dr["RemainingStock"].ToString();
                            txtRemainingStock.Style["text-align"] = "center";
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
                catch (Exception)
                {
                    Session.Clear();
                    Server.Transfer("500.aspx");
                }
            }
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchItem.Text = "";
    }

    protected void btnAddOrder_Click(object sender, EventArgs e)
    {
        int productID, sellingPrice, itemQuantity, itemCost, remainingItem;
        string itemName, category, description, dateOrdered;
        string status = "ACTIVE";
        //error messages
        string orderError = "<script language='javascript'>alert('Order quantity is more than the remaining quantity!')</script>";
        string orderError2 = "<script language='javascript'>alert('You must specify the number of orders!')</script>";
        string stockError = "<script language='javascript'>alert('There is insufficeient number of the specific item. Try another item!')</script>";

        productID = Convert.ToInt32(txtProductID.Text);
        itemName = Convert.ToString(txtItemName.Text);
        category = Convert.ToString(txtCategory.Text);
        description = Convert.ToString(txtDescription.Text);
        itemCost = Convert.ToInt32(txtCostPrice.Text);
        sellingPrice = Convert.ToInt32(txtSellingPrice.Text);
        itemQuantity = Convert.ToInt32(txtQuantity.Text);
        remainingItem = Convert.ToInt32(txtRemainingStock.Text);
        dateOrdered = Convert.ToString(DateTime.Today.ToShortDateString());

        Session["ProductID"] = txtProductID.Text;
        Session["Quantity"] = txtQuantity.Text;

        if (itemQuantity > remainingItem)
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", orderError);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            txtSearchItem.Text = "";
            txtProductID.Text = "";
            txtItemName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtCostPrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
            txtRemainingStock.Text = "";
        }
        else if ( itemQuantity <= 0 )
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", orderError2);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            txtSearchItem.Text = "";
            txtProductID.Text = "";
            txtItemName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtCostPrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
            txtRemainingStock.Text = "";
        }
        else if ( remainingItem <= 0 )
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", stockError);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            txtSearchItem.Text = "";
            txtProductID.Text = "";
            txtItemName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtCostPrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
            txtRemainingStock.Text = "";
        }
        else
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addEmployeeOrders", con))
                {
                    cmd.Parameters.AddWithValue("productID", productID);
                    cmd.Parameters.AddWithValue("itemName", itemName);
                    cmd.Parameters.AddWithValue("category", category);
                    cmd.Parameters.AddWithValue("description", description);
                    cmd.Parameters.AddWithValue("costPrice", itemCost);
                    cmd.Parameters.AddWithValue("sellingPrice", sellingPrice);
                    cmd.Parameters.AddWithValue("orderQuantity", itemQuantity);
                    cmd.Parameters.AddWithValue("dateOrdered", dateOrdered);
                    cmd.Parameters.AddWithValue("status", status);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
            }
            Server.Transfer(Request.RawUrl);
            txtProductID.Text = "";
            txtSearchItem.Text = "";
            txtItemName.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtCostPrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
            txtRemainingStock.Text = "";
        }
    }

    protected void btnAddGiftcard_Click(object sender, EventArgs e)
    {
        //success and error scripts
        string giftcardError = "<script language='javascript'>alert('There is already a giftcard with the specified number!')</script>";
        string giftcardStatus = "<script language='javascript'>alert('You have successfully added a giftcard!')</script>";
        int giftcardNum, giftcardValue;
        string customer;

        giftcardNum = Convert.ToInt32(txtGiftcardNumber.Text);
        giftcardValue = Convert.ToInt32(txtGiftcardValue.Text);
        customer = Convert.ToString(txtCustomer.Text);
        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addGiftCard", con))
                {
                    cmd.Parameters.AddWithValue("giftCardNum", giftcardNum);
                    cmd.Parameters.AddWithValue("giftCardValue", giftcardValue);
                    cmd.Parameters.AddWithValue("Customer", customer);
                    cmd.Parameters.AddWithValue("Status", status);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go..", giftcardStatus);
                Server.TransferRequest(Request.Url.AbsolutePath, false);
                txtGiftcardNumber.Text = "";
                txtGiftcardValue.Text = "";
                txtCustomer.Text = "";
            }
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", giftcardError);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            txtGiftcardNumber.Text = "";
            txtGiftcardValue.Text = "";
            txtCustomer.Text = "";
        }
    }

    protected void btnAddCustomer_Click(object sender, EventArgs e)
    {
        string cusFname, cusLname, cusEmail, cusPhone, cusAddress, cusCity, cusState, cusCountry, cusComments, cusCompany;
        int cusZip;
        string insertPrompt = "<script language='javascript'>alert('You have successfully added a new customer!')</script>";

        cusFname = Convert.ToString(txtCusFname.Text);
        cusLname = Convert.ToString(txtCusLname.Text);
        cusEmail = Convert.ToString(txtCusEmail.Text);
        cusPhone = Convert.ToString(txtCusPhone.Text);
        cusAddress = Convert.ToString(txtCusAddress.Text);
        cusCity = Convert.ToString(txtCusCity.Text);
        cusState = Convert.ToString(txtCusState.Text);
        cusCountry = Convert.ToString(ddlCusLocation.SelectedValue);
        cusComments = Convert.ToString(txtCusComments.Text);
        cusCompany = Convert.ToString(txtCusCompanyName.Text);
        cusZip = Convert.ToInt32(txtCusZip.Text);

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addCustomer", con))
                {
                    cmd.Parameters.AddWithValue("cusFname", cusFname);
                    cmd.Parameters.AddWithValue("cusLname", cusLname);
                    cmd.Parameters.AddWithValue("cusEmail", cusEmail);
                    cmd.Parameters.AddWithValue("cusPhone", cusPhone);
                    cmd.Parameters.AddWithValue("cusAddress", cusAddress);
                    cmd.Parameters.AddWithValue("cusCity", cusCity);
                    cmd.Parameters.AddWithValue("cusState", cusState);
                    cmd.Parameters.AddWithValue("cusZip", cusZip);
                    cmd.Parameters.AddWithValue("cusCountry", cusCountry);
                    cmd.Parameters.AddWithValue("cusComments", cusComments);
                    cmd.Parameters.AddWithValue("cusCompany", cusCompany);
                    cmd.Parameters.AddWithValue("cusStatus", status);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", insertPrompt);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            txtCusFname.Text = "";
            txtCusLname.Text = "";
            txtCusEmail.Text = "";
            txtCusPhone.Text = "";
            txtCusAddress.Text = "";
            txtCusCity.Text = "";
            txtCusState.Text = "";
            txtCusZip.Text = "";
            txtCusComments.Text = "";
            txtCusCompanyName.Text = "";
            ddlCusLocation.SelectedIndex = 0;
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }
}