﻿using System;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Reflection;
using Domain.Entities;
using DataService.service.dao;
using DataService.util;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Web.SessionState;

namespace Domain.control
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class StudentControl : IHttpHandler, IRequiresSessionState
    {
        public HttpContext context;
        public void ProcessRequest(HttpContext context)
        {
            this.context = context;
            context.Response.ContentType = "text/plain";
            String method = context.Request.Form.Get("method");
            if (method == null)
            {
                method = context.Request.QueryString["method"];
            }
            switch (method)
            {
                case "addStudent":
                    addStudent();
                    break;
                case "delStudent":
                    delStudent();
                    break;
                case "updateStudent":
                    updateStudent();
                    break;
                case "getStudents":
                    getStudents();
                    break;
                case "getStudent":
                    getStudent();
                    break;
                case "updatePassword":
                    updatePassword();
                    break;
                default:
                    context.Response.Write("-1");
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void addStudent()
        {
            try
            {
                Student student = new Student();
                setValue(student, context);

                HttpPostedFile hpf = context.Request.Files["headImgFile"];
                if (hpf != null)
                {
                    string serverPath = "/uploadFile/headImg/" + System.DateTime.Now.Ticks + "." + hpf.FileName.Split('.')[1];
                    string savePath = context.Server.MapPath(serverPath);//路径,相对于服务器当前的路径
                    hpf.SaveAs(savePath);//保存
                    student.HeadImage = serverPath;
                }
                string FacultyID = context.Request.Form.Get("Faculty");
                DepartmentService ds = new DepartmentService();
                string professionID = context.Request.Form.Get("Profession");
                if (!string.IsNullOrEmpty(professionID))
                {
                    Profession profession = ds.getProfessionByID(professionID);
                    if (profession != null)
                        student.Profession = profession;
                }

                string ClassGradeID = context.Request.Form.Get("ClassGrade");
                if (!string.IsNullOrEmpty(ClassGradeID))
                {
                    ClassGrade classGrade = ds.getClassGradeByID(ClassGradeID);
                    if (classGrade != null)
                        student.ClassGrade = classGrade;
                }
                StudentService s = new StudentService();
                student.Password = student.Sn;
                s.save(student);
                
                context.Response.Write("1");
            }
            catch (Exception e)
            {
                context.Response.Write("0");
            }
        }

        public void delStudent()
        {
            try
            {
                string Id = context.Request.QueryString["Id"];
                StudentService service = new StudentService();
                service.del(service.get(typeof(Student), Id));
                context.Response.Write("1");
            }
            catch (Exception e)
            {
                context.Response.Write("0");
            }

        }

        public void updateStudent()
        {
            try
            {
                Student student = new Student();
                setValue(student, context);

                HttpPostedFile hpf = context.Request.Files["headImgFile"];
                if (hpf != null) {
                    string savepath = context.Server.MapPath("/uploadFile/headImg/" + student.Id + "." + hpf.GetType());//路径,相对于服务器当前的路径
                    hpf.SaveAs(savepath);//保存
                    student.HeadImage = savepath;
                }

                DepartmentService ds = new DepartmentService();
                string professionID = context.Request.Form.Get("Profession");
                if (!string.IsNullOrEmpty(professionID)) {
                    Profession profession = ds.getProfessionByID(professionID);
                    if (profession != null)
                        student.Profession = profession;
                }

                string ClassGradeID = context.Request.Form.Get("ClassGrade");
                if (!string.IsNullOrEmpty(ClassGradeID)) {
                    ClassGrade classGrade = ds.getClassGradeByID(ClassGradeID);
                    if (classGrade != null)
                        student.ClassGrade = classGrade;
                }
                
                StudentService s = new StudentService();
                s.save(student);
                context.Response.Write("1");
            }
            catch (Exception e)
            {
                context.Response.Write("0");
            }
        }

        public void getStudent() {
            string Id = context.Request.QueryString["Id"];
            StudentService service = new StudentService();
            Student student = (Student)service.get(typeof(Student), Id);
            String json = JsonConvert.SerializeObject(student);
            context.Response.Write(json);
        }

        public void getStudents()
        {
            try
            {
                StudentService service = new StudentService();
                Student student = new Student();
                setValue(student, context);

                string ProfessionID = context.Request.Form.Get("FacultyID");
                string FacultyID = context.Request.Form.Get("ProfessionID");

                IList<Profession> professionList = new List<Profession>();
                DepartmentService ds = new DepartmentService();
                if (!string.IsNullOrEmpty(ProfessionID)) {
                   Profession profession = ds.getProfessionByID(ProfessionID);
                   if (profession != null) professionList.Add(profession);
                }
                else if (!string.IsNullOrEmpty(FacultyID)) {
                    Faculty faculty = ds.getFacultyByID(FacultyID);
                    if (faculty != null && faculty.professionList != null)
                        foreach (Profession p in faculty.professionList)
                            professionList.Add(p);
                }

                student.ProfessionList = professionList;
                int rows = Convert.ToInt32(context.Request.Form["rows"]);
                int page = Convert.ToInt32(context.Request.Form["page"]);
                object[] data = service.getStudentList(student, rows, page);
                Hashtable ht = new Hashtable();
                ht.Add("total", data[0]);
                ht.Add("rows", data[1]);
                String json = JsonConvert.SerializeObject(ht);
                context.Response.Write(json);
            }
            catch (Exception e)
            {

            }

        }

        public void updatePassword() {
            try {
                string Sn = context.Request.Form.Get("Sn");
                string Password = context.Request.Form.Get("Password");
                StudentService ss = new StudentService();
                ss.updatePassword(Sn, Password);
                context.Response.Write("1");
            }
            catch (Exception e) {
                context.Response.Write("0");
            }
        }

        public Object setValue(Object o, HttpContext context)
        {
            string[] keys = context.Request.Form.AllKeys;
            foreach (string s in keys)
            {
                try
                {
                    PropertyInfo property = o.GetType().GetProperty(s);
                    if (property == null)
                    {
                        continue;
                    }
                    if (property.PropertyType == typeof(DateTime))
                    {
                        property.SetValue(o, Convert.ToDateTime(context.Request.Form.Get(s)), null);
                    }
                    else if (property.PropertyType == typeof(string) || property.PropertyType == typeof(int))
                    {
                        property.SetValue(o, context.Request.Form.Get(s), null);
                    }

                }
                catch (Exception e)
                {
                    Console.Write(e.Message);
                }

            }
            return o;
        }

    }

}
