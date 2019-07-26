<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="relProduto.aspx.cs" Inherits="ASPAvancado.relProduto" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <title></title>
</head>
<body>
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
            <div class="container" style="margin: auto; width=100%">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Height="800px" Width="100%">
                    <LocalReport ReportPath="relProduto.rdlc" EnableExternalImages="True">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSetProduto" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ASPAvancado.aspavDataSetTableAdapters.produtosTableAdapter"></asp:ObjectDataSource>
            </div>
        </form>
    </body>
</html>
