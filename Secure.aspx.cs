using System;
//using System.Activities.Statements;
//using System.Collections.Generic;
//using System.Data;
using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
using System.Web.Configuration;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Xml.Linq;

public partial class Secure : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["isLogin"] == null) || (Session["isLogin"].ToString() != "yes"))       // Check For Valid Login
        {
            Response.Redirect("Admin.aspx");
        }

        if (!IsPostBack)
        {
            ViewState["ProblemId"] = 0;
            ViewState["IsAdd"] = false;
            ViewState["IsEdit"] = false;
            // Show Last Record
            btnLast_Click(sender, e);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if ((bool)ViewState["IsAdd"] == true)
        {
            if (txtName.Text == "")
            {
                lblErr.Text = "Problem name is missing.";
                return;

            }
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string strSQLNewID = "SELECT TOP 1 ProblemID FROM SkinProblems ORDER BY ProblemID DESC";
                SqlCommand cmdNewID = new SqlCommand(strSQLNewID, con);
                int NewProblemID = 1;
                string strSQL = @"INSERT INTO SkinProblems (ProblemId, ProblemName, Homeremedy, Readymade) 
                         VALUES (@ProblemId, @ProblemName, @Homeremedy, @Readymade)";
                SqlCommand cmd = new SqlCommand(strSQL, con);
                cmd.Parameters.AddWithValue("@ProblemName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Homeremedy", txthome.Text.Trim());
                cmd.Parameters.AddWithValue("@Readymade", txtProduct.Text.Trim());

                try
                {
                    con.Open();
                    NewProblemID = (int)cmdNewID.ExecuteScalar();
                    NewProblemID += 1;

                    cmd.Parameters.AddWithValue("@ProblemId", NewProblemID);

                    int added = cmd.ExecuteNonQuery();
                    lblErr.Text = added + " record saved successfully.";

                    txtProblemId.Text = NewProblemID.ToString();

                    ViewState["IsAdd"] = false;
                    MyEnabled(false);


                }
                catch (Exception ex)
                {
                    lblErr.Text = "Error inserting record: " + ex.Message;
                }
            }
        }

        if ((bool)ViewState["IsEdit"] == true)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE SkinProblems SET ProblemName = @ProblemName, Homeremedy = @Homeremedy, Readymade = @Readymade WHERE ProblemId = @ProblemId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProblemId", txtProblemId.Text.Trim());
                cmd.Parameters.AddWithValue("@ProblemName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Homeremedy", txthome.Text.Trim());
                cmd.Parameters.AddWithValue("@Readymade", txtProduct.Text.Trim());

                try
                {
                    con.Open();
                    int added = cmd.ExecuteNonQuery();
                    lblErr.Text = added + " record updated successfully.";
                    ViewState["IsEdit"] = false;
                    MyEnabled(false);
                    
                }
                catch (Exception ex)
                {
                    lblErr.Text = "Error updateing record: " + ex.Message;
                }
            }
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        string strSQL = "SELECT TOP 1 * FROM SkinProblems WHERE ProblemId > " + ViewState["ProblemId"] + " ORDER BY ProblemId";
        MyShowSQLData(strSQL, "Can't Move End Of Data.");
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        string strSQL = "SELECT TOP 1 * FROM SkinProblems WHERE ProblemId < " + ViewState["ProblemId"] + " ORDER BY ProblemId DESC ";
        MyShowSQLData(strSQL, "Can't Move Begin Of Data.");
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        ViewState["IsEdit"] = true;
        MyEnabled(true);

        this.SetFocus(txtName.ClientID);

    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        txtProblemId.Text = "";
        txtName.Text = "";
        txthome.Text = "";
        txtProduct.Text = "";
        txtSearch.Text = "";

        ViewState["IsAdd"] = true;
        MyEnabled(true);

        this.SetFocus(txtName.ClientID);
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "DELETE FROM SkinProblems WHERE ProblemId = @ProblemId";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ProblemId", txtProblemId.Text.Trim());

            try
            {
                con.Open();
                int deleted = cmd.ExecuteNonQuery();
                lblErr.Text = deleted + " record(s) deleted successfully.";
                btnNext_Click(sender, e);
                if (lblErr.Text == "Can't Move End Of Data.")
                {
                    lblErr.Text = "";
                    btnLast_Click(sender, e);
                }
            }
            catch (Exception ex)
            {
                lblErr.Text = "Error deleting record: " + ex.Message;
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string problemid = txtSearch.Text.Trim();
        txtSearch.Text = "";
        string strSQL = "SELECT * FROM SkinProblems WHERE ProblemId = " + problemid;
        MyShowSQLData(strSQL, "Not Available ID " + problemid);
    }

    protected void btnFirst_Click(object sender, EventArgs e)
    {
        string strSQL = "SELECT TOP 1 * FROM SkinProblems ORDER BY ProblemId ";
        MyShowSQLData(strSQL, "");
    }

    protected void btnLast_Click(object sender, EventArgs e)
    {
        string strSQL = "SELECT TOP 1 * FROM SkinProblems ORDER BY ProblemId DESC ";
        MyShowSQLData(strSQL, "");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

        ViewState["IsEdit"] = false;
        ViewState["IsAddt"] = false;
        MyEnabled(false);

        lblErr.Text = "";

        string strSQL = "SELECT * FROM SkinProblems WHERE ProblemId = " + ViewState["ProblemId"];
        MyShowSQLData(strSQL, "");
    }
    private void MyEnabled(bool plEnabled)
    {
        txtName.Enabled = plEnabled;
        txthome.Enabled = plEnabled;
        txtProduct.Enabled = plEnabled;
        btnSave.Enabled = plEnabled;
        btnCancel.Enabled = plEnabled;

        btnFirst.Enabled = !plEnabled;
        btnLast.Enabled = !plEnabled;
        btnPrev.Enabled = !plEnabled;
        btnNext.Enabled = !plEnabled;
        btnEdit.Enabled = !plEnabled;
        btnDel.Enabled = !plEnabled;
        btnNew.Enabled = !plEnabled;
        txtSearch.Enabled = !plEnabled;
        btnSearch.Enabled = !plEnabled;
    }
    private void MyShowSQLData(string pcSQL, string pcShowErrMsg)
    {
        // sql command to show SkinProblems Data
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(pcSQL, con);
            try {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read()) {
                    txtProblemId.Text = reader["ProblemId"].ToString();
                    txtName.Text = reader["ProblemName"].ToString();
                    txthome.Text = reader["Homeremedy"].ToString();
                    txtProduct.Text = reader["Readymade"].ToString();

                    ViewState["ProblemId"] = int.Parse(txtProblemId.Text);
                } else {
                    lblErr.Text = pcShowErrMsg;
                }
                reader.Close();
            }
            catch (Exception err)
            {
                lblErr.Text = "Error In Data: " + err.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
