<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
       
        .skin-btn {
    display: flex;                  /* Flex to center content */
    justify-content: center;        /* Horizontal center */
    align-items: center;            /* Vertical center */
    height: 120px;                   /* Fixed height for perfect centering */
    width: 100%;              /* Ensure width for longer text */
    padding: 0 20px;                /* Side padding */
    border-radius: 12px;
    text-decoration: none;
    transition: all 0.3s ease;
    font-weight: bold;
    color: #fff;
    box-shadow: 0 4px 6px rgba(0,0,0,0.2);
    background-size: 200% auto;
    text-align: center;
}

        .skin-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }
       
        .btn-yellow {
            background: linear-gradient(135deg, #fff6a3, #ffe359);
            color: #0033CC;
        }

        .btn-purple {
            background: linear-gradient(135deg, #cc33cc, #990099);
            color: #fff;
        }
        .fancy-text {
    font-family: 'Segoe UI', sans-serif;
    letter-spacing: 1px;
    font-size: 2.5rem;
    text-transform: capitalize;
    text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
}
       
        .skin-section {
            background: #fff6f6;
            padding: 40px 20px;
            border-radius: 15px;
            margin-top: 20px;
        }

        .skin-heading {
            text-align: center;
            font-weight: bold;
            font-size: 2rem;
            color: #cc0099;
            margin-bottom: 25px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid my-4">
        <div class="skin-section">
            <h2 class="skin-heading">Skin Care Solutions</h2>
           
          
      <!-- Row with Bootstrap styling -->
<div class="row g-3">
    <% 
        int index = 0; 
        string[] btnClasses = { "skin-btn btn-purple", "skin-btn btn-yellow" }; // Alternate classes
        
        foreach (int pid in dctProblemes.Keys) { 
            string btnClass = btnClasses[index % btnClasses.Length]; 
    %>
        <div class="col-6 col-md-3 text-center">
            <input type="button" 
                   value="<%= dctProblemes[pid] %>" 
                   class="<%= btnClass %>" 
                   onclick="location.href='solution.aspx?problemid=<%= pid %>';" />
        </div>
    <% 
            index++; 
        } 
    %>
</div>     

            <asp:Label ID="lblerr" runat="server"></asp:Label>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>


