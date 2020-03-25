using System;
using System.Data.SqlClient;

public partial class Admin_AddGiftCard : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string status = "ACTIVE";
    //for variable conversion
    int giftCard;
    int giftCardValue;
    string customer;
    string script = "<script language='javascript'>alert('You have successfully added a new giftcard!')</script>";
    string errorScript = "<script language='javascript'>alert('There is already a giftcard with the specified giftcard value!')></script>";


    //page load and add giftcard functions
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

    public void addGiftCard()
    {
        giftCard = Convert.ToInt32(txtGiftcardNo.Text);
        giftCardValue = Convert.ToInt32(txtGiftcardValue.Text);
        customer = Convert.ToString(txtCustomer.Text);

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addGiftCard", con))
                {
                    cmd = new SqlCommand("addGiftCard", con);
                    cmd.Parameters.AddWithValue("giftCardNum", giftCard);
                    cmd.Parameters.AddWithValue("giftCardValue", giftCardValue);
                    cmd.Parameters.AddWithValue("Customer", customer);
                    cmd.Parameters.AddWithValue("Status", status);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            //display client side script message
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Success", script);
            //reload the page
            Server.TransferRequest(Request.Url.AbsolutePath, false);

            txtGiftcardNo.Text = "";
            txtGiftcardValue.Text = "";
            txtCustomer.Text = "";
            txtGiftcardNo.Focus();
        }
        catch (Exception)
        {
            //display client side script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something is bad", errorScript);
            //reload the page
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            txtCustomer.Text = "";
            txtGiftcardNo.Text = "";
            txtGiftcardValue.Text = "";
            txtGiftcardNo.Focus();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        pageLoad();
    }

    protected void btnAddGiftcard_Click(object sender, EventArgs e)
    {
        addGiftCard();
    }
}