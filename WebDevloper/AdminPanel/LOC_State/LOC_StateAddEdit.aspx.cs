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

public partial class AdminPanel_LOC_State_LOC_StateAddEdit : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            fillDropDownList();

            #region RequestQueryString

            if (Request.QueryString["StateID"] != null)
            {
                FillControls(Convert.ToInt32(Request.QueryString["StateID"]));
            }
            else
            {
                
            }
            #endregion
        }

    }
    #endregion

    #region Save Button
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region ConnectionString
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebDeveloperConnectionString"].ConnectionString.Trim());
        #endregion


        //Local Variable 
        #region Local Variable
        SqlInt32 strCountryID = SqlInt32.Null;
        SqlString strStateName = SqlString.Null;
        SqlString strStateCode = SqlString.Null;

        SqlDateTime strCreationDate = SqlDateTime.Null;
        SqlDateTime strModificationDate = SqlDateTime.Null;

        #endregion


        try
        {
            // Server side validation
            #region Server Side Validation

            String strErrorMessage = "";

            if (ddlCountryID.SelectedIndex == 0)
            {
                strErrorMessage += "- Select Country <br/>";

            }
            if (txtStateName.Text.Trim() == "")
            {
                strErrorMessage += "- Please Enter the StateName";

            }
            if (txtStateCode.Text.Trim() == "")
            {
                strErrorMessage += "- Plase Enter the StateCode";
            }

            if (strErrorMessage != "")
            {
                lblMessage.Text = strErrorMessage;
                return;
            }
            #endregion

            //Gether information
            #region Gether Information 

            if (ddlCountryID.SelectedIndex > 0)
            {
                strCountryID = Convert.ToInt32(ddlCountryID.SelectedValue);
            }
            if (txtStateName.Text.Trim() != "")
            {
                strStateName = txtStateName.Text.Trim();
            }
            if (txtStateCode.Text.Trim() != "")
            {
                strStateCode = txtStateCode.Text.Trim();

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

            objCmd.Parameters.AddWithValue("@CountryID", strCountryID);
            objCmd.Parameters.AddWithValue("@StateName", strStateName);
            objCmd.Parameters.AddWithValue("@StateCode", strStateCode);
            objCmd.Parameters.AddWithValue("@CreationDate", strCreationDate);
            objCmd.Parameters.AddWithValue("@ModificationDate", strModificationDate);

            #endregion

            if (Request.QueryString["StateID"] != null)
            {
                #region UpdateByPK
                objCmd.Parameters.AddWithValue("@StateID", Request.QueryString["StateID"].ToString().Trim());
                objCmd.CommandText = "PR_LOC_State_UpdateByPK";
                objCmd.ExecuteNonQuery();
                Response.Redirect("~/AdminPanel/LOC_State/LOC_StateList.aspx",true);
                #endregion
            }
            else
            {
                #region Insert
                objCmd.CommandText = "PR_LOC_State_Insert";
                objCmd.ExecuteNonQuery();


                ddlCountryID.SelectedIndex = 0;
                txtStateName.Text = "";
                txtStateCode.Text = "";
                ddlCountryID.Focus();
                lblMessage.Text = "Record inserted successfully";
                #endregion

            }

            #region Conncetion Close
            if (objConn.State == ConnectionState.Open)
            {
                objConn.Close();
                
            }
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

    #region FillDropDownList
    private void fillDropDownList()
    {
        #region Connection String
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

            #region Country DropDown

            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.Text;
            objCmd.CommandText = "PR_LOC_Country_SelectForDropDown";
            SqlDataReader objSDR = objCmd.ExecuteReader();

            if (objSDR.HasRows == true)
            {
                ddlCountryID.DataSource = objSDR;
                ddlCountryID.DataValueField = "CountryID";
                ddlCountryID.DataTextField = "CountryName";
                ddlCountryID.DataBind();
            }

            ddlCountryID.Items.Insert(0, new ListItem("---Select Country---", "-1"));
            #endregion

            #region Conncetion Close
            if (objConn.State == ConnectionState.Open)
            {
                objConn.Close();

            }
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

    #region FillControls
    private void FillControls(SqlInt32 StateID)
    {
        #region Connection String
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebDeveloperConnectionString"].ConnectionString.Trim());
        #endregion
        
        try
        {
            #region ConnectionOpen
            if (objConn.State != ConnectionState.Open)
            {
                objConn.Open();
            }
            #endregion

            #region SelectByPk

            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_LOC_State_SelectByPK";
            objCmd.Parameters.AddWithValue("@StateID", StateID.ToString().Trim());
            
            SqlDataReader objSDR = objCmd.ExecuteReader();

            if (objSDR.HasRows)
            {
                while (objSDR.Read())
                {
                    if (!objSDR["StateName"].Equals(DBNull.Value))
                    {
                        txtStateName.Text = objSDR["StateName"].ToString().Trim();
                    }
                    if (!objSDR["CountryID"].Equals(DBNull.Value))
                    {
                        ddlCountryID.SelectedValue = objSDR["CountryID"].ToString().Trim();
                    }
                    if (!objSDR["StateCode"].Equals(DBNull.Value))
                    {
                        txtStateCode.Text = objSDR["StateCode"].ToString().Trim();
                    }
                    break;
                }
            }
            else
            {
                lblMessage.Text = "No Data Available for the StateID = " + StateID.ToString().Trim() ;
            }
            #endregion

            #region Connection Close

            if (objConn.State == ConnectionState.Open)
            {
                objConn.Close();

            }
            #endregion
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