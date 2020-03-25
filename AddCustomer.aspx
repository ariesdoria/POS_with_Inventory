<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="AddCustomer.aspx.cs" Inherits="Employee_AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .addCustomer{
            margin-left:220px;
            margin-top:30px;
            border:1px solid #000000;
            background-color:#ececec;
            border-radius:5px;
            width:950px;
            height:850px;
        }
        .newCustomer{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .customerIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .marker{
            margin-left:180px;
            width:500px;
        }
    </style>  
        <div>
        <br />
        <br />
        <br />
        <br />
            <div class="customerIcon">
                <span class="glyphicon glyphicon-pencil"></span>
            </div>
            <div class="newCustomer">
            <h3>New Customer</h3>
            </div>
            <br />
            <br />
            <div class="marker">
            <p>Note: Fields marked in red are required.</p>
            </div>
            <div class="addCustomer">
         <table>             
             <tr><td><span class="glyphicon glyphicon-user" style="margin-left:10px; margin-top:10px"></span> Customer Information</td><td></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblFname" style="margin-top:30px; margin-left:80px; color:red" runat="server" Text="Firstname:"></asp:Label><asp:TextBox ID="txtCusFname" style="margin-top:20px; margin-left:20px" CssClass="form-control-static" runat="server" Width="720px"/></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblLname" style="margin-top:30px; margin-left:80px; color:red" runat="server" Text="Lastname:"></asp:Label><asp:TextBox ID="txtCusLname" style="margin-top:20px; margin-left:20px" CssClass="form-control-static" runat="server" Width="720px" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblEmail" style="margin-top:30px; margin-left:80px" runat="server" Text="Email:"></asp:Label><asp:TextBox ID="txtCusEmail" style="margin-top:20px; margin-left:47px;" runat="server" Width="720px" CssClass="form-control-static" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblPhone" style="margin-top:30px; margin-left:80px; color:red" runat="server" Text="Phone No:"></asp:Label><asp:TextBox ID="txtCusPhone" style="margin-top:20px; margin-left:20px" runat="server" Width="720px" CssClass="form-control-static" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblAddress" style="margin-top:30px; margin-left:80px; color:red" runat="server" Text="Address:"></asp:Label><asp:TextBox ID="txtCusAddress" style="margin-top:20px; margin-left:30px" runat="server" Width="720px" CssClass="form-control-static" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblCity" style="margin-top:30px; margin-left:80px" runat="server" Text="City:"></asp:Label><asp:TextBox ID="txtCusCity" runat="server" style="margin-top:20px; margin-left:57px" Width="720px" CssClass="form-control-static" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblState" style="margin-top:30px; margin-left:80px" runat="server" Text="State:"></asp:Label><asp:TextBox ID="txtCusState" runat="server" style="margin-top:20px; margin-left:50px" Width="720px" CssClass="form-control-static" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblZip" style="margin-top:30px; margin-left:80px" runat="server" Text="Zip:"></asp:Label><asp:TextBox ID="txtCusZip" style="margin-top:20px; margin-left:60px" runat="server" Width="720px" CssClass="form-control-static" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblLocation" style="margin-top:30px; margin-left:80px" runat="server" Text="Country:"></asp:Label><asp:DropDownList ID="ddlCusLocation" style="margin-top:20px; margin-left:30px;" CssClass="form-control-static" runat="server" Width="720px">
            <asp:ListItem>Select a country..</asp:ListItem>
            <asp:ListItem>Afghanistan</asp:ListItem>
            <asp:ListItem>Albania</asp:ListItem>
            <asp:ListItem>Algeria</asp:ListItem>
            <asp:ListItem>Andorra</asp:ListItem>
            <asp:ListItem>Angola</asp:ListItem>
            <asp:ListItem>Antigua and Barbuda</asp:ListItem>
            <asp:ListItem>Argentina</asp:ListItem>
            <asp:ListItem>Armenia</asp:ListItem>
            <asp:ListItem>Aruba</asp:ListItem>
            <asp:ListItem>Australia</asp:ListItem>
            <asp:ListItem>Austria</asp:ListItem>
            <asp:ListItem>Azerbaijan</asp:ListItem>
            <asp:ListItem>Bahamas</asp:ListItem>
            <asp:ListItem>Bahrain</asp:ListItem>
            <asp:ListItem>Bangladesh</asp:ListItem>
            <asp:ListItem>Barbados</asp:ListItem>
            <asp:ListItem>Belarus</asp:ListItem>
            <asp:ListItem>Belgium</asp:ListItem>
            <asp:ListItem>Belize</asp:ListItem>
            <asp:ListItem>Benin</asp:ListItem>
            <asp:ListItem>Bhutan</asp:ListItem>
            <asp:ListItem>Bolivia</asp:ListItem>
            <asp:ListItem>Bosnia and Herzegovina</asp:ListItem>
            <asp:ListItem>Botswana</asp:ListItem>
            <asp:ListItem>Brazil</asp:ListItem>
            <asp:ListItem>Brunei </asp:ListItem>
            <asp:ListItem>Bulgaria</asp:ListItem>
            <asp:ListItem>Burkina Faso</asp:ListItem>
            <asp:ListItem>Burma</asp:ListItem>
            <asp:ListItem>Burundi</asp:ListItem>
            <asp:ListItem>Cambodia</asp:ListItem>
            <asp:ListItem>Cameroon</asp:ListItem>
            <asp:ListItem>Canada</asp:ListItem>
            <asp:ListItem>Cape Verde</asp:ListItem>
            <asp:ListItem>Central African Republic</asp:ListItem>
            <asp:ListItem>Chad</asp:ListItem>
            <asp:ListItem>Chile</asp:ListItem>
            <asp:ListItem>China</asp:ListItem>
            <asp:ListItem>Colombia</asp:ListItem>
            <asp:ListItem>Comoros</asp:ListItem>
            <asp:ListItem>Congo</asp:ListItem>
            <asp:ListItem>Costa Rica</asp:ListItem>
            <asp:ListItem>Cote d&#39;Ivoire</asp:ListItem>
            <asp:ListItem>Croatia</asp:ListItem>
            <asp:ListItem>Cuba</asp:ListItem>
            <asp:ListItem>Curacao</asp:ListItem>
            <asp:ListItem>Cyprus</asp:ListItem>
            <asp:ListItem>Czech Republic</asp:ListItem>
            <asp:ListItem>Denmark</asp:ListItem>
            <asp:ListItem>Djibouti</asp:ListItem>
            <asp:ListItem>Dominica</asp:ListItem>
            <asp:ListItem>Dominican Republic</asp:ListItem>
            <asp:ListItem>East Timor</asp:ListItem>
            <asp:ListItem>Ecuador</asp:ListItem>
            <asp:ListItem>Egypt</asp:ListItem>
            <asp:ListItem>El Salvador</asp:ListItem>
            <asp:ListItem>Equatorial Guinea</asp:ListItem>
            <asp:ListItem>Eritrea</asp:ListItem>
            <asp:ListItem>Estonia</asp:ListItem>
            <asp:ListItem>Ethiopia</asp:ListItem>
            <asp:ListItem>Fiji</asp:ListItem>
            <asp:ListItem>Finland</asp:ListItem>
            <asp:ListItem>France</asp:ListItem>
            <asp:ListItem>Gabon</asp:ListItem>
            <asp:ListItem>Gambia</asp:ListItem>
            <asp:ListItem>Georgia</asp:ListItem>
            <asp:ListItem>Germany</asp:ListItem>
            <asp:ListItem>Ghana</asp:ListItem>
            <asp:ListItem>Greece</asp:ListItem>
            <asp:ListItem>Grenada</asp:ListItem>
            <asp:ListItem>Guatemala</asp:ListItem>
            <asp:ListItem>Guinea</asp:ListItem>
            <asp:ListItem>Guyana</asp:ListItem>
            <asp:ListItem>Haiti</asp:ListItem>
            <asp:ListItem>Honduras</asp:ListItem>
            <asp:ListItem>Hong Kong</asp:ListItem>
            <asp:ListItem>Hungary</asp:ListItem>
            <asp:ListItem>Iceland</asp:ListItem>
            <asp:ListItem>India</asp:ListItem>
            <asp:ListItem>Indonesia</asp:ListItem>
            <asp:ListItem>Iran</asp:ListItem>
            <asp:ListItem>Iraq</asp:ListItem>
            <asp:ListItem>Ireland</asp:ListItem>
            <asp:ListItem>Israel</asp:ListItem>
            <asp:ListItem>Italy</asp:ListItem>
            <asp:ListItem>Jamaica</asp:ListItem>
            <asp:ListItem>Japan</asp:ListItem>
            <asp:ListItem>Jordan</asp:ListItem>
            <asp:ListItem>Kazakhstan</asp:ListItem>
            <asp:ListItem>Kenya</asp:ListItem>
            <asp:ListItem>Kiribati</asp:ListItem>
            <asp:ListItem>North Korea</asp:ListItem>
            <asp:ListItem>South Korea</asp:ListItem>
            <asp:ListItem>Kosovo</asp:ListItem>
            <asp:ListItem>Kuwait</asp:ListItem>
            <asp:ListItem>Kyrgyzstan</asp:ListItem>
            <asp:ListItem>Laos</asp:ListItem>
            <asp:ListItem>Latvia</asp:ListItem>
            <asp:ListItem>Lebanon</asp:ListItem>
            <asp:ListItem>Lesotho</asp:ListItem>
            <asp:ListItem>Liberia</asp:ListItem>
            <asp:ListItem>Libya</asp:ListItem>
            <asp:ListItem>Liechtenstein</asp:ListItem>
            <asp:ListItem>Lithuania</asp:ListItem>
            <asp:ListItem>Luxembourg</asp:ListItem>
            <asp:ListItem>Macau</asp:ListItem>
            <asp:ListItem>Macedonia</asp:ListItem>
            <asp:ListItem>Madagascar</asp:ListItem>
            <asp:ListItem>Malawi</asp:ListItem>
            <asp:ListItem>Malaysia</asp:ListItem>
            <asp:ListItem>Maldives</asp:ListItem>
            <asp:ListItem>Mali</asp:ListItem>
            <asp:ListItem>Malta</asp:ListItem>
            <asp:ListItem>Marshall Islands</asp:ListItem>
            <asp:ListItem>Mauritania</asp:ListItem>
            <asp:ListItem>Mauritius</asp:ListItem>
            <asp:ListItem>Mexico</asp:ListItem>
            <asp:ListItem>Micronesia</asp:ListItem>
            <asp:ListItem>Moldova</asp:ListItem>
            <asp:ListItem>Monaco</asp:ListItem>
            <asp:ListItem>Mongolia</asp:ListItem>
            <asp:ListItem>Montenegro</asp:ListItem>
            <asp:ListItem>Morocco</asp:ListItem>
            <asp:ListItem>Mozambique</asp:ListItem>
            <asp:ListItem>Namibia</asp:ListItem>
            <asp:ListItem>Nauru</asp:ListItem>
            <asp:ListItem>Nepal</asp:ListItem>
            <asp:ListItem>Netherlands</asp:ListItem>
            <asp:ListItem>New Zealand</asp:ListItem>
            <asp:ListItem>Nicaragua</asp:ListItem>
            <asp:ListItem>Nigeria</asp:ListItem>
            <asp:ListItem>Norway</asp:ListItem>
            <asp:ListItem>Oman</asp:ListItem>
            <asp:ListItem>Pakistan</asp:ListItem>
            <asp:ListItem>Palau</asp:ListItem>
            <asp:ListItem>Palestinian Territories</asp:ListItem>
            <asp:ListItem>Panama</asp:ListItem>
            <asp:ListItem>Papua New Guinea</asp:ListItem>
            <asp:ListItem>Paraguay</asp:ListItem>
            <asp:ListItem>Peru</asp:ListItem>
            <asp:ListItem>Philippines</asp:ListItem>
            <asp:ListItem>Poland</asp:ListItem>
            <asp:ListItem>Portugal</asp:ListItem>
            <asp:ListItem>Qatar</asp:ListItem>
            <asp:ListItem>Romania</asp:ListItem>
            <asp:ListItem>Russia</asp:ListItem>
            <asp:ListItem>Rwanda</asp:ListItem>
            <asp:ListItem>Saint Kitts and Nevis</asp:ListItem>
            <asp:ListItem>Saint Lucia</asp:ListItem>
            <asp:ListItem>Saint Vincent and the Grenadines</asp:ListItem>
            <asp:ListItem>Samoa </asp:ListItem>
            <asp:ListItem>San Marino</asp:ListItem>
            <asp:ListItem>Sao Tome and Principe</asp:ListItem>
            <asp:ListItem>Saudi Arabia</asp:ListItem>
            <asp:ListItem>Senegal</asp:ListItem>
            <asp:ListItem>Serbia</asp:ListItem>
            <asp:ListItem>Seychelles</asp:ListItem>
            <asp:ListItem>Sierra Leone</asp:ListItem>
            <asp:ListItem>Singapore</asp:ListItem>
            <asp:ListItem>St. Martin</asp:ListItem>
            <asp:ListItem>Slovakia</asp:ListItem>
            <asp:ListItem>Slovenia</asp:ListItem>
            <asp:ListItem>Solomon Islands</asp:ListItem>
            <asp:ListItem>Somalia</asp:ListItem>
            <asp:ListItem>South Africa</asp:ListItem>
            <asp:ListItem>South Sudan</asp:ListItem>
            <asp:ListItem>Spain </asp:ListItem>
            <asp:ListItem>Sri Lanka</asp:ListItem>
            <asp:ListItem>Suriname</asp:ListItem>
            <asp:ListItem>Swaziland </asp:ListItem>
            <asp:ListItem>Sweden</asp:ListItem>
            <asp:ListItem>Switzerland</asp:ListItem>
            <asp:ListItem>Syria</asp:ListItem>
            <asp:ListItem>Taiwan</asp:ListItem>
            <asp:ListItem>Tajikistan</asp:ListItem>
            <asp:ListItem>Tanzania</asp:ListItem>
            <asp:ListItem>Thailand</asp:ListItem>
            <asp:ListItem>Timor-Leste</asp:ListItem>
            <asp:ListItem>Togo</asp:ListItem>
            <asp:ListItem>Tonga</asp:ListItem>
            <asp:ListItem>Trinidad and Tobago</asp:ListItem>
            <asp:ListItem>Tunisia</asp:ListItem>
            <asp:ListItem>Turkey</asp:ListItem>
            <asp:ListItem>Turkmenistan</asp:ListItem>
            <asp:ListItem>Tuvalu</asp:ListItem>
            <asp:ListItem>Uganda</asp:ListItem>
            <asp:ListItem>Ukraine</asp:ListItem>
            <asp:ListItem>United Arab Emirates</asp:ListItem>
            <asp:ListItem>United Kingdom</asp:ListItem>
            <asp:ListItem>Uruguay</asp:ListItem>
            <asp:ListItem>Uzbekistan</asp:ListItem>
            <asp:ListItem>Vanuatu</asp:ListItem>
            <asp:ListItem>Venezuela</asp:ListItem>
            <asp:ListItem>Vietnam</asp:ListItem>
            <asp:ListItem>Yemen</asp:ListItem>
            <asp:ListItem>Zambia</asp:ListItem>
            <asp:ListItem>Zimbabwe</asp:ListItem>
        </asp:DropDownList></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblComments" style="margin-left:80px" runat="server" Text="Comments:"></asp:Label><asp:TextBox ID="txtCusComments" runat="server" TextMode="MultiLine" CssClass="form-control-static" style="margin-top:20px; margin-left:10px; resize:none" Height="137px" Width="720px" /></td></tr>
              <tr><td></td><td></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Label ID="lblCompany" style="margin-top:30px; margin-left:80px" runat="server" Text="Company:"></asp:Label><asp:TextBox ID="txtCusCompany" style="margin-left:20px; margin-top:20px" runat="server" Width="720px" CssClass="form-control-static" /></td></tr>
             <tr><td></td><td></td></tr>
             <tr><td><asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" Width="199px" CssClass="btn btn-primary" style="margin-top:20px; margin-left:350px;" OnClick="btnAddCustomer_Click"></asp:Button></td><td></td></tr>
         </table>
                <br />
                <br />
                <br />
                </div>
    </div>
</asp:Content>

