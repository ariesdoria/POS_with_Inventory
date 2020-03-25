<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeMainPage.aspx.cs" Inherits="Employee_EmployeeMainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style type="text/css">
        .salesTransaction{
            margin-left:180px;
            height:370px;
            width:550px;
            border-radius:5px;
        }
        .newCustomer{
            margin-left:720px;
            margin-top:-380px;
            width:515px;
            height:780px;
            border-radius:5px;
            background-color:#ececec;
        }
        .newGiftcard{
            width:520px;
            height:250px;
            background-color:#ececec;
            border-radius:5px;
            margin-left:160px;
            margin-top:-155px;            
        }
        .requiredFields{
            margin-top:80px;
            margin-left:180px;
            width:500px;
        }
    </style>
    <div class="requiredFields">
        <table>
            <tr>
                <td>
                   Note: Fields that marked in red are required.
                </td>
            </tr>
        </table>
    </div>
    <div class="salesTransaction">
        <br />
        <table>
            <tr><td></td></tr>
            <tr><td></td><td></td><td></td><td></td><td></td><td>            
            <asp:TextBox ID="txtSearchItem" runat="server" CssClass="form-control" PlaceHolder="Enter item name or product ID" Width="278px" /></td>
            <td></td>            
            <td><asp:Button ID="btnSearchItem" runat="server" style="margin-left:10px" CssClass="btn btn-primary" Text="Search" Width="74px" OnClick="btnSearchItem_Click" /></td>
            <td></td>
            <td><asp:Button ID="btnClearSearch" runat="server" style="margin-left:10px" CssClass="btn btn-warning" Text="Clear Entries" OnClick="btnClearSearch_Click" /></td>
            </tr>            
        </table>

        <br />
        <div class="form-group">       
        <table>                      
            <tr>
                <td></td><td align="right">Product ID:</td><td></td><td>
                <asp:TextBox ID="txtProductID" Enabled="false" style="margin-left:10px" CssClass="form-control-static" runat="server" Width="339px" /></td>
            </tr>
         </table>
        </div>
        <div class="form-group">
            <table>
              <tr>
                <td></td><td align="right">Item Name:</td><td></td><td>
                <asp:TextBox ID="txtItemName" Enabled="false" style="margin-left:7px" CssClass="form-control-static" runat="server" Width="339px"  /></td>
             </tr>
            </table>
        </div>
        <div class="form-group">
            <table>
            <tr>
                <td></td><td align="right">Category:</td><td></td><td>
                <asp:TextBox ID="txtCategory" Enabled="false" style="margin-left:18px" CssClass="form-control-static" runat="server" Width="339px" /></td>
            </tr>
            </table>
        </div>
        <div class="form-group">
            <table>
              <tr>
                <td></td><td align="right">Description:</td><td></td><td>
                <asp:TextBox ID="txtDescription" Enabled="false" style="margin-left:5px" CssClass="form-control-static" runat="server" Width="339px" /></td>
             </tr>
            </table>
        </div>
        <div class="form-group">
            <table>
            <tr>
                <td></td><td align="right">Cost Price:</td><td></td><td>
                <asp:TextBox ID="txtCostPrice" Enabled="false" style="margin-left:10px" CssClass="form-control-static" runat="server" Width="340px" /></td>
            </tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr>
                <td></td><td align="right">Selling Price:</td><td></td><td>
                <asp:TextBox ID="txtSellingPrice" Enabled="false" CssClass="form-control-static" runat="server" Width="339px" /></td>
                </tr>
            </table>
        </div>
        <div class="form-group">
            <table>
            <tr>
                <td></td><td align="right" style="color:red">Quantity:</td><td></td><td>
                <asp:TextBox ID="txtQuantity" runat="server" style="margin-left:25px" CssClass="form-control" PlaceHolder="How many?" Width="338px" /></td>
            </tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr>
                <td></td><td align="right">Remaining:</td><td></td><td>
                <asp:TextBox ID="txtRemainingStock" Enabled="false" style="margin-left:10px" CssClass="form-control-static" runat="server" Width="340px" /></td>
            </tr>
            </table>
        </div>    
        <div class="form-group">
            <table>
                 <tr>
                <td><asp:Button ID="btnAddOrder" runat="server" CssClass="btn btn-success" Text="Add Order" Width="174px" style="margin-left:150px" OnClick="btnAddOrder_Click" /></td>
            </tr>
            </table>
        </div>       
    </div>




    <div class="newCustomer">
        <br />
        <div class="form-group">
            <table>
                <tr><td></td><td></td><td></td><td>
                <asp:Label ID="lblNewCustomer" runat="server" Text="Add a customer" style="margin-left:190px; font-size:large"/></td></tr>        
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblCusFirstname" runat="server" style="margin-left:50px; color:red" Text="Firstname:" /></td><td></td>
                    <td><asp:textbox ID="txtCusFname" CssClass="form-control" style="margin-left:40px" runat="server" Width="313px" /></td>
                </tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                 <tr><td></td><td><asp:Label ID="lblCusLastname" runat="server" style="margin-left:50px; color:red" Text="Lastname:" /></td><td></td>
                 <td><asp:TextBox ID="txtCusLname" runat="server" CssClass="form-control" style="margin-left:40px" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblCusEmail" runat="server" style="margin-left:50px" Text="E-mail:" /></td><td></td>
                <td><asp:TextBox ID="txtCusEmail" runat="server" CssClass="form-control" style="margin-left:62px" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblCusPhone" runat="server" style="margin-left:50px; color:red" Text="Phone Number:" /></td><td></td>
                <td><asp:TextBox ID="txtCusPhone" runat="server" CssClass="form-control" style="margin-left:5px" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblCusAddress" runat="server" style="margin-left:50px; color:red" Text="Address:" /></td><td></td>
                <td><asp:TextBox ID="txtCusAddress" runat="server" CssClass="form-control" style="margin-left:50px" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblCusCity" runat="server" style="margin-left:50px" Text="City:" /></td><td></td>
                <td><asp:TextBox ID="txtCusCity" runat="server" CssClass="form-control" style="margin-left:79px" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblState" runat="server" style="margin-left:50px" Text="State:" /></td><td></td>
                <td><asp:TextBox ID="txtCusState" runat="server" CssClass="form-control" style="margin-left:70px" Width="313px" /></td></tr>
            </table>
        </div>            
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblZip" style="margin-left:50px" runat="server" Text="Zip:" /></td><td></td>
                <td><asp:TextBox ID="txtCusZip" runat="server" CssClass="form-control" style="margin-left:82px" Width="200px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
            <tr><td></td><td><asp:Label ID="lblCountry" runat="server" style="margin-left:50px" Text="Country:" /></td><td></td>
            <td><asp:DropDownList ID="ddlCusLocation" runat="server" CssClass="form-control" style="margin-left:50px" Width="313px">
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
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblCusComments" runat="server" Text="Comments:" style="margin-left:50px" /></td><td></td>
                <td><asp:TextBox ID="txtCusComments" runat="server" TextMode="MultiLine" CssClass="form-control" style="margin-left:30px" Height="137px" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td><asp:Label ID="lblCusCompanyName" runat="server" style="margin-left:40px" Text="Company Name:" /></td><td></td>
                <td><asp:TextBox ID="txtCusCompanyName" runat="server" Width="313px" CssClass="form-control" style="margin-left:5px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td></td><td></td><td>
                <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" CssClass="btn btn-warning" style="margin-left:220px" Width="180px" OnClick="btnAddCustomer_Click"/></td></tr>
            </table>
        </div>
    </div>

    <div class="newGiftcard">
        <br />
        <div class="form-group">
            <table>
                <tr><td></td><td></td><td></td><td></td><td></td>
                <td><asp:Label ID="lblNewGiftcard" runat="server" Text="Add a Giftcard" style="margin-left:150px; font-size:large;"/></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td></td><td></td><td><asp:Label ID="lblGiftcardNumber" runat="server" style="color:red; margin-left:15px" Text="Giftcard Number:" /></td><td></td>
                <td><asp:TextBox ID="txtGiftcardNumber" runat="server" style="margin-left:10px" CssClass="form-control" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td></td><td></td><td><asp:Label ID="lblCustomer" runat="server" style="color:red; margin-left:15px" Text="Customer:" /></td><td></td>
                <td><asp:TextBox ID="txtCustomer" runat="server" style="margin-left:50px" CssClass="form-control" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td></td><td></td><td><asp:Label ID="lblGiftcardValue" style="color:red; margin-left:15px" runat="server" Text="Giftcard Value:" /></td><td></td>
                <td><asp:TextBox ID="txtGiftcardValue" runat="server" style="margin-left:22px" CssClass="form-control" Width="313px" /></td></tr>
            </table>
        </div>
        <div class="form-group">
            <table>
                <tr><td></td><td></td><td></td><td></td><td></td><td>
                <asp:Button ID="btnAddGiftcard" runat="server" Text="Add Giftcard" CssClass="btn btn-danger" Width="129px" style="margin-left:195px" OnClick="btnAddGiftcard_Click"/></td></tr>
            </table>
        </div>    
        <br />        
    </div>
</asp:Content>

