using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using eRestaurant.Framework.Entities;
using eRestaurant.Framework.DAL;

namespace eRestaurant.Framework.BLL
{
     [DataObject]
     public class TempController
    {
         [DataObjectMethod(DataObjectMethodType.Select, false)]
         public List<SpecialEvent> GetSpecialEvent()
         {
             using (RestaurantContext specialEventDBContext = new RestaurantContext())
             { return specialEventDBContext.SpecialEvents.ToList(); }
         }
             

    }
}
