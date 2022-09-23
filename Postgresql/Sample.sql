Create table EmployeeDetails(
EmpId int NOT NULL,
FullName VARCHAR(25),
ManagerId int NOT NULL,
DateOfJoining VARCHAR(25),
City VARCHAR(25)
)

SELECT * from EmployeeDetails;

INSERT into EmployeeDetails VALUES(121,'John Snow',321,'01/31/2014','Toronto')
INSERT into EmployeeDetails VALUES(321,'Walter White',986,'01/30/2015','California')
INSERT into EmployeeDetails VALUES(421,'Kuldeep Rana',876,'27/11/2016','New Delhi')

Create table EmployeeSalary(
EmpId int NOT NULL,
Project VARCHAR(25),
Salary int NOT NULL,
Variable int 
)

SELECT * from EmployeeSalary;

INSERT into EmployeeSalary VALUES(121,'P1',8000,500)
INSERT into EmployeeSalary VALUES(321,'P2',10000,1000)
INSERT into EmployeeSalary VALUES(421,'P1',12000,0)