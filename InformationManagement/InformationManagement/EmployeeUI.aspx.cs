using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InformationManagement
{
    public partial class EmployeeUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                yearLabel.Visible = false;
                monthLabel.Visible = false;
                Calendar1.Visible = false;
                DropDownList1.Visible = false;
                DropDownList1.Visible = false;
            }
        }

        protected void dobImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                yearLabel.Visible = false;
                monthLabel.Visible = false;
                Calendar1.Visible = false;
                DropDownList1.Visible = false;
                DropDownList1.Visible = false;
            }
            else
            {
                yearLabel.Visible = true;
                monthLabel.Visible = true;
                Calendar1.Visible = true;
                DropDownList1.Visible = true;
                DropDownList1.Visible = true;
            }
          
        }
    }
}