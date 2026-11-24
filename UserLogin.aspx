<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="PtclCustomerService.UserLogin" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Log in - PCS</title>
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
                <div class="auth-form">
                    <h2>Log in</h2>
                    <p>Use the email and password you signed up with.</p>

                    <div class="field">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" autocomplete="email"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your email" ValidationGroup="LoginUser"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" autocomplete="current-password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your password" ValidationGroup="LoginUser"></asp:RequiredFieldValidator>
                    </div>

                    <asp:Label runat="server" ID="lblMsg" CssClass="form-msg"></asp:Label>
                    <asp:Button Text="Log in" runat="server" ID="cmdLoginUser" CssClass="btn btn-primary" OnClick="cmdLoginUser_Click" ValidationGroup="LoginUser" />

                    <div class="auth-switch">
                        <div>New here? <asp:Button Text="Create an account" runat="server" ID="cmdSignup" CssClass="btn-link" OnClick="cmdSignup_Click" CausesValidation="false" /></div>
                        <div class="mt-1">Support staff? <asp:Button Text="Staff login" runat="server" ID="cmdLoginAdmin" CssClass="btn-link" OnClick="cmdLoginAdmin_Click" CausesValidation="false" /></div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>
