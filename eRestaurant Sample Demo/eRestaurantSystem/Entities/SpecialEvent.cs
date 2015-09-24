﻿using System;
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
        [Required(ErrorMessage = "An Event Code is required (one character only)")]
        [StringLength(1, ErrorMessage = "Event Codes can only use a single-character code")]
        public string EventCode { get; set; }

        [Required(ErrorMessage = "A Description is required (5-30 characters)")]
        [StringLength(30, MinimumLength = 5, ErrorMessage = "Descriptions must be from 5 to 30 characters in length")]
        public string Description { get; set; }
        public Boolean Active { get; set; }

        public virtual ICollection<Reservation> Reservations { get; set; }

        public SpecialEvent()
        {
            Active = true;
        }
    }
}
