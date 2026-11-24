<%@ Page Title="Admin - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminSetup.aspx.cs" Inherits="PtclCustomerService.AdminSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="HypCancel" runat="server" CssClass="back-link" NavigateUrl="~/ManageAccounts/Admin/ManageAdmins.aspx"><i class="fas fa-arrow-left me-1"></i> Back</asp:HyperLink>
    <div class="page-head">
        <div>
            <h1><asp:Label runat="server" ID="lblHeading" Text="Add an admin"></asp:Label></h1>
            <p>Admins can see every complaint and customer, and resolve complaints.</p>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="row g-3 form-wide">
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtFullName.ClientID %>">Full name</label>
                    <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="txtFullName" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter the full name" ValidationGroup="AdminSetup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtUserName.ClientID %>">Username</label>
                    <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" autocomplete="off"></asp:TextBox>
                    <span class="field-hint">Used to log in.</span>
                    <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="txtUserName" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Choose a username" ValidationGroup="AdminSetup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtEmailAddress.ClientID %>">Email</label>
                    <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="form-control" inputmode="email"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV3" ControlToValidate="txtEmailAddress" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter an email" ValidationGroup="AdminSetup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtPhone.ClientID %>">Phone</label>
                    <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" inputmode="tel"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFVPhone" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter a phone number" ValidationGroup="AdminSetup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REVP" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Use 11 or 12 digits, e.g. 03001234567" ValidationGroup="AdminSetup" ValidationExpression="^[0-9]{11,12}$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtLocation.ClientID %>">Office</label>
                    <asp:TextBox runat="server" ID="txtLocation" CssClass="form-control" placeholder="City or office name"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV4" ControlToValidate="txtLocation" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter the office" ValidationGroup="AdminSetup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= ddlStatus.ClientID %>">Account</label>
                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-select"><asp:ListItem Text="Active, can log in" Value="true" /><asp:ListItem Text="Inactive, can't log in" Value="false" /></asp:DropDownList>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtPassword.ClientID %>">Password</label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" autocomplete="new-password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV5" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Choose a password" ValidationGroup="AdminSetup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtConfirmPassword.ClientID %>">Confirm password</label>
                    <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control" autocomplete="new-password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV6" ControlToValidate="txtConfirmPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Type the password again" ValidationGroup="AdminSetup"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ID="CMV4" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Display="Dynamic" CssClass="field-error" ErrorMessage="The passwords don't match" ValidationGroup="AdminSetup"></asp:CompareValidator>
                </div>
                <div class="col-12 field mb-0">
                    <label for="<%= FileUpload.ClientID %>">Profile picture <span class="text-muted fw-normal">(optional)</span></label>
                    <asp:FileUpload ID="FileUpload" runat="server" accept=".png,.jpg,.jpeg" />
                    <span class="field-hint">JPG or PNG, up to 2 MB. <asp:Label ID="lblUpload" runat="server" Visible="false"></asp:Label></span>
                </div>
            </div>

            <asp:Label runat="server" ID="lblMsg" CssClass="form-msg mt-3"></asp:Label>
            <div class="form-actions mt-3">
                <asp:Button Text="Save" runat="server" ID="cmdCreate" CssClass="btn btn-primary" OnClick="cmdCreate_Click" ValidationGroup="AdminSetup" />
            </div>
        </div>
    </section>
</asp:Content>
