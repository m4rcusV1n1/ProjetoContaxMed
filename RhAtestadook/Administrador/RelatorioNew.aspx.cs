using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class RelatorioNew : System.Web.UI.Page
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
                    command.CommandText = "SELECT * FROM tb_lancamento WHERE Cast(data_atual as Date) = '" + data + "'";

                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = CarregaDados();
            gridContatos.DataSource = dt;
            gridContatos.DataBind();

            
            //gridContatos.DataSource = dt;
            //gridContatos.DataBind();
            string data = DateTime.Now.ToString();
            string attachment = "attachment; filename=relatorioACI_" + data + ".xls";
            Response.ClearContent();

            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";

            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            gridContatos.RenderControl(htw);
            Response.Write(sw.ToString());
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}