<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UpdateItem.aspx.cs" Inherits="Admin_UpdateItem" %>
<%@Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .itemIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .itemTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .updateItem{
            margin-left:300px;
            background-color:#ececec;
            border: 1px solid #000000;
            border-radius:5px;
            width:800px;
            height:650px;
        }
    </style>
    <!--Wrapper-->
    <div>
        <div class="itemIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-inbox" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="itemTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Update Item</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    <div class="updateItem">
        <br />
        <table>
            <tr><td></td><td></td></tr>
            <tr><td><span class="glyphicon glyphicon-inbox" style="margin-left:10px"></span><asp:Label ID="lblitemInfo" runat="server" Text="Update Item Details" style="margin-left:10px"></asp:Label></td></tr>
            <tr><td><asp:Label ID="lblItemID" runat="server" Text="Label" style="margin-left:80px; margin-top:10px" Width="193px" CssClass="text-muted"></asp:Label></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtItemName" runat="server" style="margin-left:80px; margin-top:10px" Width="600px" PlaceHolder="Item Name" CssClass="form-control"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Item Name is required!" ControlToValidate="txtItemName" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtCategory" runat="server" style="margin-left:80px; margin-top:10px" Width="600px" PlaceHolder="Category" CssClass="form-control"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Category is required!" ControlToValidate="txtCategory" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtDescription" runat="server" style="margin-left:80px; margin-top:10px; resize:none" CssClass="form-control" PlaceHolder="Some description here.." Width="600px" Height="119px" TextMode="MultiLine"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must add some descriptionn on the item!" ControlToValidate="txtDescription" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtCostPrice" runat="server" Width="600px" style="margin-left:80px; margin-top:10px" PlaceHolder="Cost Price" CssClass="form-control"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Cost price is required!" ControlToValidate="txtCostPrice" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtSellingPrice" runat="server" Width="600px" style="margin-left:80px; margin-top:10px" PlaceHolder="Selling Price" CssClass="form-control"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Selling Price is required!" ControlToValidate="txtSellingPrice" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtQuantity" runat="server" Width="600px" style="margin-left:80px; margin-top:10px" PlaceHolder="Item Quantity" CssClass="form-control"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Item Quantity is required!" ControlToValidate="txtQuantity" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Button ID="btnUpdateItem" runat="server" Text="Update Item" style="margin-left:300px; margin-top:10px" CssClass="btn btn-primary" OnClick="btnUpdateItem_Click" /></td></tr>
            <tr><td></td><td></td></tr>
        </table>
        <br />
        <br />
    </div>
        <br />
        <br />
        </div>
</asp:Content>

