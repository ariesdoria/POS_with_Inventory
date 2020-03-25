<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewEmployee.aspx.cs" Inherits="Admin_ViewEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
          .employeeIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .employee{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .employeeProfile{
            margin-left:285px;
            margin-top:30px;
            background-color:#ececec;
            border:1px solid #000000;
            border-radius:5px;
            width:830px;
            height:500px;
        }
    </style>
    <br />
    <div>
        <br />
        <br />
        <br />
        <br />
        <div class="employeeIcon">
            <span class="glyphicon glyphicon-user"></span>
        </div>
        <div class="employee">
            <h3>Employee Details</h3>
        </div>
        <br />
        <br />
        <div class="employeeProfile">
            <br />
        <table>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblAccountNo" runat="server" Text="Account Number:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpAccountNo" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblPassword" runat="server" Text="Password:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpPassword" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblFname" runat="server" Text="Firstname:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpFirstName" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblLname" runat="server" Text="Lastname:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpLastName" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblGender" runat="server" Text="Gender:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpGender" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblBday" runat="server" Text="Birthday:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpBday" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblMonth" runat="server" Text="Month:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpBMonth" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblYear" runat="server" Text="Year:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpBYear" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblPhone" runat="server" Text="Mobile No.:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpPhoneNo" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblLocation" runat="server" Text="Location:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpLocation" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblComments" runat="server" Text="Comments:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpComments" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblDate" runat="server" Text="Date Hired:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblDateHired" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblStatus" runat="server" Text="Status:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblEmpStatus" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
            <tr><td></td><td></td></tr>              
        </table>
        </div>
        <br />
        <br />
        </div>
</asp:Content>

