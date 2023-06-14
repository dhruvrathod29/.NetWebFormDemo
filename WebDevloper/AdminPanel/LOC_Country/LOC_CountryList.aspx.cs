using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_LOC_Country_LOC_CountryList : System.Web.UI.Page
{

    #region Page_Load

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillGrideView();
        }

    }
    #endregion

    #region FillGridView
    private void FillGrideView()
    {
        // Establish Connection
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebDeveloperConnectionString"].ConnectionString.Trim());

        try
        {
            objConn.Open();

            // Do you data work 

            SqlCommand objCmd = new SqlCommand();

            objCmd.Connection = objConn;

            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_LOC_Country_SelectAll";

            SqlDataReader objSDR = objCmd.ExecuteReader();

            gvLOC_Country.DataSource = objSDR;
            gvLOC_Country.DataBind();

            objConn.Close();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;   
        }
        finally 
        { 
            objConn.Close(); 
        }

    }
    #endregion

    #region gvCountry_RowCommand
    protected void gvCountry_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName=="DeleteRecord")
        {
            if (e.CommandArgument!="")
            {
                DeleteCountry(Convert.ToInt32(e.CommandArgument.ToString().Trim()));

            }
        }

    }
    #endregion

    #region DeleteCountry
    private void DeleteCountry(SqlInt32 CountryID)
    {
        #region ConnectionString
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebDeveloperConnectionString"].ConnectionString.Trim());
        #endregion
        try
        {
            #region Create Sql Command
            objConn.Open();
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "[PR_LOC_Country_DeleteByPK]";
            objCmd.Parameters.AddWithValue("@CountryID", CountryID);
            objCmd.ExecuteNonQuery();
            objConn.Close();

            FillGrideView();
            #endregion
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            objConn.Close();

        }


    }
    #endregion
}