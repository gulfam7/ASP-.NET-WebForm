using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using InformationManagement.Models;

namespace InformationManagement
{
    public partial class StudentFormUi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dateTextBox.ReadOnly = true;
            if (!IsPostBack)
            {
                yearLabel.Visible = false;
                monthLabel.Visible = false;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Calendar1.Visible = false;

                DataSet years = new DataSet();
                years.ReadXml(Server.MapPath("~/Year.xml"));
                DropDownList1.DataTextField = "Number";
                DropDownList1.DataValueField = "Number";

                DropDownList1.DataSource = years;
                DropDownList1.DataBind();

                DataSet months = new DataSet();
                months.ReadXml(Server.MapPath("~/Month.xml"));
                DropDownList2.DataTextField = "Name";
                DropDownList2.DataValueField = "Number";

                DropDownList2.DataSource = months;
                DropDownList2.DataBind();
            }

            ShowAllStuedntInfo();

        }

        private void ShowAllStuedntInfo()
        {
            List<Student> studentList = new List<Student>();
            string connectionString =
                @"Server = DESKTOP-8UKGGBA\SHAJUSQL; Database = InformationManagementDB; Integrated Security = true";
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * From StudentInfo_tbl";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int studentId = (int) reader["StudentId"];
                string studentName = reader["StudentName"].ToString();
                string email = reader["Email"].ToString();
                string regNo = reader["RegNo"].ToString();
                int mobile = (int)reader["Mobile"];
                string doB = reader["DoB"].ToString();
                string address = reader["Address"].ToString();
                Student student = new Student(studentName, email, regNo, mobile, doB, address);
                student.StudentId = studentId;
                studentList.Add(student);
            }
            reader.Close();
            connection.Close();
            studentGridView.DataSource = studentList;
            studentGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string name = inputName.Value;
            string email = inputEmail.Value;
            string regNo = inputRegNo.Value;
            int mobile = Convert.ToInt32(inputMobile.Value);
            string doB = dateTextBox.Text;
            string address = inputAddress.Value;

            Student aStudent = new Student(name, email, regNo, mobile, doB, address);

            string connectionString =
                @"Server = DESKTOP-8UKGGBA\SHAJUSQL; Database = InformationManagementDB; Integrated Security = true";
            SqlConnection connection = new SqlConnection(connectionString);

            string query =
                "INSERT INTO" +
                " StudentInfo_tbl (StudentName ,Email ,RegNo ,Mobile ,DoB ,Address) " +
                "VALUES('"+aStudent.StudentName+"','"+aStudent.Email+"','"+aStudent.RegNo+"'," +
                ""+aStudent.Mobile+",'"+aStudent.DoB+"','"+aStudent.Address+"')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int roweffect = command.ExecuteNonQuery();
            if (roweffect > 0)
            {
                messageLabel.Text = String.Empty;
                messageLabel.Text = "Student Information Saved";
                messageLabel.ForeColor = Color.Green;
                ClearTextField();
                ShowAllStuedntInfo();
            }
            else
            {
                messageLabel.Text = String.Empty;
                messageLabel.Text = "Student Information Failed to Saved";
                messageLabel.ForeColor = Color.Red;
            }

            connection.Close();

        }

        protected void doBImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                yearLabel.Visible = false;
                monthLabel.Visible = false;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Calendar1.Visible = false;
            }
            else
            { 
                yearLabel.Visible = true;
                monthLabel.Visible = true;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Calendar1.Visible = true;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(DropDownList1.SelectedValue);
            int month = Convert.ToInt32(DropDownList2.SelectedValue);

            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(DropDownList1.SelectedValue);
            int month = Convert.ToInt32(DropDownList2.SelectedValue);

            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            dateTextBox.Text = Calendar1.SelectedDate.ToShortDateString();
            yearLabel.Visible = false;
            monthLabel.Visible = false;
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;
            Calendar1.Visible = false;
        }

        protected void ClearTextField()
        {
            inputName.Value = String.Empty;
            inputEmail.Value = String.Empty;
            inputRegNo.Value = String.Empty;
            inputMobile.Value = String.Empty;
            dateTextBox.Text = String.Empty;
            inputAddress.Value = String.Empty;
        }
    }
}