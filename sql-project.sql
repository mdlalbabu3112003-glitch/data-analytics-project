CREATE  TABLE  Coursee (
Course_id INT PRIMARY KEY,
Course_name VARCHAR(50) NOT NULL,
Duration VARCHAR(20),
Fees INT
);

SELECT* FROM Coursee;
INSERT INTO Coursee (Course_id, Course_name, Duration, Fees)
VALUES
(1, 'Java Programming', '3 months', 15000),
(2, 'Web Development', '4 months', 20000),
(3, 'Data Science', '6 months', 30000),
(4, 'machine learning', '5 months', 25000);
SELECT * FROM Coursee;
INSERT INTO Coursee (Course_id, Course_name, Duration, Fees)
VALUES
(5, 'Cloud Computing', '4 months', 22000),
(6, 'Cyber Security', '3 months', 18000);
SELECT * FROM Coursee;

INSERT INTO Coursee (Course_id, Course_name, Duration, Fees)
VALUES
(7, 'DevOps', '4 months', 24000),
(8, 'UI/UX Design', '3 months', 16000);
SELECT * FROM Coursee;  

create TABLE DEPARTMENTS(
Dept_id INT PRIMARY KEY,
Dept_name VARCHAR(50) NOT NULL,
managername VARCHAR(50),
headquaters VARCHAR(50)
);

insert INTO DEPARTMENTS (Dept_id, Dept_name, managername, headquaters)
VALUES
(1, 'HR', 'John Doe', 'New York'),
(2, 'Finance', 'Jane Smith', 'Los Angeles'),
(3, 'IT', 'Bob Johnson', 'Chicago'),
(4, 'Marketing', 'Alice Brown', 'San Francisco'),
(5, 'Sales', 'Charlie Davis', 'Miami');
SELECT * FROM DEPARTMENTS;



create table employees(
Emp_id int primary key,
EmpName VARCHAR(50),
age int,
deptId int,
foreign key(deptId) references DEPARTMENTS(Dept_id)
);
select * from employees
 
DROP TABLE employees;

INSERT INTO employees (Emp_id, EmpName, age, deptId)
VALUES
(101, 'peter', 30, 1),
(102, 'suman', 28, 5),
(103, 'Bob', 35, 2),
(104, 'aman', 32, 1),
(105, 'shahid', 29, 3),
(106, 'manoj', 31, 4),
(107, 'Miller', 33, 2),
(108, 'Taylor', 27, 5);
SELECT * FROM employees

INSERT INTO employees (Emp_id, EmpName, age, deptId)
VALUES
(109, 'lb', 26, NULL),
(110, 'alice', 34, 3);

TRUNCATE TABLE employees;

SELECT e.empName, d.Dept_name, d.managername, d.headquaters
FROM employees e
INNER JOIN DEPARTMENTS d 
ON e.deptId = d.Dept_id;

select e.Emp_id, e.empname, d.Dept_name, d.managername, d.headquaters
from employees e
left join DEPARTMENTS d
on e.deptId=d.Dept_id;

SELECT e.Emp_id, e.empname,d.dept_Id, d.Dept_name, d.managername, d.headquaters
FROM employees e
RIGHT JOIN DEPARTMENTS d 
ON e.deptId = d.Dept_id;

SELECT e.Emp_id, e.empname,d.dept_Id, d.Dept_name, d.managername, d.headquaters
FROM employees e
FULL OUTER JOIN DEPARTMENTS d 
ON e.deptId = d.Dept_id;


--total employees in each department where age>25
SELECT d.dept_name, COUNT(e.Emp_id) AS total_employees
FROM employees e
INNER JOIN DEPARTMENTS d 
ON e.deptId = d.Dept_id
WHERE e.age > 25
GROUP BY d.dept_name
ORDER BY total_employees DESC;


--show only those departments which have more than 2 employees, age>25 and sorted alphabetically
SELECT d.dept_name, COUNT(e.Emp_id) AS total_employeesover25
FROM employees e    
INNER JOIN DEPARTMENTS d
ON e.deptId = d.Dept_id  
WHERE e.age >25
GROUP BY d.dept_name
HAVING COUNT(e.Emp_id) >=2  
ORDER BY d.dept_name ASC;


create table patients(
Patient_id int primary key,
Patient_name VARCHAR(50) NOT NULL,
city VARCHAR(50),
age int,
gender CHAR(1) CHECK(gender IN ('M','F'))
);
select * from patients  

