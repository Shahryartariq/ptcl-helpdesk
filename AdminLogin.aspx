<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="PtclCustomerService.AdminLogin" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Staff login - PCS</title>
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
                <h1>Support team</h1>
                <p>Sign in to see open complaints, resolve them and keep customer accounts up to date.</p>
            </aside>
            <main class="auth-main">
                <div class="auth-form">
                    <h2>Staff login</h2>
                    <p>For the PCS support team.</p>

                    <div class="field">
                        <label for="txtUserName">Username</label>
                        <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" autocomplete="username"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="txtUserName" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your username" ValidationGroup="LoginUser"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" autocomplete="current-password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" CssClass="field-error" ErrorMessage="Enter your password" ValidationGroup="LoginUser"></asp:RequiredFieldValidator>
                    </div>

                    <asp:Label runat="server" ID="lblMsg" CssClass="form-msg"></asp:Label>
                    <asp:Button Text="Log in" runat="server" ID="cmdLoginAdmin" CssClass="btn btn-primary" OnClick="cmdLoginAdmin_Click" ValidationGroup="LoginUser" />

                    <div class="auth-switch">
                        <div>A customer? <asp:Button Text="Customer login" runat="server" ID="cmdLoginUser" CssClass="btn-link" OnClick="cmdLoginUser_Click" CausesValidation="false" /></div>
                        <div class="mt-1">No account yet? <asp:Button Text="Create one" runat="server" ID="cmdSignup" CssClass="btn-link" OnClick="cmdSignup_Click" CausesValidation="false" /></div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>
