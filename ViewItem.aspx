<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewItem.aspx.cs" Inherits="Admin_ViewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .itemIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .item{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .itemDetails{
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
     <div class="itemIcon">
         <span class="glyphicon glyphicon-inbox"></span>
     </div>
        <div class="item">
            <h3>Item Details</h3>
        </div>
        <br />
        <br />
        <div class="itemDetails">
            <br />
         <table>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblID" runat="server" Text="Product ID:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblProductID" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
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
            <tr><td><asp:Label ID="lblitemCost" runat="server" Text="Cost Price:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblCostPrice" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblitemSell" runat="server" Text="Selling Price:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblSellingPrice" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblItemQuantity" runat="server" Text="Quantity:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblQuantity" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblitemStock" runat="server" Text="Remaining Stock:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblRemainingStock" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblPurchased" runat="server" Text="Date Purchased:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblDatePurchased" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblStatus" runat="server" Text="Item Status:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblItemStatus" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
        </table>
    </div>
        </div>
</asp:Content>

