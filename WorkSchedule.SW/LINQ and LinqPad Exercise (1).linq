<Query Kind="Expression">
  <Connection>
    <ID>7daef5af-d96b-42d6-8b39-a1f9de472020</ID>
    <Server>.</Server>
    <Database>WorkSchedule</Database>
  </Connection>
</Query>

// 1.Show all skills requiring a ticket and which employees have those skills. Include all the data as seen in the following image.

from Skill in Skills orderby Skill.Description where Skill.Description.EndsWith("Journeyman")  select new 
{
   Description = Skill.Description,
   Employees = from EmployeeSkill in Skill.EmployeeSkills orderby EmployeeSkill.YearsOfExperience descending 
   select new {
    Name = EmployeeSkill.Employee.FirstName +"  "+ EmployeeSkill.Employee.LastName,
    Level = EmployeeSkill.Level,
    YearsExperience = EmployeeSkill.YearsOfExperience
   
//   Name = Employee.FirstName + " " + Employee.LastName
//   Level = from EmployeeSkill in EmployeeSkills select EmployeeSkill.Level,
//   YearsExperience = from EmployeeSkill in EmployeeSkills select EmployeeSkill.YearsOfExperience
   }
}

// 2.List all skills, alphabetically, showing only the description of the skill

from Skill in Skills  orderby  Skill.Description select Skill.Description

//3.List all the skills for which we do not have any qualfied employees

from Skill in Skills where Skill.EmployeeSkills.Count() == 0  select Skill.Description

//4.From the shifts scheduled for NAIT's placement contract, show the number of exmployees needed for each day (ordered by day-of-week). 

from Shift in Shifts group Shift by Shift.DayOfWeek into  
select new
{
   Day = Shift.DayOfWeek,
   
   
   //EmployeesNeeded = from number in Shifts select number.NumberOfEmployees

}