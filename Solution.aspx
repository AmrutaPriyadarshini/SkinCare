<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Solution.aspx.cs" Inherits="Solution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Bootstrap Container -->
    <div class="container my-5">

        <!-- Page Header -->
        <div class="text-center mb-5">
            <h1 class="display-4 text-primary fw-bold">Skin Problem Solutions</h1>
            <p class="lead text-secondary">Discover natural remedies and effective products for healthy skin</p>
        </div>

        <!-- Home Remedies Section -->
        <div class="card shadow-lg mb-5 border-0">
            <div class="card-body text-center">
                <h2 class="card-title text-success mb-4">Home Remedies</h2>
                <asp:Label ID="lblHomeRemedy" runat="server" CssClass="card-text fs-5 text-dark"></asp:Label>
            </div>
        </div>

        <!-- Products Section -->
        <div class="card shadow-lg border-0">
            <div class="card-body text-center">
                <h2 class="card-title text-info mb-4">Products You Need</h2>
                <asp:Label ID="lblReadymade" runat="server" CssClass="card-text fs-5 text-dark"></asp:Label>
            </div>
        </div>
        <asp:Label ID="lblError" runat="server"></asp:Label>

    </div>
</asp:Content>

