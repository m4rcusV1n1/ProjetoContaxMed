<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="export.aspx.cs" Inherits="RhAtestadook.export" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="txtData" runat="server" TextMode="Date" Height="22px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Emitir Relatório" OnClick="btnGeraDocumento_Click"/>
    
    </div>
    </form>
</body>
</html>
