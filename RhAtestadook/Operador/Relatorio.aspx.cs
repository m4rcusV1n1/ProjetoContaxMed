using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;

namespace RhAtestadook.Operador
{
    public partial class Relatorio : System.Web.UI.Page
    {
        private void ConverteAspx2Pdf()
        {

            string attachment = "attachment; filename=ExportacaoAspx2Pdf.pdf";

            Response.ClearContent();

            Response.AddHeader("content-disposition", attachment);

            Response.ContentType = "application/pdf";

            StringWriter stw = new StringWriter();

            HtmlTextWriter htextw = new HtmlTextWriter(stw);

            this.RenderControl(htextw);

            Document document = new Document();

            PdfWriter.GetInstance(document, Response.OutputStream);

            document.Open();

            StringReader str = new StringReader(stw.ToString());

            HTMLWorker htmlworker = new HTMLWorker(document);

            htmlworker.Parse(str);

            document.Close();

            Response.Write(document);

            Response.End();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection conn = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=todo@2015");

            SqlCommand comm = new SqlCommand("SELECT * FROM tb_lancamento WHERE id='" + id + "'", conn);

            /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
            //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
            /* ou */
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@nome", "nome"));
            comm.Parameters.Add(new SqlParameter("@data_atual", "data_atual"));
            comm.Parameters.Add(new SqlParameter("@dias", "dias"));
            comm.Parameters.Add(new SqlParameter("@re", "re"));
            comm.Parameters.Add(new SqlParameter("@GrupoHierarquico", "GrupoHierarquico"));
            comm.Parameters.Add(new SqlParameter("@gestor_imediato", "gestor_imediato"));
            comm.Parameters.Add(new SqlParameter("@dataini", "dataini"));
            comm.Parameters.Add(new SqlParameter("@datafin", "datafin"));
            comm.Parameters.Add(new SqlParameter("@hr_inicial", "hr_inicial"));
            comm.Parameters.Add(new SqlParameter("@hr_final", "hr_final"));
            comm.Parameters.Add(new SqlParameter("@status", "status"));

            conn.Open();
            DbDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                /* dados do banco x text box */

                txtNome.Text = dr["Nome"].ToString();
                txtData_atual.Text = dr["data_atual"].ToString();
                txtDias.Text = dr["dias"].ToString();
                txtRe.Text = dr["re"].ToString();
                txtOperacao.Text = dr["GrupoHierarquico"].ToString();
                txtGestor.Text = dr["gestor_imediato"].ToString();
                txtDataini.Text = dr["dataini"].ToString();
                txtDatafin.Text = dr["datafin"].ToString();
                txthr_ini.Text = dr["hr_inicial"].ToString();
                txthr_fin.Text = dr["hr_final"].ToString(); 
                txtStatus.Text = dr["status"].ToString();
                 }
            conn.Close();

        }
       

 }

}

    