using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecipeFinder
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String theName = GridView1.SelectedRow.Cells[0].Text;
            Session.Add("theRecipe", theName);
            Response.Redirect("WebForm5.aspx");
        }

        protected void addRecipe_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["RecipeName"].DefaultValue = nameBox.Text;
                parameters["RecipeDirections"].DefaultValue = directionsBox.Text;
                try
                {
                    SqlDataSource1.Insert();
                    nameBox.Text = "";
                    directionsBox.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}