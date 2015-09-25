using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurantSystem.Entities
{
     public class Table
    {
 
        public int TableID { get; set; }
        [Required(ErrorMessage = "Table Number is required")]
        [Range(1, 2, ErrorMessage = "Table Number must be a positive number")]
        public Byte TableNumber { get; set; }

        public Boolean Smoking { get; set; }
        public int Capacity { get; set; }
        public Boolean Available { get; set; }

        public Table ()
        {
           Available = true;
        }


        // public virtual Reservation Reservations { get; set; } Inccrocted code, Show Error on model creating
        public virtual ICollection<Reservation> Reservations { get; set; }
    }
}
