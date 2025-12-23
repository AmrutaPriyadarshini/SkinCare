<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Secure.aspx.cs" Inherits="Secure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    body {
        background: linear-gradient(120deg, #fff0f5, #f0fff4);
        font-family: 'Segoe UI', Tahoma, sans-serif;
    }

    .page-title {
        font-size: 2.8rem;
        font-weight: bold;
        color: #cc0066;
        margin-bottom: 20px;
        text-align: center;
        text-shadow: 1px 1px #ffccf2;
    }

    .card {
        border-radius: 15px;
        border: none;
        box-shadow: 0px 6px 16px rgba(0,0,0,0.08);
        background-color: #ffffffcc;
    }

    .card-header {
        background: linear-gradient(45deg, #ffccf2, #ccffeb);
        font-size: 1.2rem;
        font-weight: bold;
        text-align: center;
        color: #333;
        border-radius: 15px 15px 0 0;
    }

    .form-label {
        color: #660033;
        font-weight: 600;
    }

    .form-control {
        border-radius: 10px;
        border: 2px solid #ffd6eb;
        transition: all 0.3s;
    }

    .form-control:focus {
        border-color: #cc66a0;
        box-shadow: 0 0 6px rgba(204, 0, 102, 0.3);
    }

    /* Custom button theme */
    .btn-custom {
        font-size: 1rem;
        font-weight: bold;
        background: linear-gradient(45deg, #ffccf2, #ffe6ff);
        color: #660033;
        border: none;
        border-radius: 30px;
        padding: 8px 18px;
        transition: 0.3s ease-in-out;
    }

    .btn-custom:hover {
        background: linear-gradient(45deg, #ff99cc, #ffccff);
        transform: scale(1.05);
    }

    /* Action buttons with skincare vibes */
    .btn-success {
        background: linear-gradient(45deg, #ccffeb, #99ffcc);
        border: none;
        color: #006644;
        border-radius: 30px;
        padding: 8px 18px;
    }

    .btn-primary {
        background: linear-gradient(45deg, #cce5ff, #e6f0ff);
        border: none;
        color: #003366;
        border-radius: 30px;
        padding: 8px 18px;
    }

    .btn-warning {
        background: linear-gradient(45deg, #fff0b3, #ffe680);
        border: none;
        color: #664d00;
        border-radius: 30px;
        padding: 8px 18px;
    }

    .btn-danger {
        background: linear-gradient(45deg, #ffcccc, #ffe6e6);
        border: none;
        color: #800000;
        border-radius: 30px;
        padding: 8px 18px;
    }

    .alert-danger {
        border-radius: 12px;
        font-size: 1rem;
    }
</style>
</head>
<body>

<div class="container mt-4">

    <!-- Page Title -->
    <h1 class="page-title">✨ Admin Page ✨</h1>

    <!-- Search + Logout -->
    <div class="row mb-3 align-items-center">
        <div class="col-md-8">
            <div class="input-group shadow-sm">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="🔍 Search Problem ..." ></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="SEARCH" CssClass="btn btn-custom" OnClick="btnSearch_Click" />
                &nbsp; &nbsp;
            </div>
        </div>
        <div class="col-md-4 text-end">
            <a href="Default.aspx" class="btn btn-danger btn-lg" style="border-radius: 30px;">🚪 Logout</a>
        </div>
    </div>

    <!-- Problem Info -->
    <div class="card mb-4">
        <div class="card-header">🌿 Problem & Solution Details</div>
        <div class="card-body">
            <div class="row g-3">

                <div class="col-md-4">
                    <label for="txtProblemId" class="form-label">Problem ID</label>
                    <asp:TextBox ID="txtProblemId" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <label for="txtName" class="form-label">Problem Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    &nbsp;
                </div>

                <div class="col-md-6">
                    <label for="txthome" class="form-label">Home Remedies</label>
                    <asp:TextBox ID="txthome" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="6" Enabled="False" ></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="txtProduct" class="form-label">Products</label>
                    <asp:TextBox ID="txtProduct" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="6" Enabled="False"></asp:TextBox>
                </div>

            </div>
        </div>
    </div>

    <!-- Action Buttons -->
    <div class="card mb-4">
        <div class="card-header">✨ Actions ✨</div>
        <div class="card-body text-center">
            <div class="btn-group flex-wrap gap-2">
                <asp:Button ID="btnFirst" runat="server" Text="⏮ First" CssClass="btn btn-custom" OnClick="btnFirst_Click" />
                <asp:Button ID="btnPrev" runat="server" Text="⬅ Prev" CssClass="btn btn-custom" OnClick="btnPrev_Click" />
                <asp:Button ID="btnNew" runat="server" Text="➕ New" CssClass="btn btn-success fw-bold" OnClick="btnNew_Click" />
                <asp:Button ID="btnEdit" runat="server" Text="✏ Edit" CssClass="btn btn-warning fw-bold" OnClick="btnEdit_Click" />
                <asp:Button ID="btnSave" runat="server" Text="💾 Save" CssClass="btn btn-primary fw-bold" OnClick="btnSave_Click" Enabled="False" />
                <asp:Button ID="btnCancel" runat="server" Text="❌Cancel" CssClass="btn btn-primary fw-bold" Enabled="False" OnClick="btnCancel_Click"  />
                <asp:Button ID="btnDel" runat="server" Text="🗑 Delete" CssClass="btn btn-danger fw-bold" OnClick="btnDel_Click" 
                    OnClientClick="return confirm('Are You Sure To Delete?')" />
                <asp:Button ID="btnNext" runat="server" Text="Next ➡" CssClass="btn btn-custom" OnClick="btnNext_Click" />
                <asp:Button ID="btnLast" runat="server" Text="Last ⏭" CssClass="btn btn-custom" OnClick="btnLast_Click" />
            </div>
        </div>
    </div>

    <!-- Error Label -->
    <asp:Label ID="lblErr" runat="server"
    CssClass="alert alert-danger d-block fw-bold text-center fs-4" ViewStateMode="Disabled"></asp:Label>


</div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
   
</asp:Content>