DROP TABLE patients;

INSERT INTO patients (Patient_id, Patient_name,city, age, gender)
VALUES
(1, 'John','delhi',30, 'M'),
(2, 'Sima','mumbai',45, 'F'),
(3, 'Johnson','banglore',29, 'M'),
(4, 'Bob','chennai', 50, 'M'),
(5, 'lisa','gujrat', 33, 'F')

SELECT * FROM patients;

INSERT INTO patients (Patient_id, Patient_name,city, age, gender)
VALUES
(6, 'ravi mehta','delhi', 40, 'M'),
(7, 'anita','mumbai', 38, 'F'),
(8, 'geeta','delhi', 27, 'F');

CREATE TABLE Appointments(
Appointment_id INT PRIMARY KEY,
Patient_id INT,
doctor_name VARCHAR(50),
Appointment_date DATE,
city VARCHAR(50),
charges DECIMAL(10,2),
fee DECIMAL(10,2),
foreign key(Patient_id) references patients(Patient_id)
);
select * from Appointments

INSERT INTO Appointments (Appointment_id, Patient_id, doctor_name, Appointment_date, city, charges, fee)
VALUES
(1, 1, 'Dr. Smith', '2023-10-01', 'delhi', 500, 500),
(2, 3, 'Dr. peter', '2023-10-02', 'mumbai', 700, 700),
(3, 5, 'Dr. Brown', '2023-10-03', 'banglore', 600, 600),
(4, 2, 'Dr. Taylor', '2023-10-04', 'chennai', 800, 800),
(5, 1, 'Dr. Wilson', '2023-10-05', 'gujrat', 550, 550),
(6, 4, 'Dr. Lee', '2023-10-06', 'delhi', 750, 750),
(7, 2, 'Dr. White', '2023-10-07', 'mumbai', 650, 650),
(8, 5, 'Dr. Harris', '2023-10-08', 'banglore', 720, 720);    

SELECT * FROM Appointments;
SELECT* FROM patients;

--show all appointments where the appointment_id is an even number.
SELECT * FROM Appointments
WHERE Appointment_id % 2 = 0;
--show all appointments where the charges are greater than 600.
SELECT * FROM Appointments
    WHERE charges > 600;
--show all appointments where the city is 'delhi' or 'mumbai'.
SELECT * FROM Appointments
WHERE city IN ('delhi', 'mumbai');
--show all appointments where the appointment date is in the 2 October or 6 october 2023.
SELECT * FROM Appointments
WHERE Appointment_date IN ('2023-10-02', '2023-10-06'); 

--show all appointments where the fee is between 500 and 700.
SELECT * FROM Appointments
WHERE fee BETWEEN 500 AND 700;  
--find the appointments where the doctor's name is not 'dr. smith' and the charges are less than 700.
SELECT * FROM Appointments
WHERE doctor_name <> 'Dr. Smith' AND charges < 700;
--count how many patients are from the same city as 'ravi mehta
SELECT city, COUNT(*) AS patient_count
FROM patients
WHERE city = (SELECT city FROM patients WHERE Patient_name = 'ravi mehta')
GROUP BY city;
-- name all patients who leave in city as 'ravi mehta'
SELECT Patient_name
FROM patients
WHERE city = (SELECT city FROM patients WHERE Patient_name = 'ravi mehta');
-- name all patients  who leave in 'delhi' both columna in results
SELECT Patient_name, city
FROM patients
WHERE city = 'delhi';
--list the names, cities, and ages of all patients who have had at least one appointment.
SELECT p.Patient_name, p.city, p.age
FROM patients p
INNER JOIN Appointments a ON p.Patient_id = a.Patient_id;

--find the doctrs who has treated the heighest number of unique patients.
SELECT doctor_name, COUNT(DISTINCT Patient_id) AS unique_patient_count
FROM Appointments
GROUP BY doctor_name
ORDER BY unique_patient_count DESC
LIMIT 1;

--list the names of patients who have appointments with the doctor who charged the highest fee.
SELECT p.Patient_name
FROM patients p
INNER JOIN Appointments a ON p.Patient_id = a.Patient_id
WHERE a.fee = (SELECT MAX(fee) FROM Appointments);  

--suppose the appointments table was crieated without a foreign key linking to patients.now,add a foreign key constraint to ensure every patients_id in appointments must exist in patients table.
ALTER TABLE Appo
.
