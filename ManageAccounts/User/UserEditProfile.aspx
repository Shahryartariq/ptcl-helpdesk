<%@ Page Title="Edit profile - PCS" Language="C#" MasterPageFile="~/UserPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="UserEditProfile.aspx.cs" Inherits="PtclCustomerService.UserPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink runat="server" CssClass="back-link" NavigateUrl="~/ManageAccounts/User/UserProfile.aspx"><i class="fas fa-arrow-left me-1"></i> My profile</asp:HyperLink>
    <div class="page-head">
        <div>
            <h1>Edit profile</h1>
            <p>Keep your mobile number and email up to date, so we can reach you about your complaints.</p>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="row g-3 form-wide">
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtMyName.ClientID %>">First name</label>
                    <asp:TextBox runat="server" ID="txtMyName" CssClass="form-control" autocomplete="given-name" />
                    <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="txtMyName" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your first name" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtLastName.ClientID %>">Last name <span class="text-muted fw-normal">(optional)</span></label>
                    <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" autocomplete="family-name"></asp:TextBox>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtPhone.ClientID %>">Mobile number</label>
                    <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" inputmode="tel"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your mobile number" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV1" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Use 11 or 12 digits, e.g. 03001234567" ValidationGroup="UserUpdate" ValidationExpression="^[0-9]{11,12}$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtCnic.ClientID %>">CNIC</label>
                    <asp:TextBox runat="server" ID="txtCnic" CssClass="form-control" inputmode="numeric"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV3" ControlToValidate="txtCnic" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your CNIC" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV2" ControlToValidate="txtCnic" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="A CNIC has 13 digits" ValidationGroup="UserUpdate" ValidationExpression="^[0-9]{13}$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-12 field mb-0">
                    <label for="<%= txtEmail.ClientID %>">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" inputmode="email"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV4" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your email" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV3" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="That doesn't look like an email address" ValidationGroup="UserUpdate" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= ddlLocationCode.ClientID %>">City</label>
                    <asp:DropDownList runat="server" ID="ddlLocationCode" CssClass="form-select"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="RFV7" ControlToValidate="ddlLocationCode" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Choose your city" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtLandLineNumber.ClientID %>">Landline number</label>
                    <asp:TextBox runat="server" ID="txtLandLineNumber" CssClass="form-control num" inputmode="numeric"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV8" ControlToValidate="txtLandLineNumber" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your landline number" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV5" ControlToValidate="txtLandLineNumber" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="A landline number has 7 digits" ValidationGroup="UserUpdate" ValidationExpression="^[0-9]{7}$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-12"><hr class="divider my-2" /><h2 class="panel-title mt-2">Change password</h2><p class="panel-sub mb-0">Leave both empty to keep your current password.</p></div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtPassword.ClientID %>">New password</label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" autocomplete="new-password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV5" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter a password" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtConfirmPassword.ClientID %>">Confirm new password</label>
                    <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control" autocomplete="new-password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV6" ControlToValidate="txtConfirmPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Type the password again" ValidationGroup="UserUpdate"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ID="CMV4" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Display="Dynamic" CssClass="field-error" ErrorMessage="The passwords don't match" ValidationGroup="UserUpdate"></asp:CompareValidator>
                </div>
                <div class="col-12 field mb-0">
                    <label for="<%= FileUpload.ClientID %>">Profile picture</label>
                    <asp:FileUpload ID="FileUpload" runat="server" accept=".png,.jpg,.jpeg" />
                    <span class="field-hint">JPG or PNG, up to 2 MB. Leave empty to keep the current one. <asp:Label ID="lblUpload" runat="server" Visible="false"></asp:Label></span>
                    <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server" ControlToValidate="FileUpload" Display="Dynamic" CssClass="field-error" ErrorMessage="Only JPG and PNG pictures can be uploaded" ValidationExpression="(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$" SetFocusOnError="true" ValidationGroup="UserUpdate"></asp:RegularExpressionValidator>
                </div>
            </div>

            <asp:Label runat="server" ID="lblMsg" CssClass="form-msg mt-3"></asp:Label>
            <div class="form-actions mt-3">
                <asp:Button Text="Save changes" runat="server" ID="cmdUpdate" CssClass="btn btn-primary" OnClick="cmdUpdate_Click" ValidationGroup="UserUpdate" />
                <asp:HyperLink runat="server" CssClass="btn btn-secondary" NavigateUrl="~/ManageAccounts/User/UserProfile.aspx">Cancel</asp:HyperLink>
            </div>
        </div>
    </section>
</asp:Content>
