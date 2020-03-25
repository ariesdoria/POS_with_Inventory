<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeTimeRecord.aspx.cs" Inherits="Admin_EmployeeTimeRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
         .timeIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .timeTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .timeSearch{
            margin-left:180px;
        }
        .timeTable{
            margin-left:180px;
        }
        .timeCount{
            margin-left:180px;
            width:500px;
        }
    </style>
    <!--Wrapper-->
    <div>
        <div class="timeIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-hourglass"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="timeTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Employee's Time Record</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    <div class="timeSearch">
        <div class="form-group">
             <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtSearchEmployeeTime" runat="server" PlaceHolder="Search Time Record" CssClass="form-control" Width="198px" />
                </td>
                <td></td>
                <td><asp:Button ID="btnSearchTimeRecord" runat="server" Text="Search Time Record" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearchTimeRecord_Click"/></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" style="margin-left:10px" CssClass="btn btn-success" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" Text="Export to Excel" style="margin-left:10px" CssClass="btn btn-warning" OnClick="btnExcelExport_Click" /></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchEmployeeTime" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
            </div> 
    </div>
         <div class="timeCount">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbltotalTime" runat="server" Text="Total Time Record of Employees:"></asp:Label><asp:Label ID="lblTimeRecordCount" runat="server" Text="Label" Visible="false" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="timeTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="783px">
                            <Columns>
                                <asp:BoundField DataField="empAccountNumber" HeaderText="Account #" SortExpression="empAccountNumber" />
                                <asp:BoundField DataField="empLoginTime" HeaderText="Time In" SortExpression="empLoginTime" />
                                <asp:BoundField DataField="empLoginDay" HeaderText="Date Timed" SortExpression="empLoginDay" />
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
                        </asp:GridView> 
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Employee_Daily_TimeRecord]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        </div>
</asp:Content>

