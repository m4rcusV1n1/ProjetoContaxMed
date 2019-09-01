using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class loginadm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAutenticar_Click(object sender, EventArgs e)
        {

            string Login = txtUsuario.Text;
            string Senha = txtSenha.Text;
            //string SQLSel;

            //Comando SQL para selecionar o login e senha nbo banco de dados
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123");
            SqlCommand web = new SqlCommand("select * from tb_usuario where login_rede='" + Login + "' and senha = '" + Senha + "'", conn);
            SqlDataAdapter meuAda = new SqlDataAdapter(web);

            //abrindo a conexao
            conn.Open();

            //criando um dataSet();
            DataSet ds = new DataSet();

            //pegando os dados do dataSet
            meuAda.Fill(ds, "db_autentica");

            //declarando a variavel q informará se existe o login e senha.
            int num = ds.Tables["db_autentica"].Rows.Count;

            //criando o data view
            //DataView linha = ds.Tables["db_autentica"].DefaultView;

            //verificando se o login e senha existe na tabela
            if (num == 0)
            {
                //mostrando uma resposta de erro para o administrador
                mostra.Text = "Login ou Senha não conferem!!!";
            }
            else if (num > 0)
            {
                web.CommandType = CommandType.Text; /* Quando usa Query */

                /* paramentros do banco*/
                web.Parameters.Add(new SqlParameter("@nome", "nome"));
                web.Parameters.Add(new SqlParameter("@nivel_usuario", "nivel_usuario"));

                
                DbDataReader dr = web.ExecuteReader();
                while (dr.Read())
                {
                    /* dados do banco x text box */

                    string nivel_usuario = dr["nivel_usuario"].ToString();
                    Session["login"] = txtUsuario.Text;
                    Session["logado"] = true;
                    if (nivel_usuario == "1")
                    {
                        
                        Response.Redirect("Default.aspx");
                    }
                    else if (nivel_usuario == "2")
                    {

                        Response.Redirect("../aci/default.aspx");


                    }

                    conn.Close();
                }

            }
        }
    }
}