<%@ Page Title="Report - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminReport.aspx.cs" Inherits="PtclCustomerService.Report.Admin.AdminReport" %>

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
            <h1>Report</h1>
            <p>Solved complaints, and who solved them. Filter by admin, by the customer's city, or both.</p>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="filters">
                <div class="field mb-0">
                    <label for="<%= ddlAdmins.ClientID %>">Solved by</label>
                    <asp:DropDownList runat="server" ID="ddlAdmins" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="field mb-0">
                    <label for="<%= ddlLocation.ClientID %>">Customer's city</label>
                    <asp:DropDownList runat="server" ID="ddlLocation" CssClass="form-select"></asp:DropDownList>
                </div>
                <asp:Button runat="server" ID="btnSearch" Text="Show report" OnClick="btnSearch_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </section>

    <section class="panel">
        <div class="panel-body">
            <div class="table-wrap">
                <asp:GridView runat="server" ID="GVAdmin" ClientIDMode="Static" CssClass="table" GridLines="None" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate><a class="num" href="<%# ResolveUrl("~/Complaints/Admin/AdminComplaintDetails.aspx?ComplaintID=" + Eval("ComplaintID")) %>">#<%# Eval("ComplaintID") %></a></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Complaint">
                            <ItemTemplate><%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %><div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTypeName")) %></div></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FirstName" HeaderText="Customer" />
                        <asp:BoundField DataField="FullName" HeaderText="Solved by" />
                        <asp:TemplateField HeaderText="Registered">
                            <ItemTemplate><span class="d-none"><%# Eval("ComplaintCreationDate", "{0:yyyy-MM-dd HH:mm}") %></span><span class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></span></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label runat="server" ID="lblAdminmsg" CssClass="empty d-block"></asp:Label>
        </div>
    </section>
</asp:Content>
