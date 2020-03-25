<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Employee_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .body{
            background:url(../Images/4.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
          -moz-background-size: cover;
         -o-background-size: cover;
          background-size: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">            
            <table align="center">
                <tr>
                    <td>
                         <h3 class="text-center">Welcome to Credit-Plus Login Portal. Login your credentials below to start a sales transaction</h3>
                    </td>
                </tr>
            </table>
        </div>
            </div>
            <br />
            <br />
            <br />
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <table align="center">
               <tr><td></td><td></td></tr>
               <tr><td align="center"><h4 class="text-center">Employee Login Portal</h4></td><td></td></tr>
               <tr><td></td><td></td></tr>
               <tr><td></td><td></td></tr>
            </table>
            <table align="center">
                <tr><td align="center"><h4 class="text-center">Account Number</h4></td></tr>
               <tr><td></td><td></td></tr>
               <tr><td></td><td></td></tr>
               <tr><td>
                   <div class="form-group has-feedback">
                    <i class="glyphicon glyphicon-user form-control-feedback"></i>
                   <asp:TextBox ID="txtAccountNumber" runat="server" PlaceHolder="Account Number" Width="224px" CssClass="form-control"></asp:TextBox>
                   </div>
                   </td></tr>
            </table>               
            <table align="center">
               <tr><td align="center"><h4 class="text-center">Password</h4></td></tr>
               <tr><td></td><td></td></tr>
               <tr><td></td><td></td></tr>
               <tr><td>
                   <div class="form-group has-feedback">
                   <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" PlaceHolder="Password" Width="222px" CssClass="form-control"></asp:TextBox>
                   </div>
                   </td></tr>
            </table>
            <table align="center">
                <tr><td align="center"><a href="Employee/EMPResetPassword.aspx">Reset Password?</a></td></tr>
            </table>
            <br />
                <table align="center">
                <tr><td><asp:Button ID="btnLogin" runat="server" Text="Login" Width="162px" CssClass="btn btn-primary" OnClick="btnLogin_Click"/></td></tr>                
                </table>
        </div>        
            </div>
            </div>
       </div>
    </form>
</body>
</html>
