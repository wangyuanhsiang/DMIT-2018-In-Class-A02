using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
namespace ScheduleDemo.Entiies
{
    public class Shift
    {
        public int ShiftID { get; set; }
        public int PlacementContractID { get; set; }
        public int DayOfWeek { get; set; }
        public DateTime StartTime { get; set;}
        public DateTime EndTime { get; set; }
        public Byte NumberOfEmployees { get; set; }
        public bool Active { get; set; }
        public string Notes { get; set; }

        public virtual PlacementContract PlacementContracts { get; set; }
        public virtual ICollection<Schedule> Schedules { get; set; }  
    }
}
