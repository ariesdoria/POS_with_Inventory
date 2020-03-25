using System;
using System.Data.SqlClient;

public partial class Employee_AddGiftCard : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    
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
            Server.Transfer("500.aspx");
        }
    }

    protected void btnAddGiftcard_Click(object sender, EventArgs e)
    {
        string status = "ACTIVE";
        string customer;
        int giftCardNum, giftCardValue;

        //success and error scripts
        string successScript = "<script language='javascript'>alert('You have successfully added a giftcard!')</script>";
        string errorScript = "<script language='javascript'>alert('There is already a giftcard with the specified giftcard value!')</script>";
        string errorMessage = "<script language='javascript'>alert('One or more field(s) is empty!')</script>";

        customer = Convert.ToString(txtCustomer.Text);
        giftCardNum = Convert.ToInt32(txtGiftcardNo.Text);
        giftCardValue = Convert.ToInt32(txtGiftcardValue.Text);

        if (txtCustomer.Text == "" || txtGiftcardNo.Text == "" || txtGiftcardValue.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            try
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("addGiftCard", con))
                    {
                        cmd.Parameters.AddWithValue("giftCardNum", giftCardNum);
                        cmd.Parameters.AddWithValue("giftCardValue", giftCardValue);
                        cmd.Parameters.AddWithValue("Customer", customer);
                        cmd.Parameters.AddWithValue("Status", status);
                        cmd.ExecuteNonQuery();
                    }
                    cmd.Dispose();
                    con.Close();
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go..", successScript);
                    txtGiftcardNo.Text = "";
                    txtGiftcardValue.Text = "";
                    txtCustomer.Text = "";
                    txtGiftcardNo.Focus();
                }
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong..", errorScript);
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
        }
    }
}