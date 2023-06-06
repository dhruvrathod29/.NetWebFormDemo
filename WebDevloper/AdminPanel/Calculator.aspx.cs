using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Calculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
        }
       
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {

        #region Server side Validation
        if (txt1.Text.Trim() == "")
        {
            lblMessage1.Text = "Please Enter Number ";
        }
        else if (txt2.Text.Trim() == "")
        {
            lblMessage2.Text = "Please Enter Operation";
        }
        else if (txt3.Text.Trim() == "")
        {
            lblMessage3.Text = "please Enter Number";
        }

        #endregion Server side Validation


        #region gether iformation
        else
        {
            if (txt2.Text.Trim() == "+")
            {
                txtAns.Text = Convert.ToString(Convert.ToDouble(txt1.Text.Trim()) + Convert.ToDouble(txt3.Text.Trim()));
            }
            else if (txt2.Text.Trim() == "-")
            {
                txtAns.Text = Convert.ToString(Convert.ToDouble(txt1.Text.Trim()) - Convert.ToDouble(txt3.Text.Trim()));
            }
            else if (txt2.Text.Trim() == "*")
            {
                txtAns.Text = Convert.ToString(Convert.ToDouble(txt1.Text.Trim()) * Convert.ToDouble(txt3.Text.Trim()));
            }
            else if (txt2.Text.Trim() == "/")
            {
                txtAns.Text = Convert.ToString(Convert.ToDouble(txt1.Text.Trim()) / Convert.ToDouble(txt3.Text.Trim()));
            }
            else
            {
                lblMessage2.Text = "please enter valide opeator";
            }
            #endregion gether iformation
        }
        


    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txtAns.Text = "";
        lblMessage1.Text = "";
        lblMessage2.Text = "";
        lblMessage3.Text = "";
        lblAns.Text= "";


    }
}