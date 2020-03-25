using System;
using System.Data.SqlClient;

public partial class Admin_ViewGiftCard : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string giftcardNum;
    string giftcardVal;
    string customer;
    string status;

    public void pageLoad()
    {
        giftcardNum = Convert.ToString(lblGiftCardNumber.Text);
        giftcardVal = Convert.ToString(lblGiftCardValue.Text);
        customer = Convert.ToString(lblCustomer.Text);
        status = Convert.ToString(lblStatus.Text);

        try
        {
            //transfer database values to page
            giftcardNum = Request.QueryString["giftCardNum"];

            if (Session["Admin_username"] != null)
            {
                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("selectGiftCard", con))
                    {
                        cmd.Parameters.AddWithValue("giftCardNum", giftcardNum);
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                giftcardNum = dr["Giftcard_Number"].ToString();
                                giftcardVal = dr["Giftcard_Value"].ToString();
                                customer = dr["Customer"].ToString();
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