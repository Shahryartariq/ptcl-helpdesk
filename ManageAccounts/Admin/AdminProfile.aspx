<%@ Page Title="Admin profile - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="PtclCustomerService.AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink runat="server" ID="HypBack" CssClass="back-link" NavigateUrl="~/ManageAccounts/Admin/ManageAdmins.aspx" Visible="false"><i class="fas fa-arrow-left me-1"></i> Admins</asp:HyperLink>

    <div class="page-head">
        <div>
            <h1><asp:Label runat="server" ID="lblHeading" Text="My profile"></asp:Label></h1>
            <p>Support team account.</p>
        </div>
        <div class="page-actions">
            <asp:HyperLink runat="server" ID="HypEdit" CssClass="btn btn-primary"><i class="fas fa-pen me-1"></i> Edit profile</asp:HyperLink>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="person">
                <asp:Image runat="server" AlternateText="" CssClass="avatar" ID="AdminPic" />
                <div>
                    <h2 class="person-name"><asp:Label runat="server" ID="lblFullName"></asp:Label></h2>
                    <p class="person-sub">@<asp:Label runat="server" ID="lblUserName"></asp:Label> &nbsp; <asp:Literal runat="server" ID="litStatus"></asp:Literal></p>
                </div>
            </div>
            <hr class="divider" />
            <dl class="facts">
                <dt>Email</dt>
                <dd><asp:Label runat="server" ID="lblEmail"></asp:Label></dd>
                <dt>Phone</dt>
                <dd class="num"><asp:Label runat="server" ID="lblPhone"></asp:Label></dd>
                <dt>Office</dt>
                <dd><asp:Label runat="server" ID="lblLocation"></asp:Label></dd>
                <dt>Complaints solved</dt>
                <dd class="num"><asp:Label runat="server" ID="lblSolved"></asp:Label></dd>
            </dl>
        </div>
    </section>
</asp:Content>
