<%@ Page Title="Complaint - PCS" Language="C#" MasterPageFile="~/UserPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="UserComplaintDetails.aspx.cs" Inherits="PtclCustomerService.UserComplaintDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="HypCancel" runat="server" CssClass="back-link" NavigateUrl="~/Complaints/User/UserComplaint.aspx?Active=1"><i class="fas fa-arrow-left me-1"></i> My complaints</asp:HyperLink>

    <div class="complaint-head">
        <div class="ticket">
            <span class="ticket-label">Complaint</span>
            <span class="ticket-no">#<asp:Label runat="server" ID="lblNo"></asp:Label></span>
        </div>
        <div>
            <h1><asp:Label runat="server" ID="lblTitle"></asp:Label></h1>
            <div class="complaint-meta">
                <asp:Literal runat="server" ID="litStatus"></asp:Literal>
                <span>Registered <asp:Label runat="server" ID="lblDate"></asp:Label></span>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            <section class="panel">
                <div class="panel-body">
                    <h2 class="panel-title">What happened</h2>
                    <p class="prose"><asp:Label runat="server" ID="lblDescription"></asp:Label></p>
                </div>
            </section>
        </div>
        <div class="col-lg-4">
            <section class="panel">
                <div class="panel-body">
                    <dl class="facts facts-stack">
                        <dt>Problem type</dt>
                        <dd><asp:Label runat="server" ID="lblType"></asp:Label></dd>
                        <dt>Attachment</dt>
                        <dd><asp:HyperLink ID="HypDownloadUpload" runat="server" Target="_blank"><i class="fas fa-paperclip me-1"></i> Open attachment</asp:HyperLink></dd>
                        <asp:PlaceHolder runat="server" ID="PhParent" Visible="false">
                            <dt>Raised again from</dt>
                            <dd><asp:HyperLink ID="HypRegeneratedComplaint" runat="server"></asp:HyperLink></dd>
                        </asp:PlaceHolder>
                    </dl>
                </div>
            </section>

            <asp:Panel runat="server" ID="PanelRegenerate" CssClass="panel">
                <div class="panel-body">
                    <h2 class="panel-title">Problem back?</h2>
                    <p class="panel-sub">Raise this complaint again. The new one is linked to this one.</p>
                    <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#raiseAgain">Raise again</button>
                </div>

                <div class="modal fade" id="raiseAgain" tabindex="-1" aria-labelledby="raiseAgainLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="raiseAgainLabel">Raise this complaint again?</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                You'll fill in a new complaint, linked to this one so the support team can see what was tried before.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Not now</button>
                                <asp:Button ID="btnRegenerate" runat="server" Text="Raise again" CssClass="btn btn-primary" OnClick="btnRegenerate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
