using System;
using System.Web.UI;
using System.Text.RegularExpressions;

public partial class Employee_CustomerList : Page
{
    Regex r;

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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string errorMessage = "<script language='javascript'>alert('Search field is empty!')</script>";
        string selectInput;

        selectInput = Convert.ToString(txtSearchCustomer.Text);

        if (txtSearchCustomer.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Customer WHERE (Firstname LIKE '" + selectInput + "') OR (Lastname LIKE '" + selectInput + "') OR (Email LIKE '" + selectInput + "') OR (PhoneNumber LIKE '" + selectInput + "') OR (Address LIKE '" + selectInput + "') OR (Country LIKE '" + selectInput + "') OR (CompanyName LIKE '" + selectInput + "')";
        }
    }


    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchCustomer.Text = "";
    }

    public bool regExpress(string input)
    {
        r = new Regex("[a-zA-Z0-9!/ ]*$");
        if (r.IsMatch(input))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}