<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="PtclCustomerService.UserSignup" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Create an account - PCS</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Css/bootstrap.min.css" rel="stylesheet" />
    <link href="Css/pcs.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth">
            <aside class="auth-side">
                <span class="pcs-brand"><span class="pcs-mark"><i class="fas fa-phone-alt"></i></span><span class="pcs-brand-text"><strong>PCS</strong><span>PTCL Customer Service</span></span></span>
                <h1>Get your PTCL line fixed</h1>
                <p>Register a complaint, follow it until it's solved, and check your monthly bill.</p>
                <ol class="auth-steps">
                    <li>Tell us what's wrong with your internet, landline or bill.</li>
                    <li>Our support team works on it and marks it solved.</li>
                    <li>You get an email. If the problem comes back, raise the same complaint again.</li>
                </ol>
            </aside>
            <main class="auth-main">
                <div class="auth-form wide">
                    <h2>Create an account</h2>
                    <p>You need your CNIC and the PTCL landline number the account is for.</p>

                    <div class="row g-3">
                        <div class="col-sm-6 field mb-0">
                            <label for="txtFirstName">First name</label>
                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" autocomplete="given-name"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="txtFirstName" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your first name" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-6 field mb-0">
                            <label for="txtLastName">Last name <span class="text-muted fw-normal">(optional)</span></label>
                            <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" autocomplete="family-name"></asp:TextBox>
                        </div>
                        <div class="col-sm-6 field mb-0">
                            <label for="txtPhone">Mobile number</label>
                            <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" TextMode="Phone" placeholder="03001234567" autocomplete="tel"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your mobile number" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="REV1" ControlToValidate="txtPhone" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Use 11 or 12 digits, e.g. 03001234567" ValidationGroup="UserSignUp" ValidationExpression="^[0-9]{11,12}$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-6 field mb-0">
                            <label for="txtCnic">CNIC</label>
                            <asp:TextBox runat="server" ID="txtCnic" CssClass="form-control" inputmode="numeric" placeholder="13 digits, no dashes"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV3" ControlToValidate="txtCnic" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your CNIC" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="REV2" ControlToValidate="txtCnic" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="A CNIC has 13 digits" ValidationGroup="UserSignUp" ValidationExpression="^[0-9]{13}$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-12 field mb-0">
                            <label for="txtEmail">Email</label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="email" autocomplete="email"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV4" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your email" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="REV3" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="That doesn't look like an email address" ValidationGroup="UserSignUp" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-6 field mb-0">
                            <label for="ddlLocationCode">City</label>
                            <asp:DropDownList runat="server" ID="ddlLocationCode" CssClass="form-select">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="ddlLocationCode" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Choose your city" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-6 field mb-0">
                            <label for="txtLandLineNumber">Landline number</label>
                            <asp:TextBox runat="server" ID="txtLandLineNumber" CssClass="form-control num" inputmode="numeric" placeholder="7 digits, without the city code"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV7" ControlToValidate="txtLandLineNumber" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your landline number" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="txtLandLineNumber" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="A landline number has 7 digits" ValidationGroup="UserSignUp" ValidationExpression="^[0-9]{7}$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-6 field mb-0">
                            <label for="txtPassword">Password</label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" autocomplete="new-password"></asp:TextBox>
                            <span class="field-hint">At least 8 characters, with a letter and a number.</span>
                            <asp:RequiredFieldValidator runat="server" ID="RFV5" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Choose a password" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="REV4" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Use at least 8 characters, with a letter and a number" ValidationGroup="UserSignUp" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-sm-6 field mb-0">
                            <label for="txtConfirmPassword">Confirm password</label>
                            <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control" TextMode="Password" autocomplete="new-password"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RFV6" ControlToValidate="txtConfirmPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Type the password again" ValidationGroup="UserSignUp"></asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server" ID="CMV4" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Display="Dynamic" CssClass="field-error" ErrorMessage="The passwords don't match" ValidationGroup="UserSignUp"></asp:CompareValidator>
                        </div>
                        <div class="col-12 field">
                            <label for="FileUpload">Profile picture <span class="text-muted fw-normal">(optional)</span></label>
                            <asp:FileUpload ID="FileUpload" runat="server" accept=".png,.jpg,.jpeg" />
                            <span class="field-hint">JPG or PNG, up to 2 MB.</span>
                            <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server" ControlToValidate="FileUpload" Display="Dynamic" CssClass="field-error"
                                ErrorMessage="Only JPG and PNG pictures can be uploaded" ValidationExpression="(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$"
                                SetFocusOnError="true" ValidationGroup="UserSignUp"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <asp:Label runat="server" ID="lblMsg" CssClass="form-msg"></asp:Label>
                    <asp:Button Text="Create account" runat="server" ID="cmdRegister" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="UserSignUp" OnClick="cmdRegister_Click" />

                    <div class="auth-switch">
                        <div>Already have an account? <asp:Button Text="Log in" runat="server" ID="cmdLoginUser" CssClass="btn-link" OnClick="cmdLoginUser_Click" CausesValidation="false" /></div>
                        <div class="mt-1">Support staff? <asp:Button Text="Staff login" runat="server" ID="cmdLoginAdmin" CssClass="btn-link" OnClick="cmdLoginAdmin_Click" CausesValidation="false" /></div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>
