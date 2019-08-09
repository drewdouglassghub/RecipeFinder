using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecipeFinder
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            string a = (string)Session["theRecipe"];
            Label1.Text = a;
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource2.InsertParameters;
                parameters["RecipeName"].DefaultValue = Label1.Text;
                parameters["Name"].DefaultValue = nameBox.Text;
                parameters["Amount"].DefaultValue = amountBox.Text;
                try
                {
                    SqlDataSource2.Insert();
                    nameBox.Text = "";
                    amountBox.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}