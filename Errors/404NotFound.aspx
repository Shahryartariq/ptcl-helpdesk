<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404NotFound.aspx.cs" Inherits="PtclCustomerService.Erros._404NotFound" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Page not found - PCS</title>
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/pcs.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <main class="oops">
            <div>
                <div class="oops-code">404</div>
                <h1>We can't find that page</h1>
                <p>The link may be old, or the complaint or account it pointed to has been deleted.</p>
                <a class="btn btn-primary" href="../Home.aspx">Go to the home page</a>
            </div>
        </main>
    </form>
</body>
</html>
