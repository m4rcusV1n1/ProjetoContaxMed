<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exporta_excel.aspx.cs" Inherits="RhAtestadook.ACI.exporta_excel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #contax {
            font-size:38px;
            color:#244679;
            font-family:Arial;
        }
        #conteudo1 {
            width: 519px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contax">Contax<strong style="color:red;">MED</strong></div>
        <asp:GridView ID="gridContatos" runat="server" AutoGenerateColumns="False" onpageindexchanging="GridView1_PageIndexChanging" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="866px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="data_atual" HeaderText="Data da Entrega"/>
                <asp:BoundField DataField="nome" HeaderText="Nome" />
                <asp:BoundField DataField="re" HeaderText="Re" />
                <asp:BoundField DataField="dataini" HeaderText="Data Inicial do Atestado" />
                <asp:BoundField DataField="datafin" HeaderText="Data Fim do Atestado" />
                <asp:BoundField DataField="dias" HeaderText="Dias" />
                
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
