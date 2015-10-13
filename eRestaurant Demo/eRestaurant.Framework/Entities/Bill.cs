﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace eRestaurant.Framework.Entities
{
    public class Bill
    {
        [Required(ErrorMessage= "BillID is Required")]
        public int BillID { get; set; }
        
        public DateTime BillDate { get; set; }
        public TimeSpan OrderPlaced { get; set; }
        public int NumberInParty { get; set; }
        public Boolean PaidStatus { get; set; }
        public int WaiterID { get; set; }
        public int? TableID { get; set; }
        public int ReservationID { get; set; }
        public TimeSpan OrderReady { get; set; }
        public string Comment { get; set; }
        public TimeSpan OrderServed { get; set; }
        public TimeSpan OrderPaid { get; set; }

        public virtual Reservation Reservation { get; set; }
        public virtual Table Table { get; set; }
        public virtual Waiter Waiter {get; set ;}

        public virtual ICollection<BillItem> BillItems { get; set; }
    }
}
