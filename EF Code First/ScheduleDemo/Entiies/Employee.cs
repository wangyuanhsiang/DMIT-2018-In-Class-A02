using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ScheduleDemo.Entiies
{
     public  class Employee
    {
         public int EmployeeID { get; set; }
         public string FirstName { get; set; }
         public string LastName { get; set; }
         public string HomePhone { get; set; }
         public bool Active { get; set; }

         public virtual ICollection<Schedule> Schedules { get; set; }
         public virtual ICollection<EmployeeSkill> EmployeeSkills { get; set; }
    }
}
