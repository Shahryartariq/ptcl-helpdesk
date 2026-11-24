<%@ Page Title="Admins - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageAdmins.aspx.cs" Inherits="PtclCustomerService.ManageAdmins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function () {
            $('#GVAdmin').DataTable({
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
            <h1>Admins</h1>
            <p>Everyone on the support team. Inactive admins can't log in.</p>
        </div>
        <div class="page-actions">
            <asp:HyperLink runat="server" CssClass="btn btn-primary" NavigateUrl="~/ManageAccounts/Admin/AdminSetup.aspx"><i class="fas fa-plus me-1"></i> Add an admin</asp:HyperLink>
        </div>
    </div>

    <asp:Label runat="server" ID="lblAdminmsg" CssClass="form-msg"></asp:Label>

    <section class="panel">
        <div class="panel-body">
            <div class="table-wrap">
                <asp:GridView runat="server" ID="GVAdmin" ClientIDMode="Static" CssClass="table" GridLines="None" AutoGenerateColumns="false" OnRowCommand="GVAdmin_RowCommand" OnRowDeleting="GVAdmin_RowDeleting" OnRowEditing="GVAdmin_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <a href="AdminProfile.aspx?AdminID=<%# Eval("AdminID") %>"><%# PtclCustomerService.Ui.Text(Eval("FullName")) %></a>
                                <div class="text-muted small">@<%# PtclCustomerService.Ui.Text(Eval("UserName")) %></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EmailAddress" HeaderText="Email" />
                        <asp:BoundField DataField="Location" HeaderText="Office" />
                        <asp:TemplateField HeaderText="Account">
                            <ItemTemplate><%# PtclCustomerService.Ui.Account(Eval("Status")) %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemStyle CssClass="text-end text-nowrap" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkEdit" CssClass="btn btn-sm btn-secondary" CommandName="edit" CommandArgument='<%# Bind("AdminID") %>'>Edit</asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lnkDelete" CssClass="btn btn-sm btn-danger" CommandName="delete" CommandArgument='<%# Bind("AdminID") %>' OnClientClick="return confirm('Delete this admin? Complaints they solved stay solved.');">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>
