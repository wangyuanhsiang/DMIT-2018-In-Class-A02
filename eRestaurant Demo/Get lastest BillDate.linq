<Query Kind="Expression">
  <Connection>
    <ID>92616e0d-d25b-4427-822e-e778fa0610ff</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

from Bill in Bills orderby Bill.BillDate descending select Bill.BillDate

Bills.Max(row => row.BillDate)