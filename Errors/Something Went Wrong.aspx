<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Something Went Wrong.aspx.cs" Inherits="PtclCustomerService.Erros.Something_Went_Wrong" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Something went wrong - PCS</title>
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/pcs.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <main class="oops">
            <div>
                <div class="oops-code">Oops</div>
                <h1>Something went wrong on our side</h1>
                <p>Nothing you did caused this. Go back and try again in a moment.</p>
                <a class="btn btn-primary" href="../Home.aspx">Go to the home page</a>
            </div>
        </main>
    </form>
</body>
</html>
