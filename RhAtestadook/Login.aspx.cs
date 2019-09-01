using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace LoginNaRede
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Logar(object sender, EventArgs e) 
        {
            
            Acesso acesso = new Acesso();
            string ipServer = ConfigurationManager.AppSettings["Servidor"].ToString();
           
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
