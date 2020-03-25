using System;
using System.Data.SqlClient;

public partial class Admin_UpdateGiftCard : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string giftCardNumber;
    string giftCardValue;
    string customer;
    //sucess script
    string success_script="<script language='javascript'>alert('You have successfully updated a giftcard in the database!')</script>";

    public void pageLoad()
    {
        //transfer database values to page
        giftCardNumber = Request.QueryString["giftCardNum"];
        try
        {
            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("selectGiftCard", con))
                    {
                        cmd.Parameters.AddWithValue("giftCardNum", giftCardNumber);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                txtGiftCardNumber.Text = dr["Giftcard_Number"].ToString();
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
                }
            }
            else
            {
                Server.Transfer("500.aspx");
            }
        }
        catch (Exception)
        {
            Server.Transfer("404.aspx");
        }
    }

    public void updateGiftCard()
    {
        giftCardValue = Convert.ToString(txtGiftCardValue.Text);
        customer = Convert.ToString(txtCustomer.Text);

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("updateGiftCard", con))
                {
                    cmd = new SqlCommand("updateGiftCard", con);
                    cmd.Parameters.AddWithValue("giftCardNum", giftCardNumber);
                    cmd.Parameters.AddWithValue("giftcardValue", giftCardValue);
                    cmd.Parameters.AddWithValue("Customer", customer);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            //display client side script
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Sucess", success_script);
            //reload the page
            Server.TransferRequest(Request.Url.AbsolutePath, false);
            //empty the textboxes
            txtCustomer.Text = "";
            txtGiftCardValue.Text = "";
            txtGiftCardValue.Focus();
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

    protected void btnUpdateGiftcard_Click(object sender, EventArgs e)
    {
        updateGiftCard();
    }
}