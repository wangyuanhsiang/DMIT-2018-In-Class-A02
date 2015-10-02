﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace ScheduleDemo.Entiies
{
     public class Schedule
    {
         public int ScheduleID { get; set; }
         public DateTime Day { get; set; }
         public int ShiftID { get; set; }
         public int EmployeeID { get; set; }

         public virtual Shift Shifts { get; set; }
         public virtual Employee Employees { get; set; }
        
    }
}
