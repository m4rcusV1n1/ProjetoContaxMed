using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.IO;
using System.Data.SqlClient;


namespace RhAtestadook
{
    public partial class export : System.Web.UI.Page
    {
        protected DataTable pegaTabela()
        {
            
            //string conString = @"Data Source=SALPBCTSDE75699\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=todo@2015";
            //SqlConnection conn = new SqlConnection(conString);
            //conn.Open();
            //SqlCommand adapter = new SqlCommand("SELECT * FROM tb_lancamento WHERE data_atual='" + txtData.Text + "'", conn);
            //DataTable dt = new DataTable();
            //adapter.Fill(dt);
            //conn.Close();

            //return dt;
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=todo@2015;"))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = con;
                    command.CommandText = "SELECT * FROM tb_lancamento WHERE Cast(data_atual as Date) = '" + txtData.Text + "'";
                    
                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);
                    }
                }
            }
            return dt;
        
            //*********************************************************

        }
        protected DataTable criaTabela()
        {
            //Cria um datatable temporario para vincular valores
            DataTable dtTemp = new DataTable(); DataRow dr;
            //cria o schema 
            dtTemp.Columns.Add("login"); 
            dtTemp.Columns.Add("data_atual");
            //Imclui dados
            dr = dtTemp.NewRow(); dr["login"] = "1"; dr["login2"] = "testet"; dtTemp.Rows.Add(dr);
            dr = dtTemp.NewRow(); dr["data_atual"] = "2"; dr["data"] = "teste"; dtTemp.Rows.Add(dr);
            //dr = dtTemp.NewRow(); dr["Codigo"] = "3"; dr["Nome"] = "Jessica"; dtTemp.Rows.Add(dr);
            //dr = dtTemp.NewRow(); dr["Codigo"] = "4"; dr["Nome"] = "Jefferson"; dtTemp.Rows.Add(dr);
            //dr = dtTemp.NewRow(); dr["Codigo"] = "5"; dr["Nome"] = "Janice"; dtTemp.Rows.Add(dr);
            //retorna o datatable
            return dtTemp;

        }
        protected void btnGeraDocumento_Click(object sender, EventArgs e)
        {
            //Conteúdo do Response
            Response.AddHeader("content-disposition", "attachment; filename=DocumentoExcel.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.xls";

            //Objetos
            StringWriter stringWrite = new System.IO.StringWriter();
            HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            //Inclui controles 
            DataGrid dgDados = new DataGrid();
            this.form1.Controls.Add(dgDados);

            ////Definição de cores
            //dgDados.HeaderStyle.BackColor = System.Drawing.Color.Yellow;
            dgDados.DataSource = pegaTabela();
            dgDados.DataBind();

            ////definição das cores das células
            //foreach (DataGridItem dgi in dgDados.Items)
            //    foreach (TableCell tcGridCells in dgi.Cells)
            //        tcGridCells.Attributes.Add("class", "sborda");

            //Renderiza o DataGrid
            dgDados.RenderControl(htmlWrite);

            //Inluir a classe de estilo
            //Response.Write(@"<style> .sborda { color : Red;border : 1px Solid Balck; } </style> ");
            //Exporta 
            Response.Write(stringWrite.ToString());
            //encerra
            Response.End();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }

}