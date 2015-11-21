<Query Kind="Expression">
  <Connection>
    <ID>d68db689-0c61-43d2-989d-26df5147c5ad</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

 from data in Reservations 
                         where data.ReservationDate.Year == 2014
						 && data.ReservationDate.Month ==10
						 && data.ReservationDate.Day == 24
						 && data.ReservationStatus == 'B'
						 select new 
						 {
						    Name = data.CustomerName,
							Date = data.ReservationDate,
							NumberInParty = data.NumberInParty,
							Status = data.ReservationStatus,
							Event = data.SpecialEvents.Description,
							Contact = data.ContactPhone,
							Tables = from seat in data.ReservationTables
							select seat.Table.TableNumber
						 }