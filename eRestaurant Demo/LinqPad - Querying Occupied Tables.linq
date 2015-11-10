<Query Kind="Statements">
  <Connection>
    <ID>92616e0d-d25b-4427-822e-e778fa0610ff</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

// C# statement(S)
// find out info on the table in the restaurant at a specific date/time

var date = Bills.Max(b => b.BillDate).Date;
var time = Bills.Max(b => b.BillDate).TimeOfDay.Add(new TimeSpan(0, 30, 0));
date.Add(time).Dump("the test date/time I am using");

//step1 

var step1 = from data in Tables select new 
{
   Table = data.TableNumber,
   Seating = data.Capacity,
    // This sub-query gets the bills for walk-in customers
	WalkIns = from WalkIn in data.Bills where
	WalkIn.BillDate.Year == date.Year
	&& WalkIn.BillDate.Month == date.Month
	&& WalkIn.BillDate.Day == date.Day
	&& WalkIn.BillDate.TimeOfDay <= time
	&& (!WalkIn.OrderPaid.HasValue || WalkIn.OrderPaid.Value >= time ) 
	&& (!WalkIn.PaidStatus || WalkIn.OrderPaid >= time)
	// "WalkIn.OrderPaid >= time" means customer paid bill but not leave yet
	select WalkIn,
	// This sub-query gets the bills for reservations
	Reservations = from booking in data.ReservationTables
	from reservationParty in booking.Reservation.Bills where 
	reservationParty.BillDate.Year == date.Year
	&& reservationParty.BillDate.Month == date.Month
	&& reservationParty.BillDate.Day == date.Day
	&& reservationParty.BillDate.TimeOfDay <= time
	&& (!reservationParty.OrderPaid.HasValue || reservationParty.OrderPaid.Value >= time)
	&& (!reservationParty.PaidStatus || reservationParty.OrderPaid >= time)
	select reservationParty
     
};

step1.Dump();

//Step 2
string MessageOne = "From here is the Step 2";
MessageOne.Dump();

var step2 = from data in step1.ToList() 
select new
{
  Table = data.Table,
  Seating = data.Seating,
  CommonBilling = from info in data.WalkIns.Union(data.Reservations)
  select new 
	{
	   BillID = info.BillID,
	   BillTotal = info.BillItems.Sum(bi => bi.Quantity * bi.SalePrice),
	   Waiter = info.Waiter.FirstName,
	   Reservation = info.Reservation
	}
};

step2.Dump();

//Step3
string MessageTwo = "From here is the Step 3";
MessageTwo.Dump();

var step3 = from data in step2.ToList()
select new 
{
  Table = data.Table,
  Seating = data.Seating,
  Taken = data.CommonBilling.Count() > 0,
  CommonBilling = data.CommonBilling.FirstOrDefault()
};
step3.Dump();

string MessageThree = "From here is the Step 4";
MessageThree.Dump();

var step4 = from data in step3
            select new
            {
			  Table = data.Table,
			  Seating = data.Seating,
			  Taken = data.Taken,
              // use a ternary expression to conditionally get the bill id (if it exists)
			  BillID = data.Taken ? data.CommonBilling.BillID : (int?) null,
			  BillTotal = data.Taken ? data.CommonBilling.BillTotal : (decimal?) null,
			  Waiter = data.Taken ? data.CommonBilling.Waiter : (string) null,
			  ReservationName = data.Taken ? (data.CommonBilling.Reservation != null ? data.CommonBilling.Reservation.CustomerName : (string) null) : (string) null
            };
			
			step4.Dump();
