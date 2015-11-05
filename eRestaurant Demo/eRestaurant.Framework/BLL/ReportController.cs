using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using eRestaurant.Framework.DAL;
using eRestaurant.Framework.Entities.POCOs;

namespace eRestaurant.Framework.BLL
{
    [DataObject]
     public class ReportController
     {
         #region - GetReportCategoryMenuItems
         public List<CategoryMenuItem> GetReportCategoryMenuItems()
        {
            using(var context = new RestaurantContext())
            {
                var result = from cat in context.Items
                             orderby cat.MenuCategory.Description, cat.Description
                             select new CategoryMenuItem
                             {
                                 CategoryDescription = cat.MenuCategory.Description,
                                 ItemDescription = cat.Description,
                                 Price = cat.CurrentPrice,
                                 Calories = cat.Calories,
                                 Comment = cat.Comment
                             };
                return result.ToList();
            }
        }
        #endregion


         #region
         public List<BillItemPOCOs> getReportBillItemPOCOs()
         {
             using(var context = new RestaurantContext())
             {
                 var result = from BillItem in context.BillItems
                              orderby BillItem.ItemID descending
                              select new BillItemPOCOs
                              {
                                  nBillID = BillItem.BillID,
                                  nItemID = BillItem.ItemID,
                                  nQuantity = BillItem.Quantity,
                                  nSalePrice = BillItem.SalePrice,
                                  nUnitCost = BillItem.UnitCost
                                  //nNotes = BillItem.Notes
                                  //nID = BillItem.Bill.BillID,
                                  //nBillDate = BillItem.Bill.BillDate,
                                  //nOrderPlaced = BillItem.Bill.OrderPlaced
                              };
                return result.ToList();
             }
         }

         #endregion
     }
}
