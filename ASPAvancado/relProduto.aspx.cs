using Microsoft.Reporting.WebForms;
using System;

namespace ASPAvancado
{
    public partial class relProduto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string url;
                // a esprexão "file:///" é sempre utilizada para indicar a raiz do diretorio do computador
                url = "file:///" + Server.MapPath("~/Imagens/");
                /*ESSA É A CHAMADA DO RELATORIO QUANDO FOR CHAMAR O RELATORIO AO CLICAR EM UM BOTÃO POR EXEMPLO
                  DEVE-SE CRIAR UM METODO COM ESSAS INSTRUÇÕES E CHAMAR O METODO NO EVENTO DO BOTAO.
                  colocar apenas essas duas linhas

                ReportViewer1.LocalReport.ReportPath=Server.MapPath("~/relProduto.rdlc");
                ReportViewer1.LocalReport.Refresh();
                */

                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/relProduto.rdlc");

                // SEMPRE COLOCAR O POSTBACK ANTES DOS PARAMENTROS

                ReportParameter[] parametro = new ReportParameter[1];
                parametro[0] = new ReportParameter("caminho", url);
                ReportViewer1.LocalReport.SetParameters(parametro);


                ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}