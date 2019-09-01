using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class MostrarRe : System.Web.UI.Page
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
            string re = Request.QueryString["re"];
            //string re = "1240024";
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123");

            SqlCommand comm = new SqlCommand("SELECT * FROM tb_usuario_new WHERE tipoRegistro='1' AND re='" + re + "'", conn);

            /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
            //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
            /* ou */
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@id_colaborador", "id_colaborador"));
            comm.Parameters.Add(new SqlParameter("@nome", "nome"));
            comm.Parameters.Add(new SqlParameter("@nomeOperacao", "nomeGrupoHierarquico"));
            comm.Parameters.Add(new SqlParameter("@site", "site"));
            comm.Parameters.Add(new SqlParameter("@Re", "Re"));
            //comm.Parameters.Add(new SqlParameter("@site", "site"));
            comm.Parameters.Add(new SqlParameter("@idEcadopSupervisor", "idEcadopSupervisor"));
            comm.Parameters.Add(new SqlParameter("@CPF", "CPF"));
            conn.Open();
            DbDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                /* dados do banco x text box */
                txtLogin.Text = dr["id_colaborador"].ToString();
                txtNome.Text = dr["Nome"].ToString();
                txtoperacao.Text = dr["nomeGrupoHierarquico"].ToString();
                txtHorariotrabalho.Text = dr["turno"].ToString();
                txt_gestor.Text = dr["idEcadopSupervisor"].ToString();
                txtLocalizacao.Text = dr["site"].ToString();
                string cpf = dr["cpf"].ToString();
                Session["cpf"] = cpf;


            }
            conn.Close();
        }
    }
}