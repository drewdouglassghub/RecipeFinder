using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecipeFinder
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = (string)Session["SearchOne"];
            string b = (string)Session["SearchTwo"];
            string c = (string)Session["SearchThree"];
            search1Lbl.Text = a;
            search2Lbl.Text = b;
            search3Lbl.Text = c;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String theName = GridView1.SelectedRow.Cells[0].Text;
            Session.Add("theRecipe", theName);
            Response.Redirect("WebForm3.aspx");
        }
    }
}