using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eRestaurantSystem.Entities;
using eRestaurantSystem.DAL;
using System.ComponentModel;

namespace eRestaurantSystem.BLL
{
    public class ErestaurantController
    {
        public List<SpecialEvent> GetSpecialEvent()
        {
            RestaurantContext SpecialEventDBContext = new RestaurantContext();

            return SpecialEventDBContext.SpecialEvents.ToList();
        }
    }
}
