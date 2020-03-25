<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminMainPage.aspx.cs" Inherits="Admin_AdminMainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .mainPage{
            margin-top:80px;
        }
        .module{
            margin-left:200px;
            width:500px;
        }
        .module2{
            width:1000px;
            margin-left:200px;
            border-radius:5px;
            background-color:#ececec;
        }
        .stats{
            margin-left:200px;
            width:1000px;
            background-color:#ececec;
            border-radius:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="mainPage">
        <div class="module">
            <table>
                <tr>
                    <td>
                        <h3>
                            Click a module below to get started!
                        </h3>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="module2">
            <br />
            <table>
                <tr>
                    <td></td>
                    <td>
                    <span class="glyphicon glyphicon-cloud" style="margin-left:5px;"></span>
                    <asp:Label ID="lblModule" runat="server" Text="Modules" style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td></td>
                    <td>
                    <asp:LinkButton ID="btnCustomers" runat="server" style="margin-left:10px" CssClass="btn btn-primary" Width="120px">
                        <span class="glyphicon glyphicon-user"></span>
                        <%Server.Transfer("CustomerList.aspx");%>
                        Customers
                    </asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnEmployees" runat="server" style="margin-left:14px" Width="120px" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-user"></span>
                            <%Server.Transfer("EmployeeList.aspx");%>
                            Employees
                        </asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnStocks" runat="server" style="margin-left:40px" width="120px" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-inbox"></span>
                            <%Server.Transfer("Stocks.aspx");%>
                            Stocks
                        </asp:LinkButton>
                    </td>
                    <td>
                        <asp:linkbutton id="btnLocations" runat="server" style="margin-left: 35px" width="144px" cssclass="btn btn-primary">
                            <span class="glyphicon glyphicon-home"></span>
                            <%Server.Transfer("LocationList.aspx");%>
                            Locations
                        </asp:linkbutton>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnGiftCards" runat="server" style="margin-left:35px" width="125px" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-gift"></span>
                            <%Server.Transfer("GiftCardList.aspx");%>
                            GiftCards
                        </asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnSales" runat="server" style="margin-left:50px" width="122px" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-shopping-cart"></span>
                            <%Server.Transfer("SalesList.aspx");%>
                            Sales
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <table>
                <tr>
                    <td></td>
                    <td>
                    <asp:LinkButton ID="btnProfit" runat="server" CssClass="btn btn-primary" style="margin-left:10px" Text="Profit" width="104px">
                    <span class="glyphicon glyphicon-list"></span>
                    <%Server.Transfer("ProfitList.aspx");%>
                    Profit
                    </asp:LinkButton>
                    </td>
                    <td>
                    <asp:LinkButton ID="btnReturnedItems" runat="server" CssClass="btn btn-primary" style="margin-left:23px" Text="Returned Items" Witdh="140px">
                    <span class="glyphicon glyphicon-list-alt"></span>
                    <%Server.Transfer("ReturnedItems.aspx");%>
                    Returned Items
                    </asp:LinkButton>
                    </td>
                    <td>
                    <asp:LinkButton ID="btnExhangedItems" runat="server" CssClass="btn btn-primary" style="margin-left:21px" Text="Exchanged Items" Width="150px">
                    <span class="glyphicon glyphicon-list-alt"></span>
                    <%Server.Transfer("ExchangedItems.aspx");%>
                    Exchanged Items
                    </asp:LinkButton>
                    </td>
                    <td>
                    <asp:LinkButton ID="btnAnnouncements" runat="server" CssClass="btn btn-primary" style="margin-left:19px" Text="Announcements" Width="145px">
                    <span class="glyphicon glyphicon-envelope"></span>
                    <%Server.Transfer("AnnouncementList.aspx");%>
                    Announcements
                    </asp:LinkButton>
                    </td>
                    <td>
                    <asp:LinkButton ID="btnEmployeeRecord" runat="server" CssClass="btn btn-primary" style="margin-left:19px" Text="Time Record" Width="200px">
                    <span class="glyphicon glyphicon-hourglass"></span>
                    <%Server.Transfer("EmployeeTimeRecord.aspx");%>
                    Employee's Time Record
                    </asp:LinkButton>
                    </td>
                    <td>
                    <asp:LinkButton ID="btnArchived" runat="server" CssClass="btn btn-primary" style="margin-left:19px" Text="Archives" Width="121px">
                    <span class="glyphicon glyphicon-folder-open"></span>
                    <%Server.Transfer("Archives.aspx");%>
                     Archives 
                    </asp:LinkButton>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
        <br />
        <br />
        <div class="stats">
            <br />
            <table>
                <tr>
                    <td></td>
                    <td><span class="glyphicon glyphicon-signal" style="margin-left:5px"></span>
                    <asp:Label ID="lblStats" runat="server" Text="Statistics" style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td></td>
                    <td><span class="glyphicon glyphicon-user" style="margin-left:5px"></span>
                        <asp:Label ID="lbCustomers" runat="server" Text="Total Customers:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td><asp:Label ID="lblCustomers" runat="server" Text="Label" visible="False" style="font-size:large"></asp:Label></td>
                    <td></td><td></td>
                    <td></td>
                    <td>
                        <span class="glyphicon glyphicon-user" style="margin-left:10px"></span>
                        <asp:Label ID="lbEmployees" runat="server" Text="Total Employees:" style="margin-left:5px; font-size:large"></asp:Label> 
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblEmployees" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                    <td></td><td></td>
                    <td></td>
                    <td>
                        <span class="glyhpicon glyphicon-inbox" style="margin-left:10px""></span>
                        <asp:Label ID="lbStocks" runat="server" Text="Total Stocks:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td><td></td>
                    <td></td>
                    <td>
                        <asp:Label id="lblStocks" runat="server" text="Label" visible=" false" style="font-size: large"></asp:Label>
                    </td>
                    <td></td><td></td>
                    <td></td>
                    <td>
                        <span class="glyphicon glyphicon-home" style="margin-left:10px"></span>
                        <asp:Label ID="lbLocations" runat="server" Text="Total Locations:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td><td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblLocations" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                    <td></td><td></td>
                    <td></td>
                    <td>
                        <span class="glyphicon glyphicon-gift" style="margin-left:10px"></span>
                        <asp:Label ID="lbGiftCards" runat="server" Text="Total Giftcards:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td><td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblGiftCards" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <table>
                <tr>
                    <td></td>
                    <td><span class="glyphicon glyphicon-shopping-cart" style="margin-left:10px"></span>
                        <asp:Label ID="lbSales" runat="server" Text="Total Sales:" style="margin-left:5px; font-size:large"></asp:Label> 
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblSales" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><span class="glyphicon glyphicon-signal" style="margin-left:10px"></span>
                        <asp:Label ID="lbProfit" runat="server" Text="Total Profit:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblProfit" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <span class="glyphicon glyphicon-list-alt" style="margin-left:10px"></span>
                        <asp:Label ID="lbReturnedItems" runat="server" Text="Total Returned Items:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblReturnedItems" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <span class="glyphicon glyphicon-list" style="margin-left:10px"></span>
                        <asp:Label ID="lbExchangedItems" runat="server" Text="Total Exchanged Items:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblExchangedItems" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                       <span class="glyphicon glyphicon-envelope" style="margin-left:10px"></span>
                        <asp:Label ID="lbAnnouncements" runat="server" Text="Announcements Posted:" style="margin-left:5px; font-size:large"></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label Id="lblAnnouncements" runat="server" Text="Label" Visible="false" style="font-size:large"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
    </div>
</asp:Content>

