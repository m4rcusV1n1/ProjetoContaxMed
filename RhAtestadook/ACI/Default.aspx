<%@ Page Title="" Language="C#" MasterPageFile="~/ACI/aci.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RhAtestadook.ACI.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <style type="text/css">
       #gridview{
           margin-left:15px;

       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <script type="text/javascript">
        function abrir(URL) {

            var width = 550;
            var height = 715;
            var left = 99;
            var top = 40;
            window.open(URL, 'janela', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + ', scrollbars=yes, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');
        }
</script>
 <img src="../imagens/consultar_atestado.fw.png" width="177" height="30" style="margin-top:15px; margin-left:15px;" alt=""  />
  
<hr style="margin-top:5px; height: 3px; color:#24487C; background-color: #24487C;"/>

<p style="margin-left:15px;">Atestados Lançados:</p>
    <div id="gridview">
        <asp:GridView ID="Consulta_adm" runat="server" AutoGenerateColumns="false" Width="813px" AllowPaging="True" PageSize="35" ShowFooter="True"  onpageindexchanging="GridView1_PageIndexChanging" >
        <Columns>
        <asp:TemplateField HeaderText="Código">
        <ItemTemplate>
        <center><%# Eval("id") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="RE" >
        <ItemTemplate>
        <center><%# Eval("re") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nome" >
        <ItemTemplate>

         <center><%# Eval("nome") %></center>
            
        </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Dias">
        <ItemTemplate>
        <center><%# Eval("dias") %></center>
        </ItemTemplate>
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Data da Entrega">
        <ItemTemplate>
        <center><%# Eval("data_atual") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status">
        <ItemTemplate>
        <center><%# Eval("status") %></center>
        </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Cid">
        <ItemTemplate>
        <center><%# Eval("cid") %></center>
        </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField HeaderText="Site">
        <ItemTemplate>
        <%# Eval("site") %>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Validar">
        <ItemTemplate>
        <center><a href="javascript:abrir('../administrador/consult.aspx?id=<%#Eval("id")%>'); "><img src="../imagens/editar.png" width="20" height="20" alt="excluir"></a></center>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
</asp:Content>
