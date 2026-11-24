<%@ Page Title="My profile - PCS" Language="C#" MasterPageFile="~/UserPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="PtclCustomerService.ManageAccounts.User.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-head">
        <div>
            <h1>My profile</h1>
            <p>The details we use to contact you about your complaints.</p>
        </div>
        <div class="page-actions">
            <asp:HyperLink runat="server" CssClass="btn btn-primary" NavigateUrl="~/ManageAccounts/User/UserEditProfile.aspx"><i class="fas fa-pen me-1"></i> Edit profile</asp:HyperLink>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="profile-top">
                <div class="person">
                    <asp:Image runat="server" AlternateText="" CssClass="avatar" ID="userPic" />
                    <div>
                        <h2 class="person-name"><asp:Label runat="server" ID="lblFullName"></asp:Label></h2>
                        <p class="person-sub"><asp:Literal runat="server" ID="litStatus"></asp:Literal></p>
                    </div>
                </div>
                <div class="line-card">
                    <span class="line-card-label">Your landline</span>
                    <span class="landline"><asp:Label runat="server" ID="lblLandline"></asp:Label></span>
                    <span class="line-card-label"><asp:Label runat="server" ID="lblLocation"></asp:Label></span>
                </div>
            </div>
            <hr class="divider" />
            <dl class="facts">
                <dt>Email</dt>
                <dd><asp:Label runat="server" ID="lblEmail"></asp:Label></dd>
                <dt>Mobile</dt>
                <dd class="num"><asp:Label runat="server" ID="lblPhone"></asp:Label></dd>
                <dt>CNIC</dt>
                <dd class="num"><asp:Label runat="server" ID="lblCnic"></asp:Label></dd>
            </dl>
        </div>
    </section>
</asp:Content>
