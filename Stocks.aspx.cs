using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Stocks : Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter adr;
    DataTable dt;
    ArrayList arr;
    CheckBox chkAll, chk;
    StringBuilder sb;
    StringWriter sw;
    Regex r;
    CheckBox cb;
    int i;
    string status = "ARCHIVED";
    int currentCount;
    int count;

    private string bindData(string dataBind = "")
    {
        using (con = new SqlConnection(@" Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
        {
            using (adr = new SqlDataAdapter("selectAllStocks", con))
            {
                dt = new DataTable();
                adr.Fill(dt);
                GridView1.DataBind();
                con.Close();
            }
        }
        return dataBind;
    }

    private void GetData()
    {
        if (ViewState["SelectedRecords"] != null)
        {
            arr = (ArrayList)ViewState["SelectedRecords"];
        }
        else
        {
            arr = new ArrayList();
        }

        GridView1.HeaderRow.Cells[0].FindControl("chkAll");

        for (i = 0; i <= (GridView1.Rows.Count - 1); i++)
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
                GridView1.HeaderRow.Cells[0].FindControl("chkRow");

                if (chk.Checked)
                {
                    if (!arr.Contains(GridView1.DataKeys[i].Value))
                    {
                        arr.Remove(GridView1.DataKeys[i].Value);
                    }
                }
            }
        }
        ViewState["SelectedRecords"] = arr;
    }

    private void ArchiveRecord(string productID)
    {
        using (con = new SqlConnection(@" Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf; Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("addArchivedStocks", con))
            {
                cmd.Parameters.AddWithValue("productID", productID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            using (cmd = new SqlCommand("updateArchivedStocks", con))
            {
                cmd.Parameters.AddWithValue("status", status);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            con.Close();
        }
    }

    private void showMessage(int count)
    {
        sb.Append("<script language='javascript'>");
        sb.Append("alert('");
        sb.Append(count.ToString());
        sb.Append(" record(s) archived.');");
        sb.Append("</script>");
        ClientScript.RegisterStartupScript(GetType(), "script", sb.ToString());
    }

    private void setData()
    {
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

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        setData();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        base.VerifyRenderingInServerForm(control);
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

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Admin_username"] != null)
            {
                lblItemCount.Visible = true;

                using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                    con.Open();
                {
                    using (cmd = new SqlCommand("CountTotalStocks", con))
                    {
                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblItemCount.Text = dr["totalStocks"].ToString();
                            }
                        }
                        dr.Close();
                        cmd.Dispose();
                    }
                    con.Close();
                }
            }
            else
            {
                Session.Clear();
                Server.Transfer("Login_Page.aspx");
                lblItemCount.Visible = false;
            }
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
            lblItemCount.Visible = false;
        }
    }

    protected void btnSearchItem_Click(object sender, EventArgs e)
    {
        string errorMessage = "<script language='javascript'>alert('Search field is empty!')</script>";
        string searchItem;

        searchItem = Convert.ToString(txtSearchItem.Text);

        if (txtSearchItem.Text == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorMessage);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Stocks WHERE (ItemName LIKE '" + searchItem + "') OR (Category LIKE '" + searchItem + "') OR (Descripttion LIKE '" + searchItem + "') OR (CostPrice LIKE '" + searchItem + "') OR (SellingPrice LIKE '" + searchItem + "') OR (Quantity LIKE '" + searchItem + "') OR (RemainingStock LIKE '" + searchItem + "') OR (DatePurchased LIKE '" + searchItem + "')";
        }
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearchItem.Text = "";
    }
    
    protected void btnBulkUpdate_Click(object sender, EventArgs e)
    {
        string errorScript = "<script language='javascript'>alert('There is no record in the database!')</script>";

        using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
            con.Open();
        {
            using (cmd = new SqlCommand("selectAllStocks", con))
            {
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    txtSellingPrice.Text = "";
                    txtQuantity.Text = "";
                    txtItemName.Text = "";
                    txtItemCategory.Text = "";
                    txtDescription.Text = "";
                    txtCostPrice.Text = "";
                    mpStocks.Show();
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "Something went wrong...", errorScript);
                    Server.TransferRequest(Request.Url.AbsolutePath, false);
                }
                dr.Close();
                cmd.Dispose();
            }
            con.Close();
        }
    }

    protected void btnArchive_Click(object sender, EventArgs e)
    {
        count = 0;
        setData();
        GridView1.AllowPaging = false;
        GridView1.DataBind();

        arr = (ArrayList)ViewState["SelectedRecords"];

        count = arr.Count;

        for (i = 0; i <= (GridView1.Rows.Count - 1); i++)
        {
            if (arr.Contains(GridView1.DataKeys[i].Value))
            {
                ArchiveRecord(GridView1.DataKeys[i].Value.ToString());
                arr.Remove(GridView1.DataKeys[i].Value);
            }
        }
        ViewState["SelectedRecords"] = arr;
        hfCount.Value = "0";
        GridView1.AllowPaging = true;
        bindData();
        showMessage(count);
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Stocks.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        HtmlTextWriter hw;

        hw = new HtmlTextWriter(sw);

        bool isSelected = false;

        foreach (GridViewRow i in GridView1.Rows)
        {
            i.FindControl("chkRow");

            if (cb != null && cb.Checked)
            {
                isSelected = true;
            }
        }

        if (isSelected)
        {
            GridView gvExport = GridView1;

            gvExport.Columns[0].Visible = false;
            gvExport.Columns[5].Visible = false;
            gvExport.Columns[6].Visible = false;

            foreach (GridViewRow i in GridView1.Rows)
            {
                gvExport.Rows[i.RowIndex].Visible = false;
                i.FindControl("chkRow");
                if (cb != null && cb.Checked)
                {
                    gvExport.Rows[i.RowIndex].Visible = true;
                }
                gvExport.CssClass = "textmode";
            }
            gvExport.RenderControl(hw);
            string style = "<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.End();
        }
    }

    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        Server.Transfer("AddItem.aspx");
    }

    protected void btnUpdateItem_Click(object sender, EventArgs e)
    {
        string itemName, itemCategory, itemDescription;
        int itemCost, itemSellingPrice, itemQuantity;

        string updateScript = "<script language='javascript'>alert('You have successfully updated the items in the database!')</script>";

        itemName = Convert.ToString(txtItemName.Text);
        itemCategory = Convert.ToString(txtItemCategory.Text);
        itemDescription = Convert.ToString(txtDescription.Text);
        itemCost = Convert.ToInt32(txtCostPrice.Text);
        itemSellingPrice = Convert.ToInt32(txtSellingPrice.Text);
        itemQuantity = Convert.ToInt32(txtQuantity.Text);

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("updateBulkItems", con))
                {
                    cmd.Parameters.AddWithValue("ItemName", itemName);
                    cmd.Parameters.AddWithValue("ItemCategory", itemCategory);
                    cmd.Parameters.AddWithValue("ItemDescription", itemDescription);
                    cmd.Parameters.AddWithValue("ItemCost", itemCost);
                    cmd.Parameters.AddWithValue("SellingPrice", itemSellingPrice);
                    cmd.Parameters.AddWithValue("ItemQuantity", itemQuantity);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                con.Close();
            }

            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You're good to go...", updateScript);
            Server.TransferRequest(Request.Url.AbsolutePath, false);

            txtItemName.Text = "";
            txtItemCategory.Text = "";
            txtDescription.Text = "";
            txtCostPrice.Text = "";
            txtSellingPrice.Text = "";
            txtQuantity.Text = "";
        }
        catch (Exception)
        {
            Session.Clear();
            Server.Transfer("500.aspx");
        }
    }

    protected void btnCleanup_Click(object sender, EventArgs e)
    {
        string status = "DELETED";
        string deleteScript = "<script language='javascript'>alert('You have successfully cleanup old stock list!')</script>";
        string errorDelete = "<script language='javascript'>alert('Unfortunately, there are no records of old stock list that needs to be cleaned up.')</script>";

        try
        {
            using (con = new SqlConnection(@"Data Source = ARIES - PC\SQLEXPRESS; AttachDbFilename = D:\Visual Studio 2015 Web Forms\POS_with_Inventory\Database\Point_Of_Sales.mdf;Integrated Security = True"))
                con.Open();
            {
                using (cmd = new SqlCommand("SelectTotalArchivedStocks", con))
                {
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        using (cmd = new SqlCommand("addTrashStocks", con))
                        {
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("updateTrashStocks", con))
                        {
                            cmd.Parameters.AddWithValue("trashStatus", status);
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                        using (cmd = new SqlCommand("deleteArchivedStocks", con))
                        {
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            //load deleteScript
                            Page.ClientScript.RegisterClientScriptBlock(GetType(), "Success", deleteScript);
                            //reload the page
                            Server.TransferRequest(Request.Url.AbsolutePath, false);
                        }
                    }
                    dr.Close();
                }
                cmd.Dispose();
                con.Close();
            }
        }
        catch (Exception)
        {
            //call the error delete exception
            Page.ClientScript.RegisterClientScriptBlock(GetType(), "You might want to check it first...", errorDelete);
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
    }
}