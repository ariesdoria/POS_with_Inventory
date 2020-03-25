<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewReturnedItem.aspx.cs" Inherits="Admin_ViewReturnedItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .returnItemIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .returnItem{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .returnItemDetails{
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
        <div class="returnItemIcon">
            <span class="glyphicon glyphicon-save"></span>
        </div>
        <div class="returnItem">
            <h3>Return Item Details</h3>
        </div>
        <br />
      <div class="returnItemDetails">
          <br />
        <table>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblItem" runat="server" Text="Item Name:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblItemName" runat="server" Text="Label" style="margin-left:50px;" /></td></tr>
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
            <tr><td><asp:Label ID="lblitemCondition" runat="server" Text="Condition:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblCondition" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblDate" runat="server" Text="Date Returned:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblDateReturned" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
        </table>
    </div>
        </div>
</asp:Content>

