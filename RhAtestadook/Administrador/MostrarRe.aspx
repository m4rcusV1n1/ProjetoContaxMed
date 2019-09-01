<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarRe.aspx.cs" Inherits="RhAtestadook.Administrador.MostrarRe" ViewStateMode="Disabled" enableViewStateMac="false" enableeventvalidation="false" viewstateencryptionmode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
    &nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Ecadop" ></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Nome:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtNome" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label2"  runat="server" Text="Operação:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtoperacao" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label3"  runat="server" Text="Site:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtLocalizacao" runat="server" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Gestor:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txt_gestor" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label6"  runat="server" Text="Horario de Trabalho:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtHorariotrabalho" runat="server" Width="500px" ReadOnly="True" />
     <br />
     <br />
    </form>
</body>
</html>
