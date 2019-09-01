<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorio.aspx.cs" Inherits="RhAtestadook.Operador.Relatorio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/MyWay_FF.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 477px;
        }
        .auto-style3 {
            width: 370px;
        }
        .auto-style4 {
            width: 370px;
            height: 25px;
        }
        .auto-style5 {
            width: 477px;
            height: 25px;
        }
        .auto-style6 {
            width: 253px;
            height: 65px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table  border="1" >
 <tr>
    <td class="auto-style3" >
        <img alt="" class="auto-style6" src="../Imagens/logo.jpg" /></td>
    <td class="auto-style2" >Via de retorno do Operador</td>
  </tr>
  <tr>
    <td class="auto-style3" ><strong>Nome:</strong>&nbsp;<asp:Label ID="txtNome"  runat="server" Text=""></asp:Label></td>
    <td class="auto-style2" ><strong>Re:</strong>&nbsp;<asp:Label ID="txtRe" runat="server" Text=""></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="auto-style3"><strong>Operação:</strong>&nbsp;<asp:Label ID="txtOperacao" runat="server" Text=""></asp:Label>
      </td>
    <td class="auto-style2"><strong>Gestor:</strong>&nbsp;<asp:Label ID="txtGestor" runat="server" Text=""></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="auto-style3"><strong>Data Inicial:</strong>&nbsp;<asp:Label ID="txtDataini" runat="server" Text=""></asp:Label>
      </td>
    <td class="auto-style2"><strong>Data Final:</strong>&nbsp;<asp:Label ID="txtDatafin" runat="server" Text=""></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="auto-style3"><strong>Nº de dias:</strong>&nbsp;<asp:Label ID="txtDias" runat="server" Text=""></asp:Label>
      </td>
    <td class="auto-style2"><strong>Horário inicial:</strong>&nbsp;<asp:Label ID="txthr_ini" runat="server" Text=""></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="auto-style4"><strong>Horário da entrega:</strong>&nbsp;<asp:Label ID="txtData_atual" runat="server" Text=""></asp:Label>
      </td>
    <td class="auto-style5"><strong>Horário Final:</strong>&nbsp;<asp:Label ID="txthr_fin" runat="server" Text=""></asp:Label>
      &nbsp;</td>
  </tr>
           <tr>
    <td class="auto-style4"><strong>Status:</strong>&nbsp;<asp:Label ID="txtStatus" runat="server" Text=""></asp:Label>
      </td>
               <td>

               </td>
               </tr>
</table>
    </div>
    </form>
</body>
</html>
