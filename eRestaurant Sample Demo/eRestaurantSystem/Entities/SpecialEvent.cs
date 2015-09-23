using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace eRestaurantSystem.Entities
{
    public class SpecialEvent
    {
        [Key]
        public string EventCode { get; set; }
        public string Description { get; set; }
        public Boolean Active { get; set; }

        public virtual ICollection<Reservation> Reservations { get; set; }
    }
}
