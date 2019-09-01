<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RelatorioNew.aspx.cs" Inherits="RhAtestadook.Administrador.RelatorioNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <asp:GridView ID="gridContatos" runat="server" AutoGenerateColumns="False"  BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="866px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="login" HeaderText="login" />
                <asp:BoundField DataField="nome" HeaderText="Nome" />
                <asp:BoundField DataField="re" HeaderText="Re" />
                <asp:BoundField DataField="dataini" HeaderText="Data Inicial do Atestado" />
                <asp:BoundField DataField="datafin" HeaderText="Data Final do Atestado" />
                <asp:BoundField DataField="data_atual" HeaderText="Data da Entrega"/>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </form>
</body>
</html>
