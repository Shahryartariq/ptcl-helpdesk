<%@ Page Title="Bills - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="adminBill.aspx.cs" Inherits="PtclCustomerService.Billing.Admin.adminBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function () {
            $('.datatable').DataTable({
                "order": [],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "language": { "search": "Search", "lengthMenu": "Show _MENU_", "info": "_START_ to _END_ of _TOTAL_", "infoEmpty": "", "infoFiltered": "(filtered from _MAX_)", "zeroRecords": "Nothing matches your search" }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-head">
        <div>
            <h1>Bills</h1>
            <p>This month's bill for every customer. Open one to print it or save it as a PDF.</p>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="table-wrap">
                <asp:GridView CssClass="datatable table" GridLines="None" ClientIDMode="Static" ID="grdViewDetail" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Customer">
                            <ItemTemplate>
                                <%# PtclCustomerService.Ui.Text(string.Concat(Eval("FirstName"), " ", Eval("LastName"))) %>
                                <div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("EmailAddress")) %></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Landline">
                            <ItemTemplate><span class="num"><%# PtclCustomerService.Ui.Landline(Eval("LocationCode"), Eval("landline")) %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate><%# PtclCustomerService.Ui.Text(Eval("LocationName")) %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField Text="Open bill" ControlStyle-CssClass="btn btn-sm btn-secondary" ItemStyle-CssClass="text-end"
                            DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="Download.aspx?UserID={0}" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label runat="server" ID="lblCustomersMsg" CssClass="empty d-block"></asp:Label>
        </div>
    </section>
</asp:Content>
