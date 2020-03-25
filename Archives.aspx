<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Archives.aspx.cs" Inherits="Admin_Archives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
    </style>
     <div class="mainPage">
    <div class="module">
        <table>
            <tr><td><h3>Click an archive below to get started!</h3></td></tr>
        </table>
    </div>
    <br />
    <br />
    <br />
    <div class="module2">
        <br />
        <table>
            <tr>
                <td></td><td><span class="glyphicon glyphicon-folder-open" style="margin-left:5px"></span><asp:Label ID="lblArchive" runat="server" Text="Archives" style="margin-left:10px"></asp:Label></td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td></td>
                <td>
                <asp:LinkButton ID="btnCustomerArchives" style="margin-left:10px" CssClass="btn btn-primary" runat="server" Width="160px">
                <span class="glyphicon glyphicon-user"></span>Customer Archives</asp:LinkButton>
                <%Server.Transfer("ArchiveCustomer.aspx");%>
                </td>
                <td></td>
                <td>
                <asp:LinkButton ID="btnEmployeeArchives" runat="server" CssClass="btn btn-primary" style="margin-left: 29px" Width="160px">
                <span class="glyphicon glyphicon-user"></span>Employee Archives</asp:LinkButton>
                <%Server.Transfer("ArchiveEmployee.aspx");%>
                </td>
                <td></td>
                <td>
                <asp:LinkButton ID="btnStockArchives" runat="server" CssClass="btn btn-primary" style="margin-left: 26px" Width="160px">
                <span class="glyphicon glyphicon-inbox"></span>Stock Archives</asp:LinkButton>
                <%Server.Transfer("ArchiveStocks.aspx");%>
                </td>
                <td></td>
                <td><asp:LinkButton ID="btnLocationArchives" runat="server" CssClass="btn btn-primary" style="margin-left: 34px" Width="160px">
                <span class="glyphicon glyphicon-home"></span> Location Archives</asp:LinkButton>
                <%Server.Transfer("ArchiveLocation.aspx");%>
                </td>
                <td></td>
                <td><asp:LinkButton ID="btnProfitArchives" runat="server" CssClass="btn btn-primary" style="margin-left: 34px" Width="160px">
                <span class="glyphicon glyphicon-signal"></span> Profit Archives</asp:LinkButton>
                <%Server.Transfer("ArchiveProfit.aspx");%>
                </td>
                <td></td>
            </tr>
        </table>
    <br />
    <br />
    <br />
    <br />
        <table>
            <tr>
                <td></td>
                <td><asp:LinkButton ID="btnGiftcardArchives" CssClass="btn btn-primary" style="margin-left:10px" runat="server" Width="160px">
                <span class="glyphicon glyphicon-gift"></span> Giftcard Archives</asp:LinkButton>
                <%Server.Transfer("GiftCardList.aspx");%>
                </td>
                <td></td>
                <td><asp:LinkButton ID="btnSalesArchives" CssClass="btn btn-primary" runat="server" style="margin-left: 37px" Width="160px">
                <span class="glyphicon glyphicon-shopping-cart"></span> Sales Archives</asp:LinkButton>
                <%Server.Transfer("ArchiveSales.aspx");%>
                </td>
                <td></td>
                <td><asp:LinkButton ID="btnReturnedItemsArchives" CssClass="btn btn-primary" runat="server" style="margin-left: 38px" Width="160px">
                <span class="glyphicon glyphicon-list-alt"></span> Returned Items</asp:LinkButton>
                <%Server.Transfer("ArchiveReturnedItems.aspx");%>
                </td>
                <td></td>
                <td><asp:LinkButton ID="btnExchangedItemsArchives" CssClass="btn btn-primary" runat="server" style="margin-left: 20px" Width="160px">
                <span class="glyphicon glyphicon-list-alt"></span> Exchanged Items</asp:LinkButton>
                <%Server.Transfer("ArchiveExchangeItems.aspx");%>
                </td>
                <td></td>
                <td><asp:LinkButton ID="btnAnnouncementArchives" CssClass="btn btn-primary" runat="server" style="margin-left:20px" Width="195px">
                <span class="glyphicon glyphicon-envelope"></span> Announcement Archives</asp:LinkButton>
                <%Server.Transfer("ArchiveAnnouncements.aspx");%>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
        </div>
</asp:Content>

