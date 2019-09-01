<%@ WebHandler Language="C#" Class="AutocompleteData" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;

public class AutocompleteData : IHttpHandler {
    
public void ProcessRequest (HttpContext context) {
string firstname = context.Request.QueryString["q"];
string sql = "SELECT clinica FROM tb_clinica where clinica like '" + firstname + "%' ; ";
string conexao = ConfigurationManager.ConnectionStrings["constr"].ToString();
    using (SqlConnection connection = new SqlConnection(conexao))
        using (SqlCommand command = new SqlCommand(sql, connection))
        {
            connection.Open();
  
            using (SqlDataReader reader = command.ExecuteReader())
            {
                List<string> list = new List<string>();     
                while (reader.Read())
                {
                    context.Response.Write(reader[0].ToString() + Environment.NewLine);
                }
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}