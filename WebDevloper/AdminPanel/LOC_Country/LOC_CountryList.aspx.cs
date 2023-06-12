using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_LOC_Country_LOC_CountryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // Establish Connection
        SqlConnection objConn = new SqlConnection();

        objConn.ConnectionString = "data source = HP-PC; initial catalog = VersionSystemWebForm; Integrated Security = True";

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
}