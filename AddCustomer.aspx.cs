using System;
using System.Data.SqlClient;

public partial class Employee_AddCustomer : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string status = "ACTIVE";
    /*scripts*/
    string successScript = "<script language='javascript'>alert('You've successfully added a new customer!')</script>";
    string errorScript = "<script language='javascript'>alert('Customer name should not be empty!')</script>";
    string errorScript2 = "<script language='javascript'>alert('Phone number shoud not be empty!')</script>";
    string errorScript3 = "<script language='javascript'>alert('Address should not be empty!')</script>";

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

    protected void btnAddCustomer_Click(object sender, EventArgs e)
    {
        string fname, lname, email, phone, address, city, state, country, comments, company;
        int zip;

        fname = Convert.ToString(txtCusFname.Text);
        lname = Convert.ToString(txtCusLname.Text);
        email = Convert.ToString(txtCusEmail.Text);
        phone = Convert.ToString(txtCusPhone.Text);
        address = Convert.ToString(txtCusAddress.Text);
        city = Convert.ToString(txtCusCity.Text);
        state = Convert.ToString(txtCusState.Text);
        country = Convert.ToString(ddlCusLocation.SelectedValue);
        comments = Convert.ToString(txtCusComments.Text);
        company = Convert.ToString(txtCusCompany.Text);
        zip = Convert.ToInt32(txtCusZip.Text);

        /*Conditional alerts*/
        if (txtCusFname.Text == "" && txtCusLname.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong..", errorScript);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else if (txtCusPhone.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong..", errorScript2);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else if (txtCusAddress.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong..", errorScript3);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
            {
                using (cmd = new SqlCommand("addCustomer", con))
                {
                    cmd.Parameters.AddWithValue("cusFname", fname);
                    cmd.Parameters.AddWithValue("cusLname", lname);
                    cmd.Parameters.AddWithValue("cusEmail", email);
                    cmd.Parameters.AddWithValue("cusPhone", phone);
                    cmd.Parameters.AddWithValue("cusAddress", address);
                    cmd.Parameters.AddWithValue("cusCity", city);
                    cmd.Parameters.AddWithValue("cusState", state);
                    cmd.Parameters.AddWithValue("cusZip", zip);
                    cmd.Parameters.AddWithValue("cusCountry", country);
                    cmd.Parameters.AddWithValue("cusComments", comments);
                    cmd.Parameters.AddWithValue("cusCompany", company);
                    cmd.Parameters.AddWithValue("cusStatus", status);
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                con.Close();
            }
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go..", successScript);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        txtCusFname.Text = "";
        txtCusLname.Text = "";
        txtCusEmail.Text = "";
        txtCusPhone.Text = "";
        txtCusAddress.Text = "";
        txtCusCity.Text = "";
        txtCusState.Text = "";
        txtCusZip.Text = "";
        ddlCusLocation.SelectedIndex = 0;
        txtCusComments.Text = "";
        txtCusCompany.Text = "";
        txtCusFname.Focus();
    }
}