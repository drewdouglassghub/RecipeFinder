using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecipeFinder
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            Session.Add("SearchOne", searchBox1.Text);
            Session.Add("SearchTwo", searchBox2.Text);
            Session.Add("SearchThree", searchBox3.Text);
            Response.Redirect("WebForm2.aspx");
        }

        protected void addChange_Click(object sender, EventArgs e)
        {

        }

        protected void searchBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}