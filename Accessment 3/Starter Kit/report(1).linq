<Query Kind="Program">
  <Connection>
    <ID>9a250d5e-dbd0-445e-aecd-7b07607ce211</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eTools</Database>
  </Connection>
</Query>

void Main()
{
	var result = from Employee in Employees where Employee.Position.PositionID == 2 
                 orderby Employee.EmployeeID descending
                 select new ReportEmployee() 
	             {
	                 Position = Employee.Position.Description,
					 Name = Employee.FirstName + " " + Employee.LastName,
					 Hired = Employee.DateHired,
					 Release = Employee.DateReleased
	             };
	result.Dump();
}

// Define other methods and classes here

public class ReportEmployee
{
   public string Position {get;set;}
   public string Name {get;set;}
   public object Hired {get; set;}
   public object Release {get;set;}

}