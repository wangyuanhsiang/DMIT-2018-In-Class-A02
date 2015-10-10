﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using ScheduleDemo.DAL; // 
using ScheduleDemo.Entiies;

namespace ScheduleDemo.BLL
{
     [DataObject]
    public class ScheduledemoController
    {
       
        public List<Employee> ListEmployee()
        {
            using (WorkScheduleDBContext EmployeeDBContext = new WorkScheduleDBContext() )
            { return EmployeeDBContext.Employees.ToList(); }
            
        } 
    }
}