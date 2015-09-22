using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Framework.Entities
{
     public class Reservation
    {
         [Key]
         public int ReservationID { get; set; }
         public string CustomerName { get; set; }
         public DateTime ReservationDate { get; set; }
         public int NumberinParty { get; set; }
         public string ContactPhone {get;set;}
         public string ReservationStatus { get; set; }
         public string EventCode { get; set; }
         

    }
}
