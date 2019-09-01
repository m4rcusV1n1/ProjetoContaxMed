<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exibir_dados_crm.aspx.cs" Inherits="CadastroTeste2.Operador.exibir_dados_crm" ViewStateMode="Disabled" enableViewStateMac="false" enableeventvalidation="false" viewstateencryptionmode="Never"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     &nbsp;&nbsp;<asp:Label ID="Label13"  runat="server" Text="Médico:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtMedico" runat="server" Width="500px" required="required" ReadOnly="True" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMedico" ErrorMessage="CRM não Cadastrado Favor procurar SMO para Cadastro." ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
    </form>
</body>
</html>
  