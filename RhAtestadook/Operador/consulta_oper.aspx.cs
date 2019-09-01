using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace CadastroTeste2.Operador
{
    public partial class consulta_oper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logado"] == null || (bool)Session["logado"] != true)
            {
                Response.Redirect("~/Login.aspx");

            }
            else
            {
                string login = (string)(Session["login"]);
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "", "");
                //txtNome.Text = login;
                
            }

            //+ Session["login"]

            SqlConnection cnx = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=todo@2015");
            cnx.Open();
            SqlDataAdapter adp = new SqlDataAdapter("Select * from tb_lancamento where login=" + Session["login"], cnx);
            DataSet dst = new DataSet();
            adp.Fill(dst);
            Consulta_status.DataSource = dst;
            Consulta_status.DataBind();

        }

         

    }
}