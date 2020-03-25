using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class Employee_EmployeeSalesTransaction : Page
{
    SqlConnection con;
    SqlDataAdapter adapt;
    SqlCommand cmd;
    SqlDataReader dr;
    DataTable dt;
    CheckBox chkAll, chk;
    StringBuilder sb;
    int i, currentCount, count;

    /*Functions*/
    private string bindData(string dataBind = "")
    {
        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (adapt = new SqlDataAdapter("selectAllEmployeeOrders", con))
                {
                    dt = new DataTable();
                    adapt.Fill(dt);
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
        return dataBind;
    }

    private void deleteItem(string OrderID)
    {
        string status = "DELETED";

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                //insert into trash orders
                using (cmd = new SqlCommand("addTrashEmployeeOrders2", con))
                {
                    cmd.Parameters.AddWithValue("orderID", OrderID);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                //update status
                using (cmd = new SqlCommand("updateTrashEmployeeOrders", con))
                {
                    cmd.Parameters.AddWithValue("status", status);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                //delete employee orders
                using (cmd = new SqlCommand("deleteEmployeeOrders2",con))
                {
                    cmd.Parameters.AddWithValue("orderID", OrderID);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                con.Close();
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    private void getData()
    {
        ArrayList arr;
        if (ViewState["SelectedRecords"] !=  null)
        {
            arr = (ArrayList)ViewState["SelectedRecords"];
        }
        else
        {
            arr = new ArrayList();
        }

        GridView1.HeaderRow.Cells[0].FindControl("chkAll");

        for (i = 0; i <= (GridView1.Rows.Count -1); i++)
        {
            if (chkAll.Checked)
            {
                if (!arr.Contains(GridView1.DataKeys[i].Value))
                {
                    arr.Add(GridView1.DataKeys[i].Value);
                }
            }
            else
            {
                GridView1.Rows[i].Cells[0].FindControl("chkRow");

                if (chk.Checked)
                {
                    if (!arr.Contains(GridView1.DataKeys[i].Value))
                    {
                        arr.Add(GridView1.DataKeys[i].Value);
                    }
                    else
                    {
                        if (arr.Contains(GridView1.DataKeys[i].Value))
                        {
                            arr.Remove(GridView1.DataKeys[i].Value);
                        }
                    }
                }
            }
        }
        ViewState["SelectedRecords"] = arr;
    }

    private void setData()
    {
        ArrayList arr;
        currentCount = 0;

        GridView1.HeaderRow.Cells[0].FindControl("chkAll");
        chkAll.Checked = true;

        arr = (ArrayList)ViewState["SelectedRecords"];

        for (i = 0; i <= (GridView1.Rows.Count - 1); i++)
        {
            GridView1.Rows[i].Cells[0].FindControl("chkRow");

            if (chk != null)
            {
                chk.Checked = arr.Contains(GridView1.DataKeys[i].Value);
                if (!chk.Checked)
                {
                    chk.Checked = false;
                }
                else
                {
                    currentCount += 1;
                }
            }
        }
        hfCount.Value = (arr.Count - currentCount).ToString();
    }
    
    private void showMessage(int count)
    {
        sb.Append("<script language='javascript'>");
        sb.Append("alert('");
        sb.Append(count.ToString());
        sb.Append(" order(s) removed.');");
        sb.Append("</script>");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        Server.TransferRequest(Request.Url.AbsolutePath, false);
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        setData();
    }

    //Page load events and button functions
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_username"] != null)
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("CountTotalItemOrdes", con))
                {
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtCartItems.Text = dr["totalItems"].ToString();
                            txtCartItems.Style["text-align"] = "center";
                        }
                    }
                    dr.Close();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("CountTotalOrders", con))
                {
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtSubTotal.Text = dr["totalOrders"].ToString();
                            txtSubTotal.Style["text-align"] = "center";
                        }
                    }
                    dr.Close();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("SelectTotalPriceOrders",con))
                {
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtAmountDue.Text = dr["totalPrice"].ToString();
                        }
                    }
                    dr.Close();
                    cmd.Dispose();
                }
            }
            con.Close();
            getData();
            bindData();
        }
        else
        {
            Session.Clear();
            Server.Transfer("index.aspx");
        }
    }

    protected void btnComputeTotal_Click(object sender, EventArgs e)
    {
        int totalCash, totalAmount, totalChange;

        totalCash = Convert.ToInt32(txtCashAmount.Text);
        totalAmount = Convert.ToInt32(txtAmountDue.Text);
        totalChange = Convert.ToInt32(txtChange.Text);

        //Compute total amount
        totalChange = totalCash - totalAmount;
    }

    protected void btnCompleteSale_Click(object sender, EventArgs e)
    {
        string employee, customer, payMode;
        int productID, itemQuantity, cashAmount;
        string profitStatus = "ACTIVE";
        string salesStatus = "ACTIVE";
        string orderStatus = "DELETED";
        string salesPrompt = "<script language='javascript'>alert('You have successfully completed a sale!')</script>";

        customer = Convert.ToString(txtCustomer.Text);
        payMode = Convert.ToString(ddlPaymentMode.SelectedValue);
        cashAmount = Convert.ToInt32(txtCashAmount.Text);
        employee = Session["emp_username"].ToString();
        productID = (int)Session["ProductID"];
        itemQuantity = (int)Session["Quantity"];

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addSales", con))
                {
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("updateSales", con))
                {
                    cmd.Parameters.AddWithValue("@salesStatus", salesStatus);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("addProfit",con))
                {
                    cmd.Parameters.AddWithValue("profitAmount", cashAmount);
                    cmd.Parameters.AddWithValue("employeeName", employee);
                    cmd.Parameters.AddWithValue("payMode", payMode);
                    cmd.Parameters.AddWithValue("customerName", customer);
                    cmd.Parameters.AddWithValue("dateReceived", DateTime.Today.ToShortDateString());
                    cmd.Parameters.AddWithValue("profitStatus", profitStatus);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("updateStocks2", con))
                {
                    cmd.Parameters.AddWithValue("quantity", itemQuantity);
                    cmd.Parameters.AddWithValue("productID", productID);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                con.Close();
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", salesPrompt);
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }

            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("addTrashEmployeeOrders",con))
                {
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("updateTrashEmployeeOrders",con))
                {
                    cmd.Parameters.AddWithValue("status", orderStatus);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("deleteEmployeeOrders",con))
                {
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                con.Close();
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            txtCartItems.Text = "";
            txtSubTotal.Text = "";
            txtAmountDue.Text = "";
            ddlPaymentMode.SelectedIndex = 0;
            txtCashAmount.Text = "";
            txtCustomer.Text = "";
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnRemoveOrder_Click(object sender, EventArgs e)
    {
        string status = "DELETED";
        string messagePrompt = "<script language='javascript'>alert('You have just cancelled an order transaction!')</script>";

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("removeEmployeeOrders",con))
                {
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                using (cmd = new SqlCommand("updateTrashEmployeeOrders",con))
                {
                    cmd.Parameters.AddWithValue("status", status);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", messagePrompt);
                    Server.TransferRequest(Request.Url.AbsolutePath, false);
                }
                using (cmd = new SqlCommand("deleteEmployeeOrders",con))
                {
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }
                Server.TransferRequest(Request.Url.AbsolutePath, false);

                txtCartItems.Text = "";
                txtSubTotal.Text = "";
                txtAmountDue.Text = "";
                ddlPaymentMode.SelectedIndex = 0;
                txtCashAmount.Text = "";
                txtCustomer.Text = "";
                txtChange.Text = "";
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnRemoveItem_Click(object sender, EventArgs e)
    {
        ArrayList arr;

        count = 0;
        setData();
        GridView1.AllowPaging = false;
        GridView1.DataBind();

        arr = (ArrayList)ViewState[ "SelectedRecords"];
        count = arr.Count;

        for (i = 0; i <= (GridView1.Rows.Count - 1); i++)
        {
            if (arr.Contains(GridView1.DataKeys[i].Value))
            {
                deleteItem(GridView1.DataKeys[i].Value.ToString());
                arr.Remove(GridView1.DataKeys[i].Value);
            }
        }
        ViewState["SelectedRecords"] = arr;
        hfCount.Value = "0";
        GridView1.AllowPaging = true;
        bindData();
        showMessage(count);
    }
}