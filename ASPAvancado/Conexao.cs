using MySql.Data.MySqlClient;
using System.Web;

namespace ASPAvancado
{
    public class Conexao
    {
        public string conec = "SERVER = localhost; DATABASE= aspav; UID=root; PWD=30102569";
        public MySqlConnection con = null;

        public void AbrirCon()
        {
            try
            {
                con = new MySqlConnection(conec);
                con.Open();
               // HttpContext.Current.Response.Write("Conectado");
            }
            catch (System.Exception ex)
            {

                HttpContext.Current.Response.Write("Erro ao conectar" + ex);
            }
        }
        public void FecharCon()
        {
            try
            {
                con = new MySqlConnection(conec);
                con.Close();
            }
            catch (System.Exception ex)
            {

                HttpContext.Current.Response.Write("Erro ao conectar" + ex);
            }
        }
    }
}