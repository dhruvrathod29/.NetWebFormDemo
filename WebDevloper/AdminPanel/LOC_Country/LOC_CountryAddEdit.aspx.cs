using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_LOC_Country_LOC_CountryAddEdit : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Button Save
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region ConnectionString
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebDeveloperConnectionString"].ConnectionString.Trim());
        #endregion

        try
        {
            #region Local Variable 
            /* Declare local veriable to insertdata */
            SqlString strCountryName = SqlString.Null;
            SqlString strCountryCode = SqlString.Null;

            SqlDateTime strCreationDate = SqlDateTime.Null;
            SqlDateTime strModificationDate = SqlDateTime.Null;

            #endregion

            #region Server Side Validation
            //Server side validation
            String strErrorMessage = "";

            if (txtCountryName.Text.Trim() == "")
            {
                strErrorMessage += "- Please Enter Country Name <br/>";
            }
            if (txtCountryCode.Text.Trim() == "")
            {
                strErrorMessage += "- Please Enter Country Code <br/>";
            }

            if (strErrorMessage != "")
            {
                lblMessage.Text = strErrorMessage;
                return;
            }
            #endregion

            #region Insert Record 

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