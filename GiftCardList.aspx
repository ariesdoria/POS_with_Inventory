<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="GiftCardList.aspx.cs" Inherits="Admin_GiftCardList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
       .giftcardIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .giftCardTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .giftCardSearch{
            margin-left:180px;
        }
        .giftCardTable{
            margin-left:180px;
        }
        .giftCardCount {
            width: 500px;
        }
        .modalBackground{
            background-color:black;
            filter: alpha(opacity=90);
            opacity:0.8;
        }
        .modalPopup {
            border-width: 2px;
            border-style: solid;
            padding-top: 10px;
            padding-left: 10px;
        }
    </style>
    <!--Wrapper-->
     <div>
        <div class="giftcardIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-gift" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>

        <div class="giftCardTab">
            <table>
                <tr>
                    <td>
                        <h4>Giftcards</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <!--Giftcard table-->
        <div class="giftCardSearch">
            <div class="form-group">
                <table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <tr>
                <td><asp:TextBox ID="txtSearchGiftCard" runat="server" CssClass="form-control" PlaceHolder="Search GiftCard" Width="266px" /></td>
                <td></td>
                <td><asp:Button ID="btnSearchGiftCard" runat="server" CssClass="btn btn-primary" style="margin-left:10px" Text="Search GiftCard" /></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" CssClass="btn btn-success" style="margin-left:10px" Text="Clear" Width="119px" /></td>
                <td></td>   
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <td><asp:Button ID="btnBulkUpdate" runat="server" style="margin-left:10px" CssClass="btn btn-danger" Text="Bulk Update"/></td>
                <td></td>
                <td><asp:Button ID="btnArchive" runat="server" CssClass="btn btn-info" style="margin-left:10px" Text="Archive" Width="71px"  OnClientClick="confirmArchive();"/><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" CssClass="btn btn-warning" style="margin-left:10px" Text="Export to Excel" /></td>
                <td></td>
                <td><asp:LinkButton ID="btnAddGiftCard" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#fff97a" Width="125px"><span class="glyphicon glyphicon-gift"></span> Add Giftcard</asp:LinkButton></td>
            </tr>
        </table>
        <cc1:ModalPopupExtender ID="mpGiftCard" runat="server" TargetControlID="btnUpdateGiftCard" PopupControlID="Panel1" CancelControlID="btnClose" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>      
        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style="display:none">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Update Giftcards</h4>
                    </div>
                    <div class="modal-body">
                         <table>
                <tr>
                    <td>
                        <asp:Label ID="lblGiftCardValue" runat="server" Text="Giftcard Value:" style="margin-left:10px" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtGiftCardValue" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px"/>
                    </td>
               </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCustomer" runat="server" Text="Customer:" style="margin-left:10px; margin-top:5px" />
                    </td>
                    <td>
                        <asp:Textbox ID="txtCustomer" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px" />
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnUpdateGiftCard" runat="server" style="margin-top:10px" CssClass="btn btn-success" Text="Update Giftcard" />
                        <asp:Button ID="btnClose" runat="server" style="margin-top:10px; margin-left:30px" CssClass="btn btn-warning" Width="100px" Text="Close" /> 
                    </td>  
                </tr>                                                
            </table>            
        </asp:Panel>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ValidationExpression="[a-zA-Z0-9!/ ]*$" ControlToValidate="txtSearchGiftCard" ForeColor="#ff0000"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
                    </div>
                </div>
            </div>
           
        <br />
    </div>

    <div class="giftCardCount">
       <table>
         <tr>
            <td>
                <asp:Label ID="lblTotalGiftcards" runat="server" Text="Total Giftcards:"></asp:Label><asp:Label ID="lblGiftcardCount" runat="server" Visible="false" Text="Label"></asp:Label>
            </td>
         </tr>
        </table>   
    </div>
    <table>
        <tr>
            <td>
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkRow" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Giftcard_Number" HeaderText="Giftcard # " SortExpression="Giftcard_Number" />
                        <asp:BoundField DataField="Giftcard_Value" HeaderText="Giftcard Value" SortExpression="Giftcard_Value" />
                        <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Giftcard]"></asp:SqlDataSource>
            </td>
        </tr>  
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="" />
            <asp:AsyncPostBackTrigger ControlID="btnUpdateGiftcard" />
        </Triggers>       
        </asp:UpdatePanel>
     </table>
     </div>
     </div>
     </div>   
</asp:Content>

