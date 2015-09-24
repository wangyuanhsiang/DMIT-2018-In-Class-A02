using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurantSystem.Entities
{
    class Reservation
    {
        [Key]

        public int ReservationID { get; set; }
        [Required, StringLength(40)]
        public string CustomerName { get; set; }
        public DateTime ReservationDate { get; set; }
        [Range(1, 16)]
        public int NumberInParty { get; set; }
        [StringLength(15)]
        public string ContactPhone { get; set; }
        [Required, StringLength(1, MinimumLength = 1)]
        public string ReservationStatus { get; set; }
        [StringLength(1)]
        public string EvenntCode { get; set; }

        public virtual SpecialEvent SpecialEvents { get; set; }
        public virtual ICollection<Table> Tables { get; set; }
    }
}
