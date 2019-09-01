<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginclaro.aspx.cs" Inherits="RhAtestadook.loginclaro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        @import url('Styles/login.css');
        #contax {
            font-size:60px;
            color:#244679;
            font-family:Arial;
        }
    </style>
    <title>:: ContaxMED ::</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="geral">
            <center>
        <fieldset>  
            
            <center>
        <div id="contax">Contax<strong style="color:red;">MED</strong></div>
    </center>
                    <div id="content_login">
                    <label style="margin-left:-170px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Login de Rede</label>
                    <div><asp:TextBox Width="200px" runat="server" ID="tbxLogin" required="required" /></div>
                
                    <label style="margin-left:-160px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Senha de Rede</label>
                    <div><input type="password" style="width:200px" runat="server" id="tbxSenha" required="required" /><br />
                        </div>
                
                    <label style="margin-left:-160px;">&nbsp;&nbsp;&nbsp; Dominio<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Contax-br</asp:ListItem>
                            <asp:ListItem>CitiContax</asp:ListItem>
                            <asp:ListItem>CallCorp</asp:ListItem>
                            <asp:ListItem Value="loginclaro.aspx">ClaroCTX</asp:ListItem>
                        </asp:DropDownList>
                        </label>
                        <br />
                        <br />
                    <br />
                    <asp:Button runat="server" Text="Autenticar" ID="btnLoga" OnClick="Logarclaro" />
                    </div>
             </fieldset>
                </center>
    </div>
    </form>
</body>
</html>
