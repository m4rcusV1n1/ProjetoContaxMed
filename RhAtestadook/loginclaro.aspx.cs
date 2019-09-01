using LoginNaRede;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook
{
    public partial class loginclaro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Logarclaro(object sender, EventArgs e)
        {
            Acesso acesso = new Acesso();
            string ipServer = ConfigurationManager.AppSettings["Servidor1"].ToString();

            if (acesso.Autentica(ipServer, tbxLogin.Text, tbxSenha.Value))
            {
                Session["login"] = tbxLogin.Text;
                Session["logado"] = true;
                Response.Redirect("Operador/LancarAtestOperador.aspx");

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "", "<script>alert('Login ou senha inválidos')</script>");
            }
        }
    }
}