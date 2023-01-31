--Questions from https://artoftesting.com/sql-queries-for-interview
-- 1.Write an SQL query to fetch the EmpId and FullName of all the employees working under Manager with id – ‘986’.
select EmpId,FullName from EmployeeDetails
where managerid=986;
--2.Write an SQL query to fetch the different projects available from the EmployeeSalary table.
Select DISTINCT(project) from employeesalary;

--3.Write an SQL query to fetch the count of employees working in project ‘P1’.
select count(empid) from employeesalary
where project='P1';

--4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
select empid,MAX(salary),min(salary),avg(salary) from employeesalary
group by empid;

--5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select empid,salary from employeesalary
where salary between 9000 and 15000;

--6. Write an SQL query to fetch those employees who live in Toronto and work under manager with ManagerId – 321.
select * from EmployeeDetails
where city='Toronto' And managerid=321;

--7.Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select * from EmployeeDetails
where city='California' or managerid=321;

--8. Write an SQL query to fetch all those employees who work on Project other than P1.
select * from employeesalary
where project<>'P1';

--9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
