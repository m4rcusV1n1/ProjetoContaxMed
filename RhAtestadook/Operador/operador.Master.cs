using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Data.Common;

namespace CadastroTeste2.Operador
{
    public partial class operador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string login = (string)(Session["login"]);
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123");
            SqlCommand comm = new SqlCommand("SELECT * FROM tb_usuario_new WHERE tipoRegistro='1' AND id_colaborador='" + login + "'", conn);
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@nome", "nome"));

            conn.Open();
            DbDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                /* dados do banco x text box */

                Label1.Text = dr["Nome"].ToString();

            }
            conn.Close();
            //fim do parametro para pouplar dados pessoais
        }

    }
}
