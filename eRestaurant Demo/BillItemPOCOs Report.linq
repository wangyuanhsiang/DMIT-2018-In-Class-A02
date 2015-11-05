<Query Kind="Program">
  <Connection>
    <ID>d68db689-0c61-43d2-989d-26df5147c5ad</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

void Main()
{
	var result = from BillItem in BillItems orderby BillItem.ItemID descending
    select new BillItemPOCOs()
	{
	    nBillID = BillItem.BillID,
		nItemID = BillItem.ItemID,
		nQuantity = BillItem.Quantity,
		nSalePrice = BillItem.SalePrice,
		nUnitCost = BillItem.UnitCost,
		nNotes = BillItem.Notes
//		nBillDate = BillItem.Bill.BillDate,
//		nOrderPlaced = BillItem.Bill.OrderPlaced
	};
	result.Dump();
}

// Define other methods and classes here


public class BillItemPOCOs
{
     public int nBillID {get; set;}
	 public int nItemID {get;set;} 
	 public int nQuantity {get; set;}
	 public decimal nSalePrice {get;set;} 
	 public decimal nUnitCost {get; set;}
	 public string nNotes {get;set;}
//	 public object nBillDate {get;set;} 
//	 public object nOrderPlaced{get;set;}
 
}