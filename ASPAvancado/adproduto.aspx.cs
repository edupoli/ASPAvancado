using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace ASPAvancado
{
    public partial class adproduto : System.Web.UI.Page
    {
        //variavel criada para receber o valor do ID da pagina produtos
        string id;
        Conexao con = new Conexao();
        protected void Page_Load(object sender, EventArgs e)
        {
            painelErro.Visible = false;
            painelOk.Visible = false;
            
            //atribui na variavel id o valor passado da pagina produtos
            id = Request.QueryString["id"];
            lblId.Text = id;

            if(id != "" && txtNome.Text =="")
            {
                ListarDadosEditar();
            }
            if(txtNome.Text == "")
            {
                imgSel.ImageUrl = "Imagens/sem_foto.png";
                lblCaminhoImg.Text = "sem_foto.png";
            }
            
        }

        private void ListarDadosEditar()
        {
            string sql;
            MySqlCommand cmd;
            con.AbrirCon();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter();
            sql = "SELECT * FROM produtos WHERE id=@id";
            cmd = new MySqlCommand(sql, con.con);
            cmd.Parameters.AddWithValue("@id", id);
            da.SelectCommand = cmd;
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                txtNome.Text = dt.Rows[0][1].ToString();
                txtValor.Text = dt.Rows[0][2].ToString();
                imgSel.ImageUrl = "Imagens/" + dt.Rows[0][3].ToString();
                lblCaminhoImg.Text = dt.Rows[0][3].ToString();
            }
            
            con.FecharCon();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (txtNome.Text == "")
            {
                painelErro.Visible = true;
                lblMensagemErro.Text = "Favor Preencher o Nome do Produto!";
                txtNome.Focus();
                return;
                
            }
            if(txtValor.Text == "")
            {
                painelErro.Visible = true;
                lblMensagemErro.Text = "Favor Preencher o Valor do Produto!";
                txtValor.Focus();
                return;
                
            }
            decimal numero;
            if (!decimal.TryParse(txtValor.Text, out numero)) 
            {
                painelErro.Visible = true;
                lblMensagemErro.Text = "Insira apenas numeros no campo valor!";
                txtValor.Focus();
                return;
                
            }
            painelErro.Visible = false;

            if(txtNome.Text != "")
            {
                Salvar();
            }
            else
            {
                Editar();
            }
            
        }

        private void Editar()
        {
            string sql;
            MySqlCommand cmd;
            con.AbrirCon();
            sql = "UPDATE produtos SET nome=@nome,valor=@valor,img=@img WHERE id =@id";
            cmd = new MySqlCommand(sql, con.con);
            cmd.Parameters.AddWithValue("@nome", txtNome.Text);
            cmd.Parameters.AddWithValue("@valor", Convert.ToDouble(txtValor.Text));
            cmd.Parameters.AddWithValue("@img", lblCaminhoImg.Text);
            cmd.Parameters.AddWithValue("@id", lblId.Text);

            cmd.ExecuteNonQuery();

            painelOk.Visible = true;
            lblMensagemOK.Text = "Dados Alterados com Sucesso!";
            return;
            con.FecharCon();
            Response.Redirect("produtos.aspx");
        }

        private void Salvar()
        {
            string sql;
            MySqlCommand cmd;
            con.AbrirCon();
            sql = "INSERT INTO produtos(nome,valor,img) VALUES(@nome,@valor,@img)";
            cmd = new MySqlCommand(sql, con.con);
            cmd.Parameters.AddWithValue("@nome", txtNome.Text);
            cmd.Parameters.AddWithValue("@valor",Convert.ToDouble(txtValor.Text));
            cmd.Parameters.AddWithValue("@img", lblCaminhoImg.Text);

            cmd.ExecuteNonQuery();

            painelOk.Visible = true;
            lblMensagemOK.Text = "Dados Inseridos com Sucesso!";
            return;
            con.FecharCon();
            Response.Redirect("produtos.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (img.HasFiles)
            {
                lblCaminhoImg.Text = img.FileName;
                img.SaveAs(Server.MapPath("Imagens/" + img.FileName));
                painelOk.Visible = true;
                imgSel.ImageUrl = "Imagens/" + img.FileName;
                painelErro.Visible = false;
                lblMensagemOK.Text = "Upload da Imagem feita com Sucesso!";
            }
            else
            {
                painelErro.Visible = true;
                painelOk.Visible = false;
                lblMensagemErro.Text = "Selecione uma imagem";
            }
        }
    }
}