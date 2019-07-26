<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adproduto.aspx.cs" Inherits="ASPAvancado.adproduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <asp:LinkButton class="navbar-brand" runat="server" PostBackUrl="~/produtos.aspx" Text="Produtos"></asp:LinkButton>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <asp:LinkButton class="navbar-brand" runat="server" PostBackUrl="~/adproduto.aspx" Text="Adicionar"></asp:LinkButton>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <asp:LinkButton class="navbar-brand" runat="server" PostBackUrl="~/relProduto.aspx" Text="Relatorio"></asp:LinkButton>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                </ul>
                <span class="form-inline my-2 my-lg-0">
                    <asp:TextBox runat="server" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
                    <asp:Button runat="server" class="btn btn-outline-success my-2 my-sm-0" type="submit" Text="Search" />
                </span>
            </div>
        </nav>
        <div style="margin: auto; width: 900px; margin-top: 50px">
            <h3>Cadastro de Produtos</h3><br /><br />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server">Nome</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="txtNome" placeholder="Nome do Produto" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server">Valor</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="txtValor" placeholder="Valor do Produto" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server">Imagem</asp:Label><br />
                        <asp:FileUpload runat="server" ID="img" ToolTip="Selecione uma Imagem" /><br />
                        <asp:Button runat="server" ID="btnUpload" type="submit" Text="Upload" class="btn btn-light" OnClick="btnUpload_Click" />
                    </div>
                    <asp:Button runat="server" type="submit" Text="Salvar" class="btn btn-primary" ID="btnSalvar" OnClick="btnSalvar_Click" />
                </div>
                <div class="col-md-6">
                    <asp:Image runat="server" Width="300px" ID="imgSel" />
                </div>
            </div>
            <br />
            <br />
            <asp:Panel ID="painelErro" runat="server">
                <div style="margin: auto;" class="alert alert-danger" role="alert">
                    <asp:Label runat="server" ID="lblMensagemErro"></asp:Label><br />
                </div>
            </asp:Panel>

            <asp:Panel ID="painelOk" runat="server">
                <div style="margin: auto;" class="alert alert-success" role="alert">
                    <asp:Label runat="server" ID="lblMensagemOK"></asp:Label><br />
                    <asp:Label runat="server" ID="lblCaminhoImg" Visible="false"></asp:Label><br />
                    <asp:Label runat="server" ID="lblId" Visible="false"></asp:Label><br />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
