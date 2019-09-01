<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exibeDados.aspx.cs" Inherits="AutoCompletar.exibeDados" ViewStateMode="Disabled" enableViewStateMac="false" enableeventvalidation="false" viewstateencryptionmode="Never" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Descrição:"></asp:Label>
    <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtDescricao" runat="server" ReadOnly="True" Width="500"></asp:TextBox>
    </form>
</body>
</html>
