<Query Kind="Program">
  <Connection>
    <ID>0e05f424-ac02-4de4-add6-8468a6b0fabf</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eTools</Database>
  </Connection>
</Query>

void Main()
{
	var result = from Employee in Employees where Employee.Position.PositionID == 3 
                 orderby Employee.EmployeeID descending
                 select new EmployeesPOCOs() 
	             {
	                 ID = Employee.EmployeeID,
					 Name = Employee.FirstName + " " + Employee.LastName,
					 DateHired = Employee.DateHired
	             };
	result.Dump();
}

// Define other methods and classes here

public class EmployeesPOCOs 
{
   public int ID {get;set;}
   public string Name {get;set;}
   public object DateHired {get;set;}

}