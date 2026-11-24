<%@ Page Title="Complaints - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminComplaint.aspx.cs" Inherits="PtclCustomerService.AdminComplaint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function () {
            $('.datatable').DataTable({
                "order": [],
                "lengthMenu": [[10, 20, 50, -1], [10, 20, 50, "All"]],
                "language": { "search": "Search", "lengthMenu": "Show _MENU_", "info": "_START_ to _END_ of _TOTAL_", "infoEmpty": "", "emptyTable": "Nothing here" }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-head">
        <div>
            <h1><asp:Label runat="server" ID="lblTitle" Text="Complaints"></asp:Label></h1>
            <p>Open a complaint to see the customer's details and resolve it. Resolving emails the customer.</p>
        </div>
    </div>

    <div class="tabs">
        <asp:Button ID="PendingComplaint" runat="server" Text="Waiting" CssClass="tab" OnClick="PendingComplaint_Click"></asp:Button>
        <asp:Button ID="ApprovedComplaint" runat="server" Text="Solved" CssClass="tab" OnClick="ApprovedComplaint_Click"></asp:Button>
        <asp:Button ID="RegeneratedComplaint" runat="server" Text="Raised again" CssClass="tab" OnClick="RegeneratedComplaint_Click"></asp:Button>
    </div>

    <asp:Panel ID="PanelPendingComplaint" runat="server" CssClass="d-none">
        <section class="panel">
            <div class="panel-body">
                <div class="table-wrap">
                    <asp:GridView runat="server" ClientIDMode="Static" ID="GVPendingComplaint" CssClass="datatable table" GridLines="None" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowDeleting="GV_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate><span class="num">#<%# Eval("ComplaintID") %></span></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="FirstName" HeaderText="Customer" />
                            <asp:TemplateField HeaderText="Problem">
                                <ItemTemplate>
                                    <%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %>
                                    <div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTypeName")) %></div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Registered">
                                <ItemTemplate><span class="d-none"><%# Eval("ComplaintCreationDate", "{0:yyyy-MM-dd HH:mm}") %></span><span class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></span></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate><%# PtclCustomerService.Ui.Status(Eval("ComplaintStatus"), Eval("RegeneratedID")) %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField Text="Open" ControlStyle-CssClass="btn btn-sm btn-outline-secondary" ItemStyle-CssClass="text-end"
                                DataNavigateUrlFields="ComplaintID" DataNavigateUrlFormatString="AdminComplaintDetails.aspx?ComplaintID={0}" />
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:Label runat="server" ID="lblTablePendingMsg" CssClass="empty d-block"></asp:Label>
            </div>
        </section>
    </asp:Panel>

    <asp:Panel ID="PanelApprovedComplaint" ClientIDMode="Static" runat="server" CssClass="d-none">
        <section class="panel">
            <div class="panel-body">
                <div class="table-wrap">
                    <asp:GridView runat="server" ClientIDMode="Static" ID="GVApprovedComplaint" CssClass="datatable table" GridLines="None" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowDeleting="GV_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate><span class="num">#<%# Eval("ComplaintID") %></span></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="FirstName" HeaderText="Customer" />
                            <asp:TemplateField HeaderText="Problem">
                                <ItemTemplate>
                                    <%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %>
                                    <div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTypeName")) %></div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Registered">
                                <ItemTemplate><span class="d-none"><%# Eval("ComplaintCreationDate", "{0:yyyy-MM-dd HH:mm}") %></span><span class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></span></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate><%# PtclCustomerService.Ui.Status(Eval("ComplaintStatus"), Eval("RegeneratedID")) %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField Text="Open" ControlStyle-CssClass="btn btn-sm btn-outline-secondary" ItemStyle-CssClass="text-end"
                                DataNavigateUrlFields="ComplaintID" DataNavigateUrlFormatString="AdminComplaintDetails.aspx?ComplaintID={0}" />
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:Label runat="server" ID="lblTableClosedMsg" CssClass="empty d-block"></asp:Label>
            </div>
        </section>
    </asp:Panel>

    <asp:Panel ID="PanelRegeneratedComplaint" runat="server" CssClass="d-none">
        <section class="panel">
            <div class="panel-body">
                <div class="table-wrap">
                    <asp:GridView runat="server" ClientIDMode="Static" ID="GVRegeneratedComplaint" CssClass="datatable table" GridLines="None" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowDeleting="GV_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate><span class="num">#<%# Eval("ComplaintID") %></span></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="FirstName" HeaderText="Customer" />
                            <asp:TemplateField HeaderText="Problem">
                                <ItemTemplate>
                                    <%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %>
                                    <div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTypeName")) %></div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Registered">
                                <ItemTemplate><span class="d-none"><%# Eval("ComplaintCreationDate", "{0:yyyy-MM-dd HH:mm}") %></span><span class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></span></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate><%# PtclCustomerService.Ui.Status(Eval("ComplaintStatus"), Eval("RegeneratedID")) %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField Text="Open" ControlStyle-CssClass="btn btn-sm btn-outline-secondary" ItemStyle-CssClass="text-end"
                                DataNavigateUrlFields="ComplaintID" DataNavigateUrlFormatString="AdminComplaintDetails.aspx?ComplaintID={0}" />
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:Label runat="server" ID="lblTableRegeneratedMsg" CssClass="empty d-block"></asp:Label>
            </div>
        </section>
    </asp:Panel>
</asp:Content>
