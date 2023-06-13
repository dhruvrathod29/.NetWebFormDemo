using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_LOC_State_LOC_StateAddEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            fillDropDownList();
        }
           
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        //Local Variable 
        #region Local Variable
        SqlInt32 strCountryID = SqlInt32.Null;
        SqlString strStateName = SqlString.Null;
        SqlString strStateCode = SqlString.Null;

        SqlDateTime strCreationDate = SqlDateTime.Null;
        SqlDateTime strModificationDate = SqlDateTime.Null;

        #endregion



        // Server side validation
        #region Server Side Validation

        String strErrorMessage = "";

        if (ddlCountryID.SelectedIndex==0)
        {
            strErrorMessage += "- Select Country <br/>";

        }
        if (txtStateName.Text.Trim() == "")
        {
            strErrorMessage += "- Please Enter the StateName";

        }
        if (txtStateCode.Text.Trim()== "")
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




        SqlConnection objConn = new SqlConnection("data source = HP-PC; initial catalog = VersionSystemWebForm; Integrated Security = True");
        objConn.Open();

        SqlCommand objCmd = objConn.CreateCommand();
        objCmd.CommandType = CommandType.StoredProcedure;
        objCmd.CommandText = "PR_LOC_State_Insert";
        objCmd.Parameters.AddWithValue("@CountryID", strCountryID);
        objCmd.Parameters.AddWithValue("@StateName", strStateName);
        objCmd.Parameters.AddWithValue("@StateCode", strStateCode);
        objCmd.Parameters.AddWithValue("@CreationDate", strCreationDate);
        objCmd.Parameters.AddWithValue("@ModificationDate", strModificationDate);

        objCmd.ExecuteNonQuery();


        objConn.Close();


        ddlCountryID.SelectedIndex = 0;
        txtStateName.Text = "";
        txtStateCode.Text = "";
        ddlCountryID.Focus();

        lblMessage.Text = "Record inserted successfully";

    }

    private void fillDropDownList()
    {
        SqlConnection objConn = new SqlConnection("data source = HP-PC; initial catalog = VersionSystemWebForm; Integrated Security = True");
        objConn.Open();

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

        objConn.Close();
    }

   
}