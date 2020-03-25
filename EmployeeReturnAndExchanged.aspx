<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeReturnAndExchanged.aspx.cs" Inherits="Employee_EmployeeReturnAndExchanged" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .divReturnItem{
            margin-top:30px;
            margin-left:250px;
            background-color:#ececec;
            border-radius:5px;
            border:1px solid #000000;
            width:900px;
            height:530px;
        }
        .divExchangeItem{
            margin-left:250px;
            width:900px;
            height:430px;
            background-color:#ececec;
            border:1px solid #000000;
            border-radius:5px;
        }
        .returnExchangeIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .newReturnExchange{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .marker{
            margin-left:180px;
            width:500px;
        }
    </style>
    <br />
    <br />
    <br />
    <br />
    <div>
    <div class="returnExchangeIcon">
        <span class="glyphicon glyphicon-save"></span>
    </div>
    <div class="newReturnExchange">
        <h3>Item Returns and Exchange</h3>
    </div>
    <br />
    <br />
    <div class="marker">
        <p>Note:Fields that marked in red are required</p>
    </div>
    <div class="divReturnItem">
        <table>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td><span class="glyphicon glyphicon-save" style="margin-left:10px; margin-top:10px"></span><asp:Label ID="lblReturnItem" runat="server" style="margin-left:10px; margin-top:10px" Text="Return Item" /></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td><asp:TextBox ID="txtSearchItem" runat="server" PlaceHolder="Product number of item name" CssClass="form-control-static" style="margin-top:10px; margin-left:10px" Width="500px" /><asp:Button ID="btnSearchItem" runat="server" CssClass="btn btn-primary" Text="Search Item" style="margin-left:10px" Width="100px" OnClick="btnSearchItem_Click"/></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblProductID" runat="server" Text="Product Number:" style="margin-top:10px; margin-left:10px" /></td><td><asp:TextBox ID="txtReturnItemNumber" runat="server" style="margin-top:10px; margin-left:10px" Width="700px" Enabled="false" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblItemName" runat="server" Text="Item Name:" style="margin-top:10px; margin-left:10px" /></td><td><asp:TextBox ID="txtReturnItemName" style="margin-top:10px; margin-left:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblCategory" runat="server" style="margin-top:10px; margin-left:10px" Text="Category:" /></td><td><asp:TextBox ID="txtReturnItemCategory" style="margin-top:10px; margin-left:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblDescription" runat="server" style="margin-top:10px; margin-left:10px" Text="Description:" /></td><td><asp:TextBox ID="txtItemDescription" style="margin-top:10px; margin-left:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblCostPrice" runat="server" style="margin-top:10px; margin-left:10px" Text="Cost Price:" /></td><td><asp:TextBox ID="txtCostPrice" style="margin-top:10px; margin-left:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblSellingPrice" runat="server" style="margin-top:10px; margin-left:10px" Text="Selling Price:" /></td><td><asp:TextBox ID="txtSellingPrice" runat="server" style="margin-left:10px; margin-top:10px" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblQuantity" runat="server" style="margin-top:10px; margin-left:10px; color:red" Text="Quantity:" /></td><td><asp:TextBox ID="txtQuantity" style="margin-left:10px; margin-top:10px" runat="server" Width="700px"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblCondition" runat="server" style="margin-top:10px; margin-left:10px; color:red" Text="Condition:" /></td><td><asp:TextBox ID="txtItemCondition" style="margin-left:10px; margin-top:10px; resize:none" runat="server" TextMode="MultiLine" CssClass="textarea" Height="105px" Width="700px"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td><asp:Button ID="btnReturnItem" style="margin-top:10px; margin-left:100px;" CssClass="btn btn-success" runat="server" Text="Return Item" Width="180px" OnClick="btnReturnItem_Click"/><asp:Button ID="btnCancelReturn" runat="server" CssClass="btn btn-danger" Text="Cancel" Width="180px" style="margin-left:30px; margin-top:10px" OnClick="btnCancelReturn_Click"/></td></tr>
            <tr><td></td><td></td></tr>
        </table>
    </div>
    <br />
    <br />
    <div class="divExchangeItem">
        <table>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><span class="glyphicon glyphicon-open" style="margin-left:10px; margin-top:10px"></span><asp:Label ID="lblExchangeItem" style="margin-top:10px; margin-left:10px" runat="server" Text="Exchange Item" /></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td><asp:TextBox ID="txtSearchNewItem" runat="server" style="margin-left:10px; margin-top:10px" CssClass="form-control-static" PlaceHolder="Product number or item name" Width="500px"/><asp:Button ID="btnSearchNewItem" runat="server" CssClass="btn btn-primary" Text="Search Item" style="margin-left:15px" OnClick="btnSearchNewItem_Click"/></td></tr>
             <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblExProductID" runat="server" style="margin-top:10px; margin-left:10px" Text="Product Number:" /></td><td><asp:TextBox ID="txtExchangeProductID" style="margin-left:10px; margin-top:10px" runat="server" Width="700px" Enabled="false" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblExItemName" runat="server" style="margin-top:10px; margin-left:10px" Text="Item Name:" /></td><td><asp:TextBox ID="txtExchangeItemName" style="margin-left:10px; margin-top:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblExCategory" runat="server" style="margin-top:10px; margin-left:10px" Text="Category:" /></td><td><asp:TextBox ID="txtExchangeCategory" style="margin-left:10px; margin-top:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblExDescription" style="margin-top:10px; margin-left:10px" runat="server" Text="Description:" /></td><td><asp:TextBox ID="txtDescription" runat="server" style="margin-left:10px; margin-top:10px" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblExCost" style="margin-left:10px; margin-top:10px" runat="server" Text="Cost Price:" /></td><td><asp:TextBox ID="txtExCostPrice" style="margin-top:10px; margin-left:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblExSell" style="margin-left:10px; margin-top:10px" runat="server" Text="Selling Price:" /></td><td><asp:TextBox ID="txtExSellingPrice" style="margin-left:10px; margin-top:10px" runat="server" Width="700px" Enabled="false"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblExQuantity" style="margin-left:10px; margin-top:10px" runat="server" Text="Quantity:" /></td><td><asp:TextBox ID="txtItemQuantity" style="margin-left:10px; margin-top:10px" runat="server" Width="700px"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td><asp:Button ID="btnExchangeItem" runat="server" CssClass="btn btn-success" style="margin-top:20px; margin-left:100px" Text="Exchange Item" Width="180px" OnClick="btnExchangeItem_Click"/><asp:Button ID="btnCancelExchange" CssClass="btn btn-danger" runat="server" Text="Cancel" Width="180px" style="margin-left:20px; margin-top:20px" OnClick="btnCancelExchange_Click"/></td></tr>
            <tr><td></td><td></td></tr>
         </table>
    </div>
        <br />
        <br />
        </div>
</asp:Content>

