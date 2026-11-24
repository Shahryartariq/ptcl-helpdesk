<%@ Page Title="PCS - PTCL Customer Service" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PtclCustomerService.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="hero">
            <div class="site-wrap hero-inner">
                <div>
                    <h1>Say hello to the future</h1>
                    <p>Internet, landline and Smart TV for your home and business. If something stops working, tell us here and follow it until it's fixed.</p>
                    <div class="hero-actions">
                        <asp:HyperLink runat="server" CssClass="btn btn-light" NavigateUrl="~/Complaints/User/UserComplaint.aspx?register=1">Register a complaint</asp:HyperLink>
                        <a class="hero-link" href="#plans">See packages</a>
                    </div>
                </div>
                <dl class="hero-facts">
                    <div><dt>Open a complaint</dt><dd>any time, from any device</dd></div>
                    <div><dt>Get an email</dt><dd>the moment it's solved</dd></div>
                    <div><dt>Raise it again</dt><dd>if the problem comes back</dd></div>
                </dl>
            </div>
        </section>

        <section class="site-wrap plans-section" id="plans">
            <h2>Packages</h2>
            <p class="plans-lead">Monthly prices. To change your package, register a complaint with the type "Other".</p>

            <div class="plans">
                <article class="plan">
                    <h3>Basic</h3>
                    <p class="plan-for">For personal use</p>
                    <p class="plan-price"><span class="num">1,200</span> Rs<small>/month</small></p>
                    <ul>
                        <li>2 Mbps internet</li>
                        <li>40 GB data</li>
                        <li>200 free minutes</li>
                        <li>Basic support</li>
                    </ul>
                </article>
                <article class="plan plan-pick">
                    <p class="plan-badge">Recommended</p>
                    <h3>Standard</h3>
                    <p class="plan-for">For small businesses</p>
                    <p class="plan-price"><span class="num">2,500</span> Rs<small>/month</small></p>
                    <ul>
                        <li>8 Mbps internet</li>
                        <li>Unlimited data</li>
                        <li>1,000 free minutes</li>
                        <li>Priority support</li>
                        <li>Smart TV</li>
                    </ul>
                </article>
                <article class="plan">
                    <h3>Premium</h3>
                    <p class="plan-for">For large businesses</p>
                    <p class="plan-price"><span class="num">4,000</span> Rs<small>/month</small></p>
                    <ul>
                        <li>20 Mbps internet</li>
                        <li>Unlimited data</li>
                        <li>Unlimited free minutes</li>
                        <li>Premium support</li>
                        <li>Fiber Smart TV</li>
                    </ul>
                </article>
            </div>
        </section>
    </main>
</asp:Content>
