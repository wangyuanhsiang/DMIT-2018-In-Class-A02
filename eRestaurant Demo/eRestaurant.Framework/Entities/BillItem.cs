﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Framework.Entities
{
     public class BillItem
    {
         public int BillID { get; set; }
         public int ItemID { get; set; }
         public int Quantity { get; set; }
         public Decimal SalePrice { get; set; }
         public Decimal UnitCost { get; set; }
         public string Notes { get; set; }

         public virtual Bill Bills { get; set; }
         public virtual Item Items { get; set; }


     }
}