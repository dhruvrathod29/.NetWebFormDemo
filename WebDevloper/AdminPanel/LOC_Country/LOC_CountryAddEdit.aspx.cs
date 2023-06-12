using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_LOC_Country_LOC_CountryAddEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

 
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        /* Declare local veriable to insertdata */
        SqlString strCountryName = SqlString.Null;
        SqlString strCountryCode = SqlString.Null;

        SqlDateTime strCreationDate = SqlDateTime.Null;
        SqlDateTime strModificationDate = SqlDateTime.Null;
        


        SqlConnection objConn = new SqlConnection("data source = HP-PC; initial catalog = VersionSystemWebForm; Integrated Security = True");
        objConn.Open();
        /*SqlCommand objCmd = new SqlCommand();
        objCmd.Connection = objConn;*/

        SqlCommand objCmd = objConn.CreateCommand();

        objCmd.CommandType = CommandType.StoredProcedure;
        objCmd.CommandText = "PR_LOC_Country_Insert";


        strCountryName = txtCountryName.Text.Trim();
        strCountryCode = txtCountryCode.Text.Trim();
        objCmd.Parameters.AddWithValue("@CountryName", strCountryName);

        objCmd.Parameters.AddWithValue("@CountryCode", strCountryCode);

        objCmd.Parameters.AddWithValue("@CreationDate", strCreationDate);

        objCmd.Parameters.AddWithValue("@ModificationDate", strModificationDate);
        objCmd.ExecuteNonQuery();

        objConn.Close();

        lblMessage.Text = "Record Insert Successfully";
        txtCountryName.Text = "";
        txtCountryCode.Text = "";
        txtCountryName.Focus();
    }
}