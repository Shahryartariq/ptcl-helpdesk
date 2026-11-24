<%@ Page Title="Complaint - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminComplaintDetails.aspx.cs" Inherits="PtclCustomerService.AdminComplaintDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink runat="server" ID="hypCacnel" CssClass="back-link"><i class="fas fa-arrow-left me-1"></i> Complaints</asp:HyperLink>

    <div class="complaint-head">
        <div class="ticket">
            <span class="ticket-label">Complaint</span>
            <span class="ticket-no">#<asp:Label runat="server" ID="lblNo"></asp:Label></span>
        </div>
        <div>
            <h1><asp:Label runat="server" ID="lblTitle"></asp:Label></h1>
            <div class="complaint-meta">
                <asp:Literal runat="server" ID="litStatus"></asp:Literal>
                <span><asp:Label runat="server" ID="lblType"></asp:Label></span>
                <span>Registered <asp:Label runat="server" ID="lblDate"></asp:Label></span>
            </div>
        </div>
    </div>

    <asp:Label runat="server" ID="lblEmailMessage" CssClass="form-msg"></asp:Label>

    <div class="row g-4">
        <div class="col-lg-8">
            <section class="panel">
                <div class="panel-body">
                    <h2 class="panel-title">What happened</h2>
                    <p class="prose"><asp:Label runat="server" ID="lblDescription"></asp:Label></p>
                    <hr class="divider" />
                    <dl class="facts">
                        <dt>Attachment</dt>
                        <dd><asp:HyperLink ID="HypDownloadUpload" runat="server" Target="_blank"><i class="fas fa-paperclip me-1"></i> Open attachment</asp:HyperLink></dd>
                        <dt>Raised again</dt>
                        <dd>
                            <asp:Label runat="server" ID="lblRegenerated" Text="No"></asp:Label>
                            <asp:HyperLink ID="HypParentComplaint" runat="server" Visible="false"></asp:HyperLink>
                        </dd>
                    </dl>
                </div>
            </section>
        </div>

        <div class="col-lg-4">
            <section class="panel">
                <div class="panel-body">
                    <div class="person mb-3">
                        <asp:Image runat="server" AlternateText="" CssClass="avatar avatar-sm" ID="CustomerPic" ImageUrl="~/assets/img/avatar.png" />
                        <div>
                            <p class="person-name h6 mb-0"><asp:Label runat="server" ID="lblFullName"></asp:Label></p>
                            <p class="person-sub">Customer</p>
                        </div>
                    </div>
                    <dl class="facts facts-stack">
                        <dt>Email</dt>
                        <dd><asp:Label runat="server" ID="lblEmail"></asp:Label></dd>
                        <dt>Mobile</dt>
                        <dd class="num"><asp:Label runat="server" ID="lblPhone"></asp:Label></dd>
                    </dl>
                    <div class="d-flex flex-wrap gap-2 mt-3">
                        <asp:HyperLink runat="server" ID="HypCustomerProfile" CssClass="btn btn-sm btn-secondary">Customer profile</asp:HyperLink>
                        <asp:HyperLink runat="server" ID="HypEmailIcon" CssClass="btn btn-sm btn-secondary"><i class="fas fa-envelope me-1"></i> Email</asp:HyperLink>
                    </div>
                </div>
            </section>

            <asp:Panel runat="server" ID="PanelResolveComplaint" CssClass="panel">
                <div class="panel-body">
                    <h2 class="panel-title">Fixed?</h2>
                    <p class="panel-sub">Marking it solved emails the customer.</p>
                    <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#resolve">Mark as solved</button>
                </div>

                <div class="modal fade" id="resolve" tabindex="-1" aria-labelledby="resolveLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="resolveLabel">Mark this complaint as solved?</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                The customer gets an email saying the problem is fixed. They can raise it again if it comes back.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Not yet</button>
                                <asp:Button ID="btnResolve" runat="server" Text="Mark as solved" CssClass="btn btn-primary" OnClick="btnResolve_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
