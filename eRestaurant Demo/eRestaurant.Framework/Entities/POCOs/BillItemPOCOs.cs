using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Framework.Entities.POCOs
{
    public class BillItemPOCOs
    {
        public int nBillID { get; set; }
        public int nItemID { get; set; }
        public int nQuantity { get; set; }
        public decimal nSalePrice { get; set; }
        public decimal nUnitCost { get; set; }
        //public string nNotes { get; set; }
        //public int nID { get; set; }
        //public DateTime nBillDate { get; set; }
        //public TimeSpan nOrderPlaced { get; set; }
    }
}
