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
        if (!IsPostBack)
        {
            #region RequestQueryString

            if (Request.QueryString["CountryID"] != null)
            {
                FillControls(Convert.ToInt32(Request.QueryString["CountryID"]));
            }
            else
            {

            }

            #endregion

        }
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

            #region Connection Open

            if (objConn.State != ConnectionState.Open)
            {
                objConn.Open();
            }
            #endregion

            #region Command Object
            SqlCommand objCmd = objConn.CreateCommand();

            objCmd.CommandType = CommandType.StoredProcedure;

            strCountryName = txtCountryName.Text.Trim();
            strCountryCode = txtCountryCode.Text.Trim();
            objCmd.Parameters.AddWithValue("@CountryName", strCountryName);

            objCmd.Parameters.AddWithValue("@CountryCode", strCountryCode);

            objCmd.Parameters.AddWithValue("@CreationDate", strCreationDate);

            objCmd.Parameters.AddWithValue("@ModificationDate", strModificationDate);
            #endregion

            #region Update Record
            if (Request.QueryString["CountryID"]!=null)
            {
                objCmd.Parameters.AddWithValue("@CountryID", Request.QueryString["CountryID"].ToString().Trim());
                objCmd.CommandText = "PR_LOC_Country_UpdateByPK";
                objCmd.ExecuteNonQuery();
                Response.Redirect("~/AdminPanel/LOC_Country/LOC_CountryList.aspx", true);

            }

            #endregion

            #region Insert Record
            else
            {

                objCmd.CommandText = "PR_LOC_Country_Insert";
                objCmd.ExecuteNonQuery();
                lblMessage.Text = "Record Insert Successfully";
                txtCountryName.Text = "";
                txtCountryCode.Text = "";
                txtCountryName.Focus();
            }

            #endregion

            objConn.Close();

        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;   
        }
        finally 
        {
            if (objConn.State == ConnectionState.Open) 
            {
                objConn.Close();
            
            }
        } 


    }

    #endregion

    #region FillControls
    private void FillControls(SqlInt32 CountryID)
    {
        #region ConnectionString
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebDeveloperConnectionString"].ConnectionString.Trim());
        #endregion

        try
        {
            #region Connection Open

            if (objConn.State != ConnectionState.Open)
            {
                objConn.Open();
            }
            #endregion

            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_LOC_Country_SelectByPK";
            objCmd.Parameters.AddWithValue("@CountryID", CountryID.ToString().Trim());

            SqlDataReader objSDR =objCmd.ExecuteReader();
            if (objSDR.HasRows)
            {
                while(objSDR.Read()){
                    if (!objSDR["CountryName"].Equals(DBNull.Value))
                    {
                        txtCountryName.Text = objSDR["CountryName"].ToString().Trim();

                    }
                    if (!objSDR["CountryCode"].Equals(DBNull.Value))
                    {
                        txtCountryCode.Text = objSDR["CountryCode"].ToString().Trim();

                    }
                    break;
                }
            }
            else
            {
                lblMessage.Text = "No Data Available for the Country";
            }


        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally 
        {
            if (objConn.State == ConnectionState.Open) 
            {
                objConn.Close();
            }
        }


    }
    #endregion


}