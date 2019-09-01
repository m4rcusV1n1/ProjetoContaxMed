using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.ACI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //parametro de segurança logado
            if (Session["logado"] == null || (bool)Session["logado"] != true)
            {
                Response.Redirect("../administrador/loginadm.aspx");
            }
            else
            {


                SqlConnection cnx = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=todo@2015");
                cnx.Open();
                SqlDataAdapter adp = new SqlDataAdapter("Select * from tb_lancamento where status='Pendente Validação' ORDER BY nome", cnx);
                DataSet dst = new DataSet();
                adp.Fill(dst);
                Consulta_adm.DataSource = dst;
                Consulta_adm.DataBind();
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            Consulta_adm.PageIndex = e.NewPageIndex;
            DataSet dst = new DataSet();


        }
    }
}