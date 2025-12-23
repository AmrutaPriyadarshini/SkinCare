<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center" 
     style="min-height: 85vh; background: linear-gradient(135deg, #fff0f5, #f0fff4);">

    <div class="card shadow-lg p-4" 
         style="width: 400px; border-radius: 20px; border: none; background: #ffffffee;">
        
        <!-- Title -->
        <h1 class="text-center mb-4" 
            style="color: #cc0066; font-weight: bold; text-shadow: 1px 1px #ffccf2;">
            Admin Login
        </h1>

        <!-- ID -->
        <div class="mb-3">
            <label for="txtId" class="form-label" style="color:#660033; font-weight:600;">
                👤 ID
            </label>
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control" 
                         placeholder="Enter your ID"></asp:TextBox>
        </div>

        <!-- Password -->
        <div class="mb-3">
            <label for="txtPwd" class="form-label" style="color:#660033; font-weight:600;">
                🔒 Password
            </label>
            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="form-control" 
                         placeholder="Enter your password"></asp:TextBox>
        </div>

        <!-- Login Button -->
        <div class="d-grid mb-3">
            <asp:Button ID="btnLogin" runat="server" Text="🌸 Login" 
                        CssClass="btn" 
                        Style="background: linear-gradient(45deg,#ffccf2,#ccffeb);
                               border:none; font-weight:bold; color:#660033; 
                               border-radius:30px; padding:10px 0; 
                               transition:0.3s;" 
                        OnClick="btnLogin_Click" />
        </div>

        <!-- Error Label -->
        <asp:Label ID="lblerror" runat="server" Text=""
                   CssClass="d-block text-center fw-bold mt-2"
                   Style="color:#cc0066;"></asp:Label>
    </div>
</div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
