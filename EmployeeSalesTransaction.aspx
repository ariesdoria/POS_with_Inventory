<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeSalesTransaction.aspx.cs" Inherits="Employee_EmployeeSalesTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function confirmDelete() {
            var i;
            var count = document.getElementById("<%=hfCount.ClientID %>").value;
            var gv = document.getElementById("<%=GridView1.ClientID%>");
            var chkRow = gv.getElementsByTagName("input");
            for ( i = 0; i < chkRow.length; i++)
            {
                if(chkRow[i].checked && chkRow[i].id.indexOf("chkAll") == -1 )
                {
                    count++;
                }
            }
            if(count == 0)
            {
                alert("No orders to be removed!");
                return;
            }
            else
            {
                return confirm("Do you want to remove" + count + " item(s) on the order list?");
            }        
        }
    </script>
     <style type="text/css">
        .divCartItems{
            margin-left:900px;
            margin-top:-620px;
            width:300px;
            height:450px;
        }
        .divOrderTab{
            margin-left:150px;
            margin-top:30px;
        }
        .divOrderTable{
            margin-left:160px;
            width:707px;
            height:500px;
            margin-top:50px;
        }             
        .OrderIcon{
            margin-top:50px;
            margin-left:150px;
        }
        .OrderTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .cartItem{
            border-radius:5px;
            background-color:#ececec;
            width:330px;
            height:420px;
        }
    </style>
    <br />
    <br />
    <br />
    <!--For the Order List div-->
    <div class="OrderIcon">
        <table>
            <tr>
                <td>
                    <span class="glyphicon glyphicon-shopping-cart" style="font-size:20px"></span>
                </td>
            </tr>
        </table>
    </div>
    <div class="OrderTab">
        <table>
            <tr>
                <td>
                    <h4>Orders</h4>
                </td>
            </tr>
        </table>
    </div>
    <div class="divOrderTab">
         <table>
            <tr>
                    <td>
                <asp:Button ID="btnRemoveItem" runat="server" CssClass="btn btn-primary" Text="Remove Item/s" style="margin-left:440px" OnClientClick="confirmDelete();" OnClick="btnRemoveItem_Click" /><asp:HiddenField ID="hfCount" runat="server" Value="0" />
                    </td>
                    <td>
                <asp:Button ID="btnRemoveOrder" runat="server" CssClass="btn btn-warning" Text="Cancel Order" style="margin-left:24px" OnClick="btnRemoveOrder_Click" />
                    </td>
            </tr>
         </table>
    </div>
    <div class="divOrderTable">
        <table>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="There are no orders!" OnPageIndexChanging="OnPageIndexChanging" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="OrderID" Width="720px" DataSourceID="SqlDataSource1" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkRow" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:BoundField DataField="SellingPrice" HeaderText="Cost Price" SortExpression="SellingPrice" />
                            <asp:BoundField DataField="Order_Quantity" HeaderText="Order Quantity" SortExpression="Order_Quantity" />     
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                        <EmptyDataRowStyle ForeColor="#ffffff" Font-Bold="true" HorizontalAlign="Center" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Employee_Orders]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    <!--End of order list div-->
    <!--For the cart items div-->
     <div class="divCartItems">
        <div class="cartItem">
            <table>
                <tr><td></td><td><h3>Cart Items</h3></td></tr>
                <tr><td><asp:Label ID="lblCartItems" style="margin-top:10px; margin-left:10px" runat="server" Text="Cart Items:" /></td>
                    <td><asp:TextBox ID="txtCartItems" style="margin-top:10px" runat="server" Width="163px" Enabled="false"/></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblSubTotal" runat="server" style="margin-top:10px; margin-left:10px" Text="Sub Total:" /></td>
                    <td>
                        <asp:TextBox ID="txtSubTotal" runat="server" style="margin-top:10px" Width="164px" Enabled="false"/>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblAmountDue" runat="server" style="margin-top:10px; margin-left:10px" Text="Amount Due:" /></td>
                    <td><asp:TextBox ID="txtAmountDue" runat="server" style="margin-top:10px" Width="165px" Enabled="false"/></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblPaymentMode" runat="server" style="margin-top:10px; margin-left:10px" Text="Payment Mode:" /></td>
                    <td><asp:DropDownList ID="ddlPaymentMode" CssClass="form-control-static" runat="server" style="margin-top:10px" Height="23px" Width="168px" >
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>Debit</asp:ListItem>
                        <asp:ListItem>Credit</asp:ListItem>
                    </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblCashAmount" runat="server" style="margin-top:10px; margin-left:10px" Text="Amount Tendered:" /></td>
                    <td><asp:TextBox ID="txtCashAmount" runat="server" CssClass="form-control-static" style="margin-top:10px" Width="168px" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblChange" runat="server" Text="Change:" style="margin-top:10px; margin-left:10px" /></td>
                    <td><asp:TextBox ID="txtChange" runat="server" Width="168px" style="margin-top:10px" Enabled="false"/></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblCustomer" runat="server" style="margin-top:10px; margin-left:10px" Text="Customer Name:" /></td>
                    <td><asp:TextBox ID="txtCustomer" runat="server" CssClass="form-control-static" style="margin-top:10px" Width="168px" /></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnComputeTotal" runat="server" CssClass="btn btn-danger" style="margin-top:15px; margin-left:25px" Text="Calculate Total" OnClick="btnComputeTotal_Click" /></td>
                    <td><asp:Button ID="btnCompleteSale" runat="server" CssClass="btn btn-success" style="margin-top:15px; margin-left:30px" Text="Complete Sale" OnClick="btnCompleteSale_Click"/></td>
                </tr>
            </table>
        </div>                    
    </div>
    <!--End of Cart Items div-->
</asp:Content>

