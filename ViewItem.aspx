<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="ViewItem.aspx.cs" Inherits="Employee_ViewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
             <span class="glyphicon glyphicon-list-alt"></span>
         </div>
         <div class="item">
             <h3>Item Details</h3>
         </div>
        <br />
        <br />
         <div class="itemDetails">
             <br />
             <table>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblProductNum" runat="server" style="margin-left:30px; font-size:large" Text="Product Number:"></asp:Label></td><td><asp:Label ID="lblProductID" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblItem" runat="server" style="margin-left:30px; font-size:large" Text="Item Name:"></asp:Label></td><td><asp:Label ID="lblItemName" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblempCategory" style="margin-left:30px; font-size:large" runat="server" Text="Category:"></asp:Label></td><td><asp:Label ID="lblCategory" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblDesc" style="margin-left:30px; font-size:large" runat="server" Text="Description:"></asp:Label></td><td><asp:Label ID="lblDescription" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblCost" style="margin-left:30px; font-size:large" runat="server" Text="Cost Price:"></asp:Label></td><td><asp:Label ID="lblCostPrice" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblSell" style="margin-left:30px; font-size:large" runat="server" Text="Selling Price:"></asp:Label></td><td><asp:Label ID="lblSellingPrice" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblempQuantity" style="margin-left:30px; font-size:large" runat="server" Text="Quantity:"></asp:Label></td><td><asp:Label ID="lblQuantity" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblRemaining" style="margin-left:30px; font-size:large" runat="server" Text="Remaining Stock:"></asp:Label></td><td><asp:Label ID="lblRemainingStock" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblDate" style="margin-left:30px; font-size:large" runat="server" Text="Date Purchased:"></asp:Label></td><td><asp:Label ID="lblDatePurchased" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblStatus" style="margin-left:30px; font-size:large" runat="server" Text="Item Status:"></asp:Label></td><td><asp:Label ID="lblItemStatus" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
        </table>
         </div>       
    </div>
</asp:Content>

