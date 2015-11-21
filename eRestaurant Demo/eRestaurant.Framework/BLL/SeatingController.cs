using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using eRestaurant.Framework.Entities.DTOs;
using eRestaurant.Framework.DAL;
using eRestaurant.Framework.Entities;

namespace eRestaurant.Framework.BLL
{
     [DataObject]
    public class SeatingController
    {
       [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<ReservationCollection> ReservationsByTime (DateTime date)
         {
           using(var context = new RestaurantContext())
           {
               var result = (from data in context.Reservations
               where data.ReservationDate.Year == date.Year
						 && data.ReservationDate.Month == date.Month
						 && data.ReservationDate.Day == date.Day
						 &&  data.ReservationStatus == Reservation.Booked
	       select new ReservationSummary()
           {
               ID = data.ReservationID,
               Name = data.CustomerName,
               Date = data.ReservationDate,
               NumberInParty = data.NumberinParty,
               Status = data.ReservationStatus,
               Event = data.SpecialEvent.Description,
               Contact = data.ContactPhone
           }).ToList();
               var finalResult = from item in result
                                 orderby item.NumberInParty
                                 group item by item.Date.Hour into itemGroup
                                 select new ReservationCollection()
                                 {
                                     Hour = itemGroup.Key,
                                     Reservations = itemGroup.ToList()
                                 };
               return finalResult.OrderBy(x => x.Hour).ToList();
              // return finalResult.ToList<dynamic>();
           }        
         }
        
    }
}
