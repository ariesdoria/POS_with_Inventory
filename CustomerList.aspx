<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="CustomerList.aspx.cs" Inherits="Employee_CustomerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .CustomerIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .CustomerTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .CustomerSearch{
            margin-left:180px;
        }
        .CustomerTable{
            margin-left:180px;
        }
    </style>
    <div>
        <div class="CustomerIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-user" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="CustomerTab">
            <table>
            <tr>
                <td>
                    <h4>Customers</h4>
                </td>               
            </tr>
            </table>
        </div>        
        <br />
        <div class="CustomerSearch">
            <div class="form-group">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtSearchCustomer" runat="server" PlaceHolder="Search Customers" Width="198px" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td></td>
                    <td><asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearch_Click"/></td>
                    <td></td>
                    <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear Entries" Width="119px" style="margin-left:10px" CssClass="btn btn-warning" OnClick="btnClearSearch_Click"/></td>
                    <td></td>           
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchCustomer" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </div>
            </div>

        <div class="CustomerTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" ShowHeaderWhenEmpty="True" EmptyDataText="There are no customers!" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="1000px">
                            <Columns>
                                <asp:BoundField DataField="CustomerID" HeaderText="Customer #" SortExpression="CustomerID" />
                                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                                <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
                            <EmptyDataRowStyle ForeColor="#ffffff" HorizontalAlign="Center" Font-Bold="true" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

        </div>
        </div>
</asp:Content>

