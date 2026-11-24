<%@ Page Title="Customer - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminCustomersProfile.aspx.cs" Inherits="PtclCustomerService.ManageAccounts.Admin.AdminCustomersProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink runat="server" ID="HypBack" CssClass="back-link"><i class="fas fa-arrow-left me-1"></i> Back</asp:HyperLink>

    <div class="page-head">
        <div>
            <h1><asp:Label runat="server" ID="lblFullName"></asp:Label></h1>
            <p><asp:Literal runat="server" ID="litStatus"></asp:Literal></p>
        </div>
        <div class="page-actions">
            <asp:HyperLink runat="server" ID="HypEditProfile" CssClass="btn btn-primary"><i class="fas fa-pen me-1"></i> Edit customer</asp:HyperLink>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-lg-5">
            <section class="panel">
                <div class="panel-body">
                    <div class="person mb-3">
                        <asp:Image runat="server" AlternateText="" CssClass="avatar" ID="userPic" />
                        <div class="line-card line-card-plain">
                            <span class="line-card-label">Landline</span>
                            <span class="landline"><asp:Label runat="server" ID="lblLandline"></asp:Label></span>
                            <span class="line-card-label"><asp:Label runat="server" ID="lblLocation"></asp:Label></span>
                        </div>
                    </div>
                    <dl class="facts facts-stack">
                        <dt>Email</dt>
                        <dd><asp:Label runat="server" ID="lblEmail"></asp:Label></dd>
                        <dt>Mobile</dt>
                        <dd class="num"><asp:Label runat="server" ID="lblPhone"></asp:Label></dd>
                        <dt>CNIC</dt>
                        <dd class="num"><asp:Label runat="server" ID="lblCnic"></asp:Label></dd>
                    </dl>
                </div>
            </section>
        </div>
        <div class="col-lg-7">
            <section class="panel">
                <div class="panel-body">
                    <h2 class="panel-title">Complaints</h2>
                    <p class="panel-sub"><asp:Label runat="server" ID="lblActiveC" Text="0"></asp:Label> waiting, <asp:Label runat="server" ID="lblTotalC" Text="0"></asp:Label> in total.</p>
                    <asp:Repeater runat="server" ID="RptComplaints">
                        <HeaderTemplate>
                            <div class="table-wrap">
                                <table class="table">
                                    <thead><tr><th>No.</th><th>Title</th><th>Status</th></tr></thead>
                                    <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="num">#<%# Eval("ComplaintID") %></td>
                                <td><a href="<%# ResolveUrl("~/Complaints/Admin/AdminComplaintDetails.aspx?ComplaintID=" + Eval("ComplaintID")) %>"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %></a>
                                    <div class="text-muted small"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></div></td>
                                <td><%# PtclCustomerService.Ui.Status(Eval("ComplaintStatus"), Eval("RegeneratedID")) %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                    </tbody>
                                </table>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
