<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewExchangedItem.aspx.cs" Inherits="Admin_ViewExchangedItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style type="text/css">
        .exchangeItemIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .exchangeItem{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .exchangeItemDetails{
            background-color:#ececec;
            border:1px solid #000000;
            border-radius:5px;
            margin-left:285px;
            margin-top:30px;
            width:830px;
            height:350px;
        }
    </style>
    <div>
        <br />
        <br />
        <br />
        <br />
    <div class="exchangeItemIcon">
        <span class="glyphicon glyphicon-open"></span>
    </div>
        <div class="exchangeItem">
            <h3>Exchanged Item Details</h3>
        </div>
        <br />
        <br />
        <div class="exchangeItemDetails">
            <br />
        <table>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblItem" runat="server" Text="Item Name:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblItemName" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblitemCategory" runat="server" Text="Category:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblCategory" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblitemDescription" runat="server" Text="Description:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblDescription" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblCost" runat="server" Text="Cost Price:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblCostPrice" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblSell" runat="server" Text="Selling Price:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblSellingPrice" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblitemQuantity" runat="server" Text="Quantity:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblQuantity" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblDate" runat="server" Text="Date Exchange:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblDateExchange" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
        </table>
    </div>
        </div>
</asp:Content>

