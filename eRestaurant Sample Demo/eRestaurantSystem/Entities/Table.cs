using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurantSystem.Entities
{
    class Table
    {
        public int TableID { get; set; }
        public Byte TableNumber { get; set; }
        public Boolean Smoking { get; set; }
        public int Capacity { get; set; }
        public Boolean Available { get; set; }

        public virtual Reservation Reservations { get; set; }
    }
}
