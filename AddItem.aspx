<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="Admin_AddItem" %>

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
        .newItem{
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
                        <h4 style="width:500px">New Item</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    <div class="newItem">
        <br />
        <table>
            <tr><td></td><td></td></tr>   
            <tr><td><span class="glyphicon glyphicon-inbox" style="margin-left:10px"></span><asp:Label ID="lblitemInfo" runat="server" Text="Item Information" style="margin-left:10px"></asp:Label></td></tr>
            <tr><td><asp:TextBox ID="txtProductID" runat="server" style="margin-left:80px; margin-top:10px" PlaceHolder="Product Number" Width="600px" CssClass="form-control"></asp:TextBox></td></tr>       
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product Number is required!" style="margin-left:80px" ControlToValidate="txtProductID" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtItemName" runat="server" style="margin-left:80px; margin-top:10px" PlaceHolder="Item Name" Width="600px" CssClass="form-control"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Item Name is required!" style="margin-left:80px" ControlToValidate="txtItemName" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtCategory" runat="server" style="margin-left:80px; margin-top:10px" Width="600px" PlaceHolder="Category" CssClass="form-control"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Category is required!" style="margin-left:80px" ControlToValidate="txtCategory" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtDescription" runat="server" style="margin-left:80px; margin-top:10px; resize:none" Width="600px" Height="106px" CssClass="form-control" TextMode="MultiLine" PlaceHolder="Some description.."></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Description is required!" style="margin-left:80px" ControlToValidate="txtDescription" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtCostPrice" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Cost Price"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Cost Price is required!" style="margin-left:80px" ControlToValidate="txtCostPrice" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtSellingPrice" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Selling Price"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Selling Price is required!" style="margin-left:80px" ControlToValidate="txtSellingPrice" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtQuantity" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Quantity"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Item Quantity is required!" style="margin-left:80px" ControlToValidate="txtQuantity" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Button ID="btnAddItem" runat="server" Text="Add Item" Width="201px" style="margin-left:300px; margin-top:10px" CssClass="btn btn-success" OnClick="btnAddItem_Click" /></td></tr>
            <tr><td></td><td></td></tr>
        </table>
        <br />
        <br />
    </div>
        <br />
        </div>
</asp:Content>

