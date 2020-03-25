using System;
using System.Text.RegularExpressions;

public partial class Employee_GiftCardList : System.Web.UI.Page
{
    Regex r;

    public bool indexSearch(string indexValue = "")
    {
        r = new Regex("[a-zA-Z0-9!/ ]*$");

        if (r.IsMatch(indexValue))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

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

    protected void btnSearchGiftcard_Click(object sender, EventArgs e)
    {
        string errorMessage = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchValue;

        searchValue = Convert.ToString(txtSearchGiftcard.Text);

        if (txtSearchGiftcard.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Giftcard WHERE (Giftcard_Number LIKE '" + searchValue + "') OR (Giftcard_Value LIKE '" + searchValue + "') OR (Customer LIKE '" + searchValue + "')";
        }
    }

    protected void btnClearEntries_Click(object sender, EventArgs e)
    {
        txtSearchGiftcard.Text = "";
    }
}