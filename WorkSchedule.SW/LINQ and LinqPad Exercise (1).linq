<Query Kind="Expression">
  <Connection>
    <ID>7daef5af-d96b-42d6-8b39-a1f9de472020</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>WorkSchedule</Database>
  </Connection>
</Query>

from Skill in Skills orderby Skill.Description where Skill.Description.EndsWith("Journeyman")  select new 
{
   Description = Skill.Description,
   Employees = from EmployeeSkill in Skill.EmployeeSkills select new {
    Name = EmployeeSkill.Employee.FirstName +"  "+ EmployeeSkill.Employee.LastName,
    Level = EmployeeSkill.Level,
    YearsExperience = EmployeeSkill.YearsOfExperience
   
//   Name = Employee.FirstName + " " + Employee.LastName
//   Level = from EmployeeSkill in EmployeeSkills select EmployeeSkill.Level,
//   YearsExperience = from EmployeeSkill in EmployeeSkills select EmployeeSkill.YearsOfExperience
   }
}