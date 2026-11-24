<%@ Page Title="Edit customer - PCS" Language="C#" MasterPageFile="~/AdminPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerSetup.aspx.cs" Inherits="PtclCustomerService.UserSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink runat="server" ID="HypGoBack" CssClass="back-link"><i class="fas fa-arrow-left me-1"></i> Back</asp:HyperLink>
    <div class="page-head">
        <div>
            <h1><asp:Label runat="server" ID="lblCustomer" Text="Edit customer"></asp:Label></h1>
            <p>Correct a customer's details, or set their account to inactive to stop them logging in.</p>
        </div>
    </div>

    <section class="panel">
        <div class="panel-body">
            <div class="row g-3 form-wide">
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtFirstName.ClientID %>">First name</label>
                    <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="txtFirstName" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter the first name" ValidationGroup="UserSetup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtLastName.ClientID %>">Last name</label>
                    <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtPhone.ClientID %>">Mobile number</label>
                    <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" inputmode="tel"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter a mobile number" ValidationGroup="UserSetup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV1" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Use 11 or 12 digits, e.g. 03001234567" ValidationGroup="UserSetup" ValidationExpression="^[0-9]{11,12}$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtCnic.ClientID %>">CNIC</label>
                    <asp:TextBox runat="server" ID="txtCnic" CssClass="form-control" inputmode="numeric"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV3" ControlToValidate="txtCnic" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter the CNIC" ValidationGroup="UserSetup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV2" ControlToValidate="txtCnic" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="A CNIC has 13 digits" ValidationGroup="UserSetup" ValidationExpression="^[0-9]{13}$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtEmail.ClientID %>">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" inputmode="email"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV4" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter an email" ValidationGroup="UserSetup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV3" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="That doesn't look like an email address" ValidationGroup="UserSetup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= ddlStatus.ClientID %>">Account</label>
                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-select"><asp:ListItem Text="Active, can log in" Value="1" /><asp:ListItem Text="Inactive, can't log in" Value="0" /></asp:DropDownList>
                </div>
                <div class="col-12"><hr class="divider my-2" /><h2 class="panel-title mt-2">Set a new password</h2><p class="panel-sub mb-0">Only if the customer asks for one. Leave both empty to keep the current password.</p></div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtPassword.ClientID %>">New password</label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" autocomplete="new-password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV5" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter a password" ValidationGroup="UserSetup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="REV4" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Use at least 8 characters, with a letter and a number" ValidationGroup="UserSetup" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-6 field mb-0">
                    <label for="<%= txtConfirmPassword.ClientID %>">Confirm new password</label>
                    <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control" autocomplete="new-password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RFV6" ControlToValidate="txtConfirmPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Type the password again" ValidationGroup="UserSetup"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ID="CMV4" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Display="Dynamic" CssClass="field-error" ErrorMessage="The passwords don't match" ValidationGroup="UserSetup"></asp:CompareValidator>
                </div>
            </div>

            <asp:Label runat="server" ID="lblMsg" CssClass="form-msg mt-3"></asp:Label>
            <div class="form-actions mt-3">
                <asp:Button Text="Save changes" runat="server" ID="cmdSubmit" CssClass="btn btn-primary" OnClick="cmdSubmit_Click" ValidationGroup="UserSetup" />
            </div>
        </div>
    </section>
</asp:Content>
