<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/administrador.Master" AutoEventWireup="true" CodeBehind="ConsultaRe.aspx.cs" Inherits="RhAtestadook.Administrador.ConsultaRe" %>
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
    <div>
   <img src="../imagens/consultar_atestado.fw.png" width="177" height="30" style="margin-top:15px; margin-left:15px;" alt=""  />
  <hr style="margin-top:5px; height: 3px; color:#24487C; background-color: #24487C;"/>
        <br />
        <br />
         &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Digite Re:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="buscar" runat="server" Text="Buscar Atestado" OnClick="Button1_Click"  />
        <br />
        <br />
    </div>
    <div id="gridview">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="806px" >
    
    <Columns>

        <asp:TemplateField HeaderText="Nome">
        <ItemTemplate>

        <%# Eval("nome") %>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Data do Atestado Inicio">
        <ItemTemplate>
        <center><%# DataBinder.Eval(Container.DataItem, "dataini", "{0:dd/MM/yyyy}") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Data do Atestado Fim" >
        <ItemTemplate>
           

        <center><%# DataBinder.Eval(Container.DataItem, "datafin", "{0:dd/MM/yyyy}") %></center>
        </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Crm">
        <ItemTemplate>
        <%# Eval("crm") %>
        </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Motivo">
        <ItemTemplate>
        <%# Eval("motivo") %>
        </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Dias">
        <ItemTemplate>
       <center> <%# Eval("dias") %></center>
        </ItemTemplate>
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Data da Entrega" >
        <ItemTemplate>
         <%# Eval("data_atual") %>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status" >
        <ItemTemplate>
        <%# Eval("status") %>
        </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Cid">
        <ItemTemplate>
        <%# Eval("cid") %>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Editar">
        <ItemTemplate>
        <center><a href="javascript:abrir('consult.aspx?id=<%#Eval("id")%>'); "><img src="../imagens/editar.png" width="20" height="20" alt="excluir"></a></center>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    <EmptyDataTemplate>
    <span style="color: red"><strong>Não foram encontrados registros para a busca com esse Re.</strong></span>
    </EmptyDataTemplate>

    </asp:GridView>
    </div>
</asp:Content>
