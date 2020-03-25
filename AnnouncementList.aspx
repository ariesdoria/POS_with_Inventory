<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="AnnouncementList.aspx.cs" Inherits="Employee_AnnouncementList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style type="text/css">
        .AnnouncementIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .AnnouncementTab{
            margin-left:180px;
            margin-top:-30px;
        }      
        .AnnouncementSearch{
            margin-left:180px;
        }
        .AnnouncementTable{
            margin-left:180px;
        }
    </style>
    <div>
        <div class="AnnouncementIcon">
        <table>
            <tr>
                <td><span class="glyphicon glyphicon-envelope" style="font-size:20px"></span></td>
            </tr>                                        
        </table>
        </div>

        <div class="AnnouncementTab">        
        <table>
            <tr>
                <td><h4>Announcements</h4></td>
            </tr>
        </table>
        </div>

        <br />
        <div class="AnnouncementSearch">
            <div class="form-group">
            <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtSearchAnnouncement" runat="server" PlaceHolder="Search Announcement" Width="198px" CssClass="form-control"></asp:TextBox>
                </td>                
                <td></td>
                <td></td>
                <td><asp:Button ID="btnSearch" runat="server" Text="Search" Width="100px" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearch_Click"/></td>
                <td></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear Entries" Width="110px" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnClearSearch_Click"/></td>
                <td></td>
                <td></td>               
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="readAlphaOnly" runat="server" ErrorMessage="No results found!" ForeColor="#ff0000" ControlToValidate="txtSearchAnnouncement" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        </div>       
        </div>

        <div class="AnnouncementTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" ShowHeaderWhenEmpty="True" EmptyDataText="There are no announcements!" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="announcement_id" DataSourceID="SqlDataSource1" Width="1000px">
                            <Columns>
                                <asp:BoundField DataField="announcement_subject" HeaderText="Subject" ItemStyle-HorizontalAlign="Center" SortExpression="announcement_subject" />
                                <asp:BoundField DataField="announcement" HeaderText="Message" ItemStyle-HorizontalAlign="Center" SortExpression="announcement" />
                                <asp:BoundField DataField="sender_name" HeaderText="Sender" ItemStyle-HorizontalAlign="Center" SortExpression="sender_name" />
                                <asp:BoundField DataField="date_posted" HeaderText="Date Posted" ItemStyle-HorizontalAlign="Center" SortExpression="date_posted" />
                                <asp:BoundField DataField="announcement_status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" SortExpression="announcement_status" />
                                <asp:HyperLinkField DataNavigateUrlFields="announcement_id" ItemStyle-Width="180px" DataNavigateUrlFormatString="~/Employee/ViewAnnouncement.aspx?announcement_id={0}" HeaderText="View Announcement" NavigateUrl="~/Employee/ViewAnnouncement.aspx" Text="View Post" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Announcements]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>

