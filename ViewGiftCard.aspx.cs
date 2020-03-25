using System;
using System.Data.SqlClient;

public partial class Employee_ViewGiftCard : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        string giftcardNum = Request.QueryString["Giftcard_Number"];

        try
        {
            if (Session["emp_username"] != null)
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
                                lblGiftCardNumber.Text = dr["Giftcard_Number"].ToString();
                                lblGiftCardValue.Text = dr["Giftcard_Value"].ToString();
                                lblCustomer.Text = dr["Customer"].ToString();
                                lblStatus.Text = dr["Status"].ToString();
                            }
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