<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlterarSenha.aspx.cs" Inherits="RhAtestadook.AlterarSenha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/MyWay_FF.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Nova Senha:"></asp:Label>
        <br />
        <asp:TextBox ID="txtSenha1" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSenha1" ErrorMessage="Favor Digitar uma Senha!" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Confirmar Senha:"></asp:Label>
        <br />
        <asp:TextBox ID="txtSenha2" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSenha2" ErrorMessage="Favor Digitar uma Senha!" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Alterar" />
    
        <br />
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSenha1" ControlToValidate="txtSenha2" ErrorMessage="As senhas não correspondem." ForeColor="Red" style="font-weight: 700"></asp:CompareValidator>
    
    </div>
    </form>
</body>
</html>
