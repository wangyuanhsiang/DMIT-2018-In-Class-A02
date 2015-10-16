using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace ScheduleDemo.Entiies
{
    public class EmployeeSkill
    {
        [Required(ErrorMessage="Employee Skill Id is required")]
        public int EmployeeSkillID { get; set; }
        public int EmployeeID { get; set; }
        public int SkillID { get; set; }
        public int Level {get; set;}
        public int YearOfExperience { get; set; }

        public virtual Employee Employee { get; set; }
        public virtual Skill Skill { get; set; }

    }
}
