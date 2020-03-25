<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ProfitList.aspx.cs" Inherits="Admin_ProfitList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
    function confirmArchive()
        {
             var count = document.getElementById("<%=hfCount.ClientID %>").value;
            var gv = document.getElementById("<%=GridView1.ClientID%>");
            var chkRow = gv.getElementsByTagName("input");
            for (var i = 0; i < chkRow.length; i++)
            {
                if(chkRow[i].checked && chkRow[i].id.indexOf("chkAll") == -1 )
                {
                    count++;
                }
            }
            if(count == 0)
            {
                alert("No records to be archived!");
                return;
            }
            else
            {
                return confirm("Do you want to put " + count + " item(s) on archive list?");
            }        
        }
    </script>
     <style type="text/css">
         .profitIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .profitTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .profitSearch{
            margin-left:180px;
        }
        .profitTable{
            margin-left:180px;
        }
        .profitCount{
            margin-left:180px;
            width:500px;
        }
    </style>
    <!--Wrapper-->
    <div>    
        <div class="profitIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-list" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="profitTab">
            <table>
                <tr>
                    <td>
                        <h4>Profit</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="profitSearch">
            <div class="form-group">
                  <table>
                    <tr>
                     <td>
                        <asp:TextBox ID="txtSearchProfit" runat="server" PlaceHolder="Search Profit" CssClass="form-control" Width="198px" />
                    </td>
                    <td></td>
                    <td><asp:Button ID="btnSearchProfit" runat="server" Text="Search Profit" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearchProfit_Click"/></td>
                    <td></td>
                    <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" /></td>
                    <td></td>
                    <td><asp:Button ID="btnArchive" runat="server" OnClientClick="confirmArchive();" CssClass="btn btn-info" style="margin-left:10px" Text="Archive" Width="80px" OnClick="btnArchive_Click" /><asp:HiddenField ID="hfCount" runat="server" Value ="0" /></td>
                    <td></td>
                    <td><asp:Button ID="btnExcelExport" runat="server" CssClass="btn btn-warning" style="margin-left:10px" Text="Export to Excel" OnClick="btnExcelExport_Click" /></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchProfit" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
            </div>
        </div>
        <div class="profitCount">
            <table>
                <tr>
                    <td>
                        Total Profit:<asp:Label ID="lblProfitCount" runat="server" Text="Label" Visible="false" /><asp:LinkButton ID="btnCleanup" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#deb887" OnClick="btnCleanup_Click"><span class="glyphicon glyphicon-trash"></span> Cleanup old profit</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>    
        <br />
        <div class="profitTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="839px">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkRow" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="Payment_Mode" HeaderText="Payment Mode" SortExpression="Payment_Mode" />
                                <asp:BoundField DataField="Customer_Name" HeaderText="Customer " SortExpression="Customer_Name" />
                                <asp:BoundField DataField="DateReceived" HeaderText="Date Received" SortExpression="DateReceived" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Profit]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        </div>
</asp:Content>

