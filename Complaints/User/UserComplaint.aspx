<%@ Page Title="Complaints - PCS" Language="C#" MasterPageFile="~/UserPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="UserComplaint.aspx.cs" Inherits="PtclCustomerService.UserComplaint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-head">
        <div>
            <h1><asp:Label runat="server" ID="lblTitle" Text="My complaints"></asp:Label></h1>
            <p><asp:Label runat="server" ID="lblIntro"></asp:Label></p>
        </div>
    </div>

    <div class="tabs" role="tablist">
        <asp:Button ID="PendingComplaint" runat="server" Text="Waiting" CssClass="tab" OnClick="PendingComplaint_Click" CausesValidation="false"></asp:Button>
        <asp:Button ID="ApprovedComplaint" runat="server" Text="Solved" CssClass="tab" OnClick="ApprovedComplaint_Click" CausesValidation="false"></asp:Button>
        <asp:Button ID="RegisterComplaint" runat="server" Text="+ Register a complaint" CssClass="tab tab-action" OnClick="RegisterComplaint_Click" CausesValidation="false"></asp:Button>
    </div>

    <%-- Register --%>
    <asp:Panel ID="PanelRegisterComplaint" runat="server" CssClass="d-none">
        <section class="panel">
            <div class="panel-body">
                <asp:Panel runat="server" ID="RegisterComplaintSection">
                    <div class="form-narrow">
                        <asp:Panel runat="server" ID="RegeneratedArea" CssClass="field d-none">
                            <label for="<%= txtParentID.ClientID %>">Raising again from complaint</label>
                            <asp:TextBox runat="server" ID="txtParentID" CssClass="form-control num" ReadOnly="true"></asp:TextBox>
                            <span class="field-hint">The new complaint is linked to the old one, so the support team can see what was tried before.</span>
                        </asp:Panel>
                        <div class="field">
                            <label for="<%= ddlComplaint.ClientID %>">What is the problem about?</label>
                            <asp:DropDownList runat="server" ID="ddlComplaint" CssClass="form-select">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RFV0" ControlToValidate="ddlComplaint" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Choose what the problem is about" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="field">
                            <label for="<%= txtComplaintTitle.ClientID %>">Title</label>
                            <asp:TextBox runat="server" ID="txtComplaintTitle" CssClass="form-control" MaxLength="200" placeholder="For example: No internet since this morning"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="txtComplaintTitle" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Give the complaint a short title" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="field">
                            <label for="<%= txtComplaintDescription.ClientID %>">What happened?</label>
                            <asp:TextBox runat="server" ID="txtComplaintDescription" CssClass="form-control" TextMode="MultiLine" Rows="5" MaxLength="1000" placeholder="When did it start, and what have you tried? Router lights and error messages help."></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="txtComplaintDescription" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Describe the problem" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="field">
                            <label for="<%= FileUpload.ClientID %>">Photo or document <span class="text-muted fw-normal">(optional)</span></label>
                            <asp:FileUpload ID="FileUpload" runat="server" accept=".png,.jpg,.jpeg,.pdf" />
                            <span class="field-hint">A photo of your router or bill helps. JPG, PNG or PDF, up to 2 MB.</span>
                            <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server" ControlToValidate="FileUpload" Display="Dynamic" CssClass="field-error"
                                ErrorMessage="Only JPG, PNG and PDF files can be uploaded" ValidationExpression="(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG|pdf|PDF)$"
                                SetFocusOnError="true" ValidationGroup="Submit"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblUpload" runat="server" Text=""></asp:Label>
                        </div>

                        <asp:Label runat="server" ID="lblMsg" CssClass="form-msg"></asp:Label>
                        <div class="form-actions">
                            <asp:Button Text="Register complaint" runat="server" ID="cmdSubmit" CssClass="btn btn-primary" OnClick="cmdSubmit_Click" ValidationGroup="Submit" />
                            <asp:Button Text="Cancel" runat="server" ID="cmdCancelMenu" CssClass="btn btn-secondary" OnClick="cmdCancelMenu_Click" CausesValidation="false" />
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="PanelOverLimit" CssClass="d-none">
                    <div class="notice">
                        <strong>You have 10 complaints waiting to be fixed.</strong>
                        You can register a new one as soon as one of them is solved.
                    </div>
                </asp:Panel>
            </div>
        </section>
    </asp:Panel>

    <%-- Waiting --%>
    <asp:Panel ID="PanelPendingComplaint" runat="server" CssClass="d-none">
        <section class="panel">
            <div class="table-wrap">
                <asp:GridView runat="server" ID="GVPendingComplaint" CssClass="table" GridLines="None" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowDeleting="GV_RowDeleting"
                    EmptyDataText="Nothing is waiting. If something is wrong with your line, register a complaint." EmptyDataRowStyle-CssClass="empty">
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate><span class="num">#<%# Eval("ComplaintID") %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Complaint">
                            <ItemTemplate>
                                <a href="UserComplaintDetails.aspx?ComplaintID=<%# Eval("ComplaintID") %>&start=1"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %></a>
                                <div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTypeName")) %></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registered">
                            <ItemTemplate><span class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate><%# PtclCustomerService.Ui.Status(Eval("ComplaintStatus"), Eval("RegeneratedID")) %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemStyle CssClass="text-end" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDelete" CssClass="btn btn-sm btn-danger" CommandName="delete" CommandArgument='<%# Bind("ComplaintID") %>' OnClientClick="return confirm('Delete this complaint? This can\'t be undone.');"><i class="fas fa-trash-alt"></i><span class="visually-hidden">Delete</span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
    </asp:Panel>

    <%-- Solved --%>
    <asp:Panel ID="PanelApprovedComplaint" runat="server" CssClass="d-none">
        <section class="panel">
            <div class="table-wrap">
                <asp:GridView runat="server" ID="GVApprovedComplaint" CssClass="table" GridLines="None" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowDeleting="GV_RowDeleting"
                    EmptyDataText="No solved complaints yet." EmptyDataRowStyle-CssClass="empty">
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate><span class="num">#<%# Eval("ComplaintID") %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Complaint">
                            <ItemTemplate>
                                <a href="UserComplaintDetails.aspx?ComplaintID=<%# Eval("ComplaintID") %>&Last=1"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTitle")) %></a>
                                <div class="text-muted small"><%# PtclCustomerService.Ui.Text(Eval("ComplaintTypeName")) %></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registered">
                            <ItemTemplate><span class="text-muted"><%# PtclCustomerService.Ui.Date(Eval("ComplaintCreationDate")) %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate><%# PtclCustomerService.Ui.Status(Eval("ComplaintStatus"), Eval("RegeneratedID")) %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemStyle CssClass="text-end" />
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDelete" CssClass="btn btn-sm btn-danger" CommandName="delete" CommandArgument='<%# Bind("ComplaintID") %>' OnClientClick="return confirm('Delete this complaint? This can\'t be undone.');"><i class="fas fa-trash-alt"></i><span class="visually-hidden">Delete</span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </section>
    </asp:Panel>
</asp:Content>
