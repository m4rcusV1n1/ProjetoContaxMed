<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginadm.aspx.cs" Inherits="RhAtestadook.Administrador.loginadm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/style.css" rel="stylesheet" />
    <link href="../Styles/MyWay_FF.css" rel="stylesheet" />
     <style type="text/css">
        #contax {
            font-size:60px;
            color:#244679;
            font-family:Arial;
            margin-left:-50px;
 
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">        
    <div id="loginadm">
        
       <div id="contax">Contax<strong style="color:red;">MED</strong></div>
        <h3>Acesso Restrito para Administradores</h3>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Login:" style="font-weight: 700; color:black;"></asp:Label>
        <br />
        <asp:TextBox ID="txtUsuario" runat="server" Width="200px"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Senha:" style="font-weight: 700; color:black;"></asp:Label>

        <br />
        <asp:TextBox ID="txtSenha" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Entrar no Sistema"  OnClick="btnAutenticar_Click"/>
        <br />
        <br />
        <asp:Label ID="mostra" runat="server" ForeColor="Red" style="font-weight: 700" ></asp:Label>
        <br />
        <br />
        
        <br />
       
    </div>
    </form>
</body>
</html>
