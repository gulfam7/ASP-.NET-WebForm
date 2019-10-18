using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InformationManagement.Models
{
    public class Student
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string Email { get; set; }
        public string RegNo { get; set; }
        public int Mobile { get; set; }
        public string DoB { get; set; }
        public string Address { get; set; }

        public Student(string studentName, string email, string regNo, int mobile, string doB, string address)
        {
            StudentName = studentName;
            Email = email;
            RegNo = regNo;
            Mobile = mobile;
            DoB = doB;
            Address = address;
        }

    }
}