using System;
using System.Text.RegularExpressions;
using System.Web.UI;

public partial class Employee_Stocks : Page
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

    protected void btnSearchItem_Click(object sender, EventArgs e)
    {
        string errorMessage = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchField;

        searchField = Convert.ToString(txtSearchItem.Text);

        if (txtSearchItem.Text =="")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Stocks WHERE (ProductID LIKE '" + searchField + "') OR (ItemName LIKE '" + searchField + "') OR (Category LIKE '" + searchField + "') OR (Description LIKE '" + searchField + "') OR (CostPrice LIKE '" + searchField + "') OR (SellingPrice LIKE '" + searchField + "') OR (Quantity LIKE '" + searchField + "') OR (RemainingStock LIKE '" + searchField + "') OR (DatePurchased LIKE '" + searchField + "') OR (Status LIKE '" + searchField + "')";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchItem.Text = "";
    }
}