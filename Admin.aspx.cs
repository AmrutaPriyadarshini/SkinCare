using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    //const string C_ADMIN_ID = "Amruta";
    //const string C_PASSWORD = "Amruta@678";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtId.Text == "Amruta" & txtPwd.Text == "Amruta@678"){
            Session["isLogin"] = "yes";
            Response.Redirect("Secure.aspx");
        }
        else
        {
            lblerror.Text = "Invalid ID , Password .";
        }
    }
}