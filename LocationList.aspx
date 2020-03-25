<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="LocationList.aspx.cs" Inherits="Admin_LocationList" %>
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
        .locationIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .locationTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .locationSearch{
            margin-left:180px;
        }
        .locationTable{
            margin-left:180px;
        }
        .locationCount {
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
        <div class="locationIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-home" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>

        <div class="locationTab">
            <table>
                <tr><td><h4>Locations</h4></td></tr>
            </table>
        </div>
         <br />
         <!--Location Table-->
         <div class="locationSearch">
            <div class="form-group">
                <table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <tr>
                <td><asp:TextBox ID="txtSearchLocation" runat="server" CssClass="form-control" PlaceHolder="Search Location" Width="266px"></asp:TextBox></td>
                <td></td>
                <td><asp:Button ID="btnSearchLocation" runat="server" CssClass="btn btn-primary" style="margin-left:10px" Text ="Search Location"/></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" CssClass=" btn btn-success" style="margin-left:10px" runat="server" Text ="Clear" Width="119px" /></td>
                <td></td>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <td><asp:Button ID="btnBulkUpdate" runat="server" style="margin-left:10px" CssClass="btn btn-danger" Text="Bulk Update"/></td>
                <td></td>
                <td><asp:Button ID="btnArchive" runat="server" CssClass="btn btn-info" style="margin-left:10px" Text="Archive" Width="71px" OnClientClick="confirmArchive();" /><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" CssClass="btn btn-warning" style="margin-left:10px" runat="server" Text ="Export to Excel" /></td>
                <td></td>
                <td><asp:LinkButton ID="btnAddLocation" CssClass="btn btn-default" style="margin-left:10px; background-color:#fff97a" Width="125px" runat="server"><span class="glyphicon glyphicon-home"></span> Add Location</asp:LinkButton></td>
                <td></td>               
            </tr>                         
        </table>
        <cc1:ModalPopupExtender ID="mpLocation" runat="server" TargetControlID="btnBulkUpdate" PopupControlID="Panel1" CancelControlID="btnClose" BackgroundCssClass="modalBackground">            
        </cc1:ModalPopupExtender>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style="display:none">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Update Locations</h4>
                                </div>
                                <div class="modal-body">
                                     <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblLocationName" runat="server" Text="Location Name:" style="margin-left:10px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLocationName" CssClass="form-control" Width="400px" style="margin-left:5px" runat="server"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblLocationAddress" runat="server" Text="Address:" style="margin-left:10px; margin-top:5px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLocationAddress" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px" runat="server"/>
                                            </td>
                                        </tr>
                                         <tr>
                                             <td>
                                                 <asp:Label ID="lblLocationPhone" runat="server" Text="Phone:" style="margin-left:10px; margin-top:5px"></asp:Label>
                                             </td>
                                             <td>
                                                 <asp:TextBox ID="txtLocationPhone" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px" runat="server"/>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td>
                                                 <asp:Label ID="lblLocationFax" runat="server" Text="Fax Number:" style="margin-left:10px; margin-top:5px"></asp:Label>
                                             </td>
                                             <td>
                                                 <asp:TextBox ID="txtLocationFax" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px"/>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td>
                                                <asp:Label ID="lblLocationEmail" runat="server" Text="Email:" style="margin-left:10px; margin-top:5px"></asp:Label> 
                                             </td>
                                             <td>
                                                 <asp:TextBox ID="txtLocationEmail" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px"/>
                                             </td>
                                         </tr>
                                         <tr><td></td></tr>
                                        <tr><td></td></tr>
                             <tr>
                                 <td></td>
                                 <td>
                                     <asp:Button id="btnUpdateLocation" runat="server" style="margin-top:10px" CssClass="btn btn-success" Text="Update Location" />
                                      <asp:Button ID="btnClose" runat="server" style="margin-top:10px; margin-left:30px" CssClass="btn btn-warning" Width="100px" Text="Close" />
                                 </td>                            
                             </tr>                                                   
                         </table>
                            </div>
                            </div>
                        </div>                      
                    </asp:Panel>                   
                         <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ValidationExpression="[a-zA-Z0-9!/ ]*$" ForeColor="#ff0000" ControlToValidate="txtSearchLocation"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </div>
     <div class="locationCount">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblTotalLocations" runat="server" Text="Total Locations:"></asp:Label><asp:Label ID="lblLocationCount" runat="server" Visible="false" Text="Label" />
                </td>
            </tr>
        </table>
    </div>
    <div>
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
            <asp:BoundField DataField="LocationID" HeaderText="LocationID" SortExpression="LocationID" />
            <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="FaxNumber" HeaderText="FaxNumber" SortExpression="FaxNumber" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Location]"></asp:SqlDataSource>
                </td>
            </tr>
            </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="" />
                    <asp:AsyncPostBackTrigger ControlID="btnBulkUpdate" />
                </Triggers>
                </asp:UpdatePanel>
        </table>
                </div>
             </div>
         </div>
</asp:Content>

