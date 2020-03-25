<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeProfile.aspx.cs" Inherits="Employee_EmployeeProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .userIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .user{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .userProfile{
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
        <div class="userIcon">
            <span class="glyphicon glyphicon-user"></span>
        </div>
        <div class="user">
            <h3>Profile Information</h3>
        </div>
        <br />
        <br />
        <div class="userProfile">   
            <br />   
        <table>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblAccount" style="margin-left:30px; font-size:large" runat="server" Text="Account Number:"></asp:Label><asp:Label ID="lblEmpAccountNo" style="margin-left:150px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblFname" style="margin-left:30px; font-size:large" runat="server" Text="Firstname:"></asp:Label><asp:Label ID="lblEmpFirstName" style="margin-left:250px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblLname" style="margin-left:30px; font-size:large" runat="server" Text="Lastname:"></asp:Label><asp:Label ID="lblEmpLastName" style="margin-left:250px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblGender" style="margin-left:30px; font-size:large" runat="server" Text="Gender:"></asp:Label><asp:Label ID="lblEmpGender" style="margin-left:290px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblBday" style="margin-left:30px; font-size:large" runat="server" Text="Birthday:"></asp:Label><asp:Label ID="lblEmpBMonth" style="margin-left:270px; font-size:large" runat="server" Text="Label" /><asp:Label ID="lblEmpBDay" style="margin-left:10px; margin-top:10px; font-size:large" runat="server" Text="Label" /><asp:Label ID="lblEmpBYear" style="margin-left:10px; margin-top:10px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblPhone" style="margin-left:30px; font-size:large" runat="server" Text="Phone Number:"></asp:Label><asp:Label ID="lblEmpPhoneNo" style="margin-left:150px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblLocation" style="margin-left:30px; font-size:large" runat="server" Text="Location:"></asp:Label><asp:Label ID="lblEmpLocation" style="margin-left:250px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblComments" style="margin-left:30px; font-size:large" runat="server" Text="Description:"></asp:Label><asp:Label ID="lblEmpComments" style="margin-left:200px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblHired" style="margin-left:30px; font-size:large" runat="server" Text="Date Hired:"></asp:Label><asp:Label ID="lblDateHired" style="margin-left:200px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>           
            <tr><td><asp:Button ID="btnUpdateProfile" CssClass="btn btn-success" Width="300px" style="margin-left:250px; margin-top:120px" runat="server" Text="Update Profile" OnClick="btnUpdateProfile_Click" /></td><td></td></tr>
        </table>
    </div>
        <br />
        </div>
</asp:Content>

