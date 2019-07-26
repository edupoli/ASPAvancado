<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="produtos.aspx.cs" Inherits="ASPAvancado.produtos" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <title>Produtos</title>
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
        <div class="container">
            <br />
            <h3>Lista de Produtos</h3>
            <div align="right" style="margin: 25px">
                <asp:Button runat="server" type="button" Text="Adicionar" class="btn btn-success" PostBackUrl="~/adproduto.aspx" />
                <asp:Button runat="server" type="button" Text="Relatorio" class="btn btn-info" PostBackUrl="~/relProduto.aspx" />
            </div>

            <asp:Panel ID="painelErroGrid" runat="server">
                <div style="margin: auto; margin-bottom: 20px;" class="alert alert-info" role="alert">
                    <asp:Label runat="server" ID="gridMensagemErro"></asp:Label><br />
                </div>
            </asp:Panel>

            <asp:GridView class="table table-striped" ID="grid" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_SelectedIndexChanged" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Id" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" />
                    <asp:BoundField DataField="valor" HeaderText="Valor" />
                    <asp:ImageField DataImageUrlField="img" HeaderText="Imagem" DataImageUrlFormatString="Imagens/{0}">

                        <ControlStyle Height="40px" Width="40px" />
                    </asp:ImageField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button class="btn badge-info" Text="Editar" ID="btnEditar" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="btnEditar_Click" />
                            <asp:Button class="btn badge-danger" Text="Deletar" ID="btnExcluir" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="btnExcluir_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
