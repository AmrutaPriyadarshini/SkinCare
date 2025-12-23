using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Solution : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ProblemID"] != null)
            {
                int problemId = Convert.ToInt32(Request.QueryString["ProblemId"]);
                LoadSolutions(problemId);
            }
        }
    }
    private void LoadSolutions(int problemId)
    {
        string selectSQL = "SELECT Homeremedy, Readymade FROM SkinProblems WHERE ProblemId = @ProblemId";

        // Define the ADO.NET objects
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        cmd.Parameters.AddWithValue("@ProblemId", problemId); // Pass parameter safely

        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();

            if (reader.Read()) // Check if data exists
            {
                lblHomeRemedy.Text = reader["Homeremedy"].ToString().Replace("\n", "<br />");
                lblReadymade.Text = reader["Readymade"].ToString().Replace("\n", "<br />");
                lblError.Text = "";
            }
            else
            {
                lblHomeRemedy.Text = "No homemade remedy found.";
                lblReadymade.Text = "No readymade product found.";
            }

            reader.Close();
        }
        catch (Exception err)
        {
            lblError.Text = "Error getting Solution: " + err.Message;
        }
        finally
        {
            con.Close();
        }
    }

}