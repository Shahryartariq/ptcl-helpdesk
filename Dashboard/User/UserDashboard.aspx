<%@ Page Title="Dashboard - PCS" Language="C#" MasterPageFile="~/UserPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="PtclCustomerService.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-head">
        <div>
            <h1><asp:Label runat="server" ID="lblHello" Text="Hello"></asp:Label></h1>
            <p><asp:Label runat="server" ID="lblLine"></asp:Label></p>
        </div>
        <div class="page-actions">
            <asp:HyperLink runat="server" CssClass="btn btn-primary" NavigateUrl="~/Complaints/User/UserComplaint.aspx?register=1">
                <i class="fas fa-plus me-1"></i> Register a complaint
            </asp:HyperLink>
        </div>
    </div>

    <div class="stats mb-4">
        <asp:HyperLink runat="server" CssClass="stat" NavigateUrl="~/Complaints/User/UserComplaint.aspx?Active=1">
            <span class="stat-label">Waiting to be fixed</span>
            <asp:Label runat="server" ID="lblOpen" CssClass="stat-value" Text="0"></asp:Label>
        </asp:HyperLink>
        <asp:HyperLink runat="server" CssClass="stat" NavigateUrl="~/Complaints/User/UserComplaint.aspx?closed=1">
            <span class="stat-label">Solved</span>
            <asp:Label runat="server" ID="lblSolved" CssClass="stat-value" Text="0"></asp:Label>
        </asp:HyperLink>
        <div class="stat">
            <span class="stat-label">All complaints</span>
            <asp:Label runat="server" ID="lblActiveComplaints" CssClass="stat-value" Text="0"></asp:Label>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <h2 class="panel-title">Latest complaints</h2>
            <p class="panel-sub">Your five most recent complaints. You get an email when one is solved.</p>

            <asp:Repeater runat="server" ID="RptRecent">
                <HeaderTemplate>
                    <div class="table-wrap">
                        <table class="table">
                            <thead>
                                <tr><th>No.</th><th>Title</th><th>Registered</th><th>Status</th></tr>
                            </thead>
                            <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="num">#<%# Eval("ComplaintID") %></td>
                        <td><a href="<%# ResolveUrl("~/Complaints/User/UserComplaintDetails.aspx?ComplaintID=" + Eval("ComplaintID")) %>"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %></a></td>
                        <td class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></td>
                        <td><%# PtclCustomerService.Ui.Status(Eval("ComplaintStatus"), Eval("RegeneratedID")) %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                            </tbody>
                        </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <asp:Panel runat="server" ID="PanelNoComplaints" Visible="false" CssClass="empty">
                You haven't registered any complaints. If something is wrong with your line, register a complaint and we'll look into it.
            </asp:Panel>
        </div>
    </section>
</asp:Content>
