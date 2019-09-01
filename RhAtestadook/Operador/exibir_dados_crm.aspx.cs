using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.IO;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;

namespace CadastroTeste2.Operador
{
    public partial class exibir_dados_crm : System.Web.UI.Page
    {
        protected override void Render(HtmlTextWriter output)
        {
            StringWriter stringWriter = new StringWriter();

            HtmlTextWriter textWriter = new HtmlTextWriter(stringWriter);
            base.Render(textWriter);

            textWriter.Close();

            string strOutput = stringWriter.GetStringBuilder().ToString();

            strOutput = Regex.Replace(strOutput, "<input[^>]*id=\"__VIEWSTATE\"[^>]*>", "", RegexOptions.Singleline);

            output.Write(strOutput);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            string crm = Request.QueryString["crm"];
            //string crm = "10004BA";
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123");

            SqlCommand comm = new SqlCommand("SELECT * FROM tb_medico WHERE crm='" + crm + "'", conn);

            /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
            //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
            /* ou */
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@id", "id"));
            comm.Parameters.Add(new SqlParameter("@medico", "medico"));
            comm.Parameters.Add(new SqlParameter("@crm", "crm"));
            conn.Open();
            DbDataReader dr = comm.ExecuteReader();

            while (dr.Read())
            {
                /* dados do banco x text box */
                txtMedico.Text = dr["medico"].ToString();


            }
            conn.Close();
        }
    }
}