<Query Kind="Program">
  <Connection>
    <ID>92616e0d-d25b-4427-822e-e778fa0610ff</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

void Main()
{
	Bills.Max(row => row.BillDate).Dump();
	
	
}

// Define other methods and classes here

private DateTime GetProperty(Bills x)
{
  return x.BillDate;
}