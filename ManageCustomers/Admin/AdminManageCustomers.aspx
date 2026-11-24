<%@ Page Title="Customers - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminManageCustomers.aspx.cs" Inherits="PtclCustomerService.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function () {
            $('#GVCustomers').DataTable({
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
            <h1>Customers</h1>
            <p>Everyone with a PCS account. Open a customer to see their complaints.</p>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="table-wrap">
                <asp:GridView runat="server" ID="GVCustomers" ClientIDMode="Static" CssClass="table" GridLines="None" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowDeleting="GV_RowDeleting" OnRowEditing="GV_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Customer">
                            <ItemTemplate>
                                <a href="<%# ResolveUrl("~/ManageAccounts/Admin/AdminCustomersProfile.aspx?UserID=" + Eval("UserID")) %>"><%# PtclCustomerService.Ui.Text(string.Concat(Eval("FirstName"), " ", Eval("LastName"))) %></a>
                                <div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("EmailAddress")) %></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Phone" HeaderText="Mobile" ItemStyle-CssClass="num" />
                        <asp:BoundField DataField="Cnic" HeaderText="CNIC" ItemStyle-CssClass="num" />
                        <asp:TemplateField HeaderText="Account">
                            <ItemTemplate><%# PtclCustomerService.Ui.Account(Eval("Status")) %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemStyle CssClass="text-end text-nowrap" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkEdit" CssClass="btn btn-sm btn-secondary" CommandName="edit" CommandArgument='<%# Bind("UserID") %>'>Edit</asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lnkDelete" CssClass="btn btn-sm btn-danger" CommandName="delete" CommandArgument='<%# Bind("UserID") %>' OnClientClick="return confirm('Delete this customer and all their complaints? This can\'t be undone.');">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label runat="server" ID="lblCustomersMsg" CssClass="empty d-block"></asp:Label>
        </div>
    </section>
</asp:Content>
