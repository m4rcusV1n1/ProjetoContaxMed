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
    public partial class RelatorioExcel2 : System.Web.UI.Page
    {

        public DataTable CarregaDados()
        {
            string conString = @"Data Source=APPCTX06SALLM\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=todo@2015";
            DataTable dt = new DataTable();

            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    string data = DateTime.Now.ToString();
                    command.Connection = connection;
                    command.CommandText = "SELECT * FROM tb_lancamento WHERE Cast(data_atual as Date) = '" + data + "' AND site='"+ txtSite.Text + "' ORDER BY nome";

                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }

        protected void btnCarregarDados_Click(object sender, EventArgs e)
        {
            DataTable dt = CarregaDados();
            gridContatos.DataSource = dt;
            gridContatos.DataBind();

            Session.Add("Contatos2Excel", dt);

        }

        protected void btnExportarExcel_Click(object sender, EventArgs e)
        {
            Response.Redirect("exporta_excel.aspx");
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gridContatos.PageIndex = e.NewPageIndex;

            CarregaDados();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //parametro de segurança logado
            if (Session["logado"] == null || (bool)Session["logado"] != true)
            {
                Response.Redirect("../administrador/loginadm.aspx");
            }
            else
            {
            }
        }
    }
}