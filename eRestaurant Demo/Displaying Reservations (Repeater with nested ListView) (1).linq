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
	var date = new DateTime(2014, 10, 24);
	 date.Dump();
	 ReservationsByTime(date).Dump();
}

// Define other methods and classes here

public List<dynamic> ReservationsByTime (DateTime date)
{
   var result = (from data in Reservations 
   where data.ReservationDate.Year == date.Year
						 && data.ReservationDate.Month == date.Month
						 && data.ReservationDate.Day == date.Day
						 &&  data.ReservationStatus == 'B'
	select new ReservationSummary
	{
	                        ID = data.ReservationID,
							Name = data.CustomerName,
							Date = data.ReservationDate,
							NumberInParty = data.NumberInParty,
							Status = data.ReservationStatus,
							Event = data.SpecialEvents.Description,
							Contact = data.ContactPhone
	}).ToList();
	var finalResult = from item in result orderby item.NumberInParty
	group item by item.Date.Hour into itemGroup 
	select new ReservationCollection
	{
	    Hour = itemGroup.Key,
		Reservations = itemGroup.ToList()
	};
//	return finalResult.OrderBy(x => x.Hour).ToList();
 return finalResult.ToList<dynamic>();
}



public class ReservationSummary
{
    public int ID { get; set; }
    public string Name { get; set; }
    public DateTime Date { get; set; }
    public int NumberInParty { get; set; }
    public char Status { get; set; }
    public string Event { get; set; }
    public string Contact { get; set; }
}

public class ReservationCollection
{
    public int Hour { get; set; }
    public TimeSpan SeatingTime { get { return new TimeSpan(Hour, 0, 0); } }
    public virtual ICollection<ReservationSummary> Reservations { get; set; }
}