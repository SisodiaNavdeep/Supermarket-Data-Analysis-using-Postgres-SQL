-- Create the Patients table
CREATE TABLE navdeep_usr.Patients (
    PatientId SERIAL PRIMARY KEY,
    PatientName VARCHAR(255) NOT NULL,
    Gender CHAR(1),
    Age INT,
    Address TEXT
);

-- Create the PatientsCheckup table
CREATE TABLE navdeep_usr.PatientsCheckup (
    PatientId INT REFERENCES navdeep_usr.Patients(PatientId),
    BP VARCHAR(10),
    Weight DECIMAL(5, 2),
    ConsultationFees DECIMAL(8, 2)
);

-- Insert records into the Patients table
INSERT INTO navdeep_usr.Patients (PatientName, Gender, Age, Address)
VALUES
    ('Jatin', 'M', 35, ', Sector 23,Delhi, India'),
    ('aliya', 'F', 28, 'Sector 24, Gurugram, India'),
    ('Dev', 'M', 42, 'Electronic City, Noida, India'),
    ('Deepak', 'M', 31, '101 Golf Course,Dehradun , India'),
    ('diya', 'F', 50, '202 Cedar St, Ghaziabad, India');

-- Insert records into the PatientsCheckup table
INSERT INTO navdeep_usr.PatientsCheckup (PatientId, BP, Weight, ConsultationFees)
VALUES
    (1, '120/80', 75.5, 50.00),
    (2, '130/85', 63.2, 40.00),
    (3, '140/90', 85.0, 60.00),
    (4, '115/75', 68.7, 45.00),
    (5, '125/82', 92.3, 55.00);
	
	Select * from navdeep_usr.Patients;
	Select * from navdeep_usr.PatientsCheckup;
	
Create table navdeep_usr.Employee(Employee_id int, 
								  Employee_name varchar(50), 
								  Manager_id int);
insert into navdeep_usr.Employee values(1,'a',2),
										(2,'b',3),
										(3,'c',4);
										
b manager of a
c manager of b

select e1.Employee_Name as Eamployee_Name, e2.Employee_Name as Manager_Name
from navdeep_usr.Employee e1
left join navdeep_usr.Employee e2
on e2.Employee_id=e1.Manager_id



create table navdeep_usr.employee1(Name varchar(20))

insert into navdeep_usr.employee1 values 
('Nikhil'),('Nitin'),('Nikhil'),('Nitin')

Select name, count(*) frequency
from navdeep_usr.employee1 
group by name
having count(*)>1;

create navdeep_usr.emp(e_name varchar(50), e_id int, e_sal int);


create table navdeep_usr.x(A int);

insert into navdeep_usr.x values(1),(2),(3),(4);

create table navdeep_usr.y(B int);

insert into navdeep_usr.y values(2),(4),(6),(8);

select * from navdeep_usr.x x
full join navdeep_usr.y y
on x.A=y.B

create table navdeep_usr.emp1(emp_id int, emp_name 
						varchar(50), manager_id int, 
						department_id int, salary int);

insert into navdeep_usr.emp1 values
(1, 'Abc',11,111, 1000),
(1, 'Abc',11,111, 1000),
(3, 'Bcd', 12,112, 2000),
(1, 'Abc',11,111, 1000);

with sameCTE as (
    select emp_id, emp_name, manager_id, 
						department_id, salary
    from navdeep_usr.emp1
    group by emp_id, emp_name, manager_id, 
						department_id, salary
    having count(*) > 1
)
delete from navdeep_usr.emp1
where (emp_id, emp_name, manager_id, 
						department_id, salary) in (select emp_id, emp_name, manager_id, 
						department_id, salary from sameCTE);
Select * from navdeep_usr.emp1;

