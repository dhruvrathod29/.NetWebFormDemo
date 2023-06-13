using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_LOC_State_LOC_StateList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            FillGrideView();
        }


    }



    private void FillGrideView()
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebDeveloperConnectionString"].ConnectionString);
      
        objConn.Open();
        SqlCommand objCmd = objConn.CreateCommand();

        objCmd.CommandType = CommandType.StoredProcedure;
        objCmd.CommandText = "PR_LOC_State_SelectAll";


        SqlDataReader objSDR = objCmd.ExecuteReader();

        if (objSDR.HasRows)
        {
            gvLOC_State.DataSource = objSDR;
            gvLOC_State.DataBind();
        }

        objConn.Close();
    }

}