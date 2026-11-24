<%@ Page Title="Bills - PCS" Language="C#" MasterPageFile="~/UserPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="UserBill.aspx.cs" Inherits="PtclCustomerService.Billing.User.UserBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Js/html2canvas.min.js"></script>
    <script src="../../Js/pdfmake.min.js"></script>
    <script type="text/javascript">
        // saves the bill as a PDF (a picture of the bill inside a PDF page)
        function Export() {
            html2canvas(document.getElementById('target'), {
                onrendered: function (canvas) {
                    var docDefinition = { content: [{ image: canvas.toDataURL(), width: 500 }] };
                    var month = document.getElementById('billMonth').textContent.trim() || 'bill';
                    pdfMake.createPdf(docDefinition).download('PCS-bill-' + month + '.pdf');
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-head no-print">
        <div>
            <h1>Bills</h1>
            <p>Your monthly bill. Print it or save it as a PDF.</p>
        </div>
    </div>

    <div class="bill-bar no-print">
        <div class="field mb-0">
            <label for="<%= ddMonthList.ClientID %>">Month</label>
            <asp:DropDownList ID="ddMonthList" runat="server" CssClass="form-select" OnSelectedIndexChanged="listChange" AutoPostBack="true">
                <asp:ListItem Value="0">Choose a month</asp:ListItem>
                <asp:ListItem Value="1">January</asp:ListItem>
                <asp:ListItem Value="2">February</asp:ListItem>
                <asp:ListItem Value="3">March</asp:ListItem>
                <asp:ListItem Value="4">April</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">June</asp:ListItem>
                <asp:ListItem Value="7">July</asp:ListItem>
                <asp:ListItem Value="8">August</asp:ListItem>
                <asp:ListItem Value="9">September</asp:ListItem>
                <asp:ListItem Value="10">October</asp:ListItem>
                <asp:ListItem Value="11">November</asp:ListItem>
                <asp:ListItem Value="12">December</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Panel runat="server" ID="PanelActions" CssClass="page-actions" Visible="false">
            <button type="button" onclick="window.print()" class="btn btn-secondary"><i class="fas fa-print me-1"></i> Print</button>
            <button type="button" onclick="Export()" class="btn btn-primary"><i class="fas fa-file-download me-1"></i> Save as PDF</button>
        </asp:Panel>
    </div>

    <asp:Label runat="server" ID="lblNoBill" CssClass="form-msg"></asp:Label>
    <asp:Label runat="server" ID="lblNoMonth" CssClass="form-msg"></asp:Label>

    <asp:Panel runat="server" ID="panelBill" Visible="false">
        <article class="bill" id="target">
            <header class="bill-head">
                <div class="pcs-brand bill-brand">
                    <span class="pcs-mark"><i class="fas fa-phone-alt"></i></span>
                    <span class="pcs-brand-text"><strong>PCS</strong><span>Monthly bill</span></span>
                </div>
                <div class="bill-month">
                    <span class="line-card-label">Billing month</span>
                    <strong id="billMonth"><asp:Label runat="server" ID="lblMonth"></asp:Label></strong>
                </div>
            </header>

            <div class="bill-parties">
                <div>
                    <span class="line-card-label">Billed to</span>
                    <p class="bill-name"><asp:Label runat="server" ID="lblBillName"></asp:Label></p>
                    <span class="landline"><asp:Label runat="server" ID="tblLandline"></asp:Label></span>
                    <div class="text-muted"><asp:Label runat="server" ID="lblLocation"></asp:Label></div>
                </div>
                <dl class="facts facts-stack bill-meta">
                    <dt>Consumer ID</dt>
                    <dd class="num"><asp:Label runat="server" ID="lbluserID"></asp:Label></dd>
                    <dt>Pay by</dt>
                    <dd><asp:Label runat="server" ID="lblDueDate"></asp:Label></dd>
                </dl>
            </div>

            <table class="table bill-table">
                <thead>
                    <tr><th>Service</th><th>Plan</th><th class="text-end">Amount (Rs)</th></tr>
                </thead>
                <tbody>
                    <tr><td>Broadband</td><td>8 Mbps</td><td class="text-end num">2,080</td></tr>
                    <tr><td>Line rent</td><td>2.5%</td><td class="text-end num">280</td></tr>
                </tbody>
                <tfoot>
                    <tr><td colspan="2">Total</td><td class="text-end num">2,360</td></tr>
                </tfoot>
            </table>

            <p class="bill-note">Sample bill from a university project. It is not a real PTCL bill.</p>
        </article>
    </asp:Panel>
</asp:Content>
