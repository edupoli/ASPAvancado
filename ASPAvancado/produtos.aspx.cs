using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace ASPAvancado
{
    public partial class produtos : System.Web.UI.Page
    {
        int id;
        Conexao con = new Conexao();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            grid.Visible = false;
            painelErroGrid.Visible = false;
            Listar();

        }

        private void Listar()
        {
            string sql;
            MySqlCommand cmd;
            con.AbrirCon();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter();
            sql = "SELECT * FROM produtos ORDER BY nome ASC";
            cmd = new MySqlCommand(sql, con.con);
            da.SelectCommand = cmd;
            da.Fill(dt);

            if(dt.Rows.Count > 0)
            {
                grid.Visible = true;
                grid.DataSource = dt;
                grid.DataBind();
            }
            else
            {
                grid.Visible = false;
                painelErroGrid.Visible = true;
                gridMensagemErro.Text = "Não existem Produtos Cadastrados!";
            }
            con.FecharCon();
            
        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            //envia para a pagina adproduto o ID como parametro
            id = Convert.ToInt32((sender as Button).CommandArgument);
            Response.Redirect("adproduto.aspx?id=" + id);

        }
        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            id = Convert.ToInt32((sender as Button).CommandArgument);
            Excluir();
        }

        private void Excluir()
        {
            
            string sql;
            MySqlCommand cmd;
            con.AbrirCon();
            sql = "DELETE FROM produtos WHERE id =@id";
            cmd = new MySqlCommand(sql, con.con);
            cmd.Parameters.AddWithValue("@id",id);

            cmd.ExecuteNonQuery();

            painelErroGrid.Visible = true;
            gridMensagemErro.Text = "Produto excluido com Sucesso!";
            return;
            con.FecharCon();
            Response.Redirect("produtos.aspx");
        }

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}