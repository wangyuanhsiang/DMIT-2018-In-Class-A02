<Query Kind="Statements">
  <Connection>
    <ID>92616e0d-d25b-4427-822e-e778fa0610ff</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

// Find out information on the tables in the restaurant at a specific date/time
// Create a date and time object to use for sample input data

var date = Bills.Max(b => b.BillDate).Date;
var time = Bills.Max(b => b.BillDate).TimeOfDay.Add(new TimeSpan(0, 30, 0));

date.Add(time).Dump("The test date/time I am using");

// Step 1 - Get the table info along with any walk-in bills and reservation bills for the specific time slot
string step1Tilte = " Step 1 starts from here";
step1Tilte.Dump();

var step1 = from data in Tables
            select new
			{
			   Table = data.TableNumber,
			   Seating = data.Capacity,
			   // This sub-query gets the bills for walk-in customers
			   WalkIns = from walkIn in data.Bills
			            where
						     walkIn.BillDate.Year == date.Year
							 && walkIn.BillDate.Month == date.Month
							 && walkIn.BillDate.Day == date.Day
							 && walkIn.BillDate.TimeOfDay <= time
							 &&(!walkIn.OrderPaid.HasValue || walkIn.OrderPaid.Value >= time)
							 &&(!walkIn.PaidStatus || walkIn.OrderPaid >= time)
							 select walkIn,
							 // This sub-query gets the bills for reservations
							 Reservations = from booking in data.ReservationTables
							                from reservationParty in booking.Reservation.Bills
											where
											     reservationParty.BillDate.Year == date.Year
											  && reservationParty.BillDate.Month == date.Month
											  && reservationParty.BillDate.Day == date.Day
											  && reservationParty.BillDate.TimeOfDay <= time
											  
							 
			};
			
			step1.Dump();





