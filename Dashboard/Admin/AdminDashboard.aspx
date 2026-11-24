<%@ Page Title="Dashboard - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="PtclCustomerService.Dashboard.Admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-head">
        <div>
            <h1>Dashboard</h1>
            <p>Open complaints come first. Resolving one emails the customer.</p>
        </div>
    </div>

    <div class="stats mb-4">
        <asp:HyperLink runat="server" CssClass="stat" NavigateUrl="~/Complaints/Admin/AdminComplaint.aspx?Active=1">
            <span class="stat-label">Waiting to be fixed</span>
            <asp:Label runat="server" ID="lblOpen" CssClass="stat-value" Text="0"></asp:Label>
        </asp:HyperLink>
        <asp:HyperLink runat="server" CssClass="stat" NavigateUrl="~/Complaints/Admin/AdminComplaint.aspx?Closed=1">
            <span class="stat-label">Solved</span>
            <asp:Label runat="server" ID="lblSolved" CssClass="stat-value" Text="0"></asp:Label>
        </asp:HyperLink>
        <asp:HyperLink runat="server" CssClass="stat" NavigateUrl="~/ManageCustomers/Admin/AdminManageCustomers.aspx">
            <span class="stat-label">Customers</span>
            <asp:Label runat="server" ID="lblTotalCustomers" CssClass="stat-value" Text="0"></asp:Label>
        </asp:HyperLink>
        <asp:HyperLink runat="server" CssClass="stat" NavigateUrl="~/ManageAccounts/Admin/ManageAdmins.aspx">
            <span class="stat-label">Admins</span>
            <asp:Label runat="server" ID="LblTotalAdmins" CssClass="stat-value" Text="0"></asp:Label>
        </asp:HyperLink>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="d-flex flex-wrap justify-content-between align-items-baseline gap-2">
                <div>
                    <h2 class="panel-title">Oldest open complaints</h2>
                    <p class="panel-sub">These customers have waited the longest. <asp:Label runat="server" ID="lblTotalComplaints" Text="0"></asp:Label> complaints in total.</p>
                </div>
                <asp:HyperLink runat="server" NavigateUrl="~/Complaints/Admin/AdminComplaint.aspx?Active=1">See all open complaints</asp:HyperLink>
            </div>

            <asp:Repeater runat="server" ID="RptOpen">
                <HeaderTemplate>
                    <div class="table-wrap">
                        <table class="table">
                            <thead>
                                <tr><th>No.</th><th>Customer</th><th>Problem</th><th>Registered</th><th></th></tr>
                            </thead>
                            <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="num">#<%# Eval("ComplaintID") %></td>
                        <td><%# PtclCustomerService.Ui.Text(Eval("FirstName")) %></td>
                        <td><%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %><div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTypeName")) %></div></td>
                        <td class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></td>
                        <td class="text-end"><a class="btn btn-sm btn-outline-secondary" href="<%# ResolveUrl("~/Complaints/Admin/AdminComplaintDetails.aspx?ComplaintID=" + Eval("ComplaintID")) %>">Open</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                            </tbody>
                        </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <asp:Panel runat="server" ID="PanelAllDone" Visible="false" CssClass="empty">
                No open complaints. Every customer's problem has been solved.
            </asp:Panel>
        </div>
    </section>
</asp:Content>
