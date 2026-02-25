CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;

# ------ Patients ------
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(25),
    dob DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(10),
    email VARCHAR(50),
    address VARCHAR(100),
    registration_date DATE
);

# ------ Doctors ------
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(25),
    specialization VARCHAR(100),
    phone_number VARCHAR(10),
    email VARCHAR(50),
    consultation_fee DECIMAL(10,2),
    experience_years INT
);

# ------ Departments ------
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

# ------ Doctor_Department (Mapping)------
CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

# ------ Appointments------
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

# ------Medical Records------
CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(200),
    prescription VARCHAR(200),
    treatment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

# ------ Billing------
CREATE TABLE Billing (
    invoice_id INT PRIMARY KEY,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Patients VALUES
(1,'Amit Shah','1998-02-10','Male','9876543210','amit@gmail.com','Ahmedabad','2024-01-10'),
(2,'Neha Patel','1999-05-12','Female','9876543211','neha@gmail.com','Surat','2024-02-15'),
(3,'Rahul Mehta','1997-03-21','Male','9876543212','rahul@gmail.com','Vadodara','2024-03-10'),
(4,'Priya Desai','2000-07-01','Female','9876543213','priya@gmail.com','Rajkot','2024-01-25'),
(5,'Karan Joshi','1995-08-11','Male','9876543214','karan@gmail.com','Bhavnagar','2023-12-20'),
(6,'Riya Sharma','2001-11-23','Female','9876543215','riya@gmail.com','Delhi','2024-02-05'),
(7,'Arjun Verma','1996-06-19','Male','9876543216','arjun@gmail.com','Jaipur','2023-11-15'),
(8,'Sneha Rao','1999-09-09','Female','9876543217','sneha@gmail.com','Mumbai','2024-03-01'),
(9,'Vikram Singh','1994-04-18','Male','9876543218','vikram@gmail.com','Indore','2024-01-05'),
(10,'Anjali Gupta','2002-12-02','Female','9876543219','anjali@gmail.com','Pune','2024-02-20');

INSERT INTO Doctors VALUES
(1,'Dr. Mehul','Cardiology','9000000001','mehul@hosp.com',1200,12),
(2,'Dr. Rakesh','Neurology','9000000002','rakesh@hosp.com',1500,10),
(3,'Dr. Nisha','Dermatology','9000000003','nisha@hosp.com',800,6),
(4,'Dr. Kunal','Orthopedic','9000000004','kunal@hosp.com',1100,14),
(5,'Dr. Rina','Pediatrics','9000000005','rina@hosp.com',700,8),
(6,'Dr. Sanjay','ENT','9000000006','sanjay@hosp.com',600,5),
(7,'Dr. Alok','Cardiology','9000000007','alok@hosp.com',1300,16),
(8,'Dr. Pooja','Gynecology','9000000008','pooja@hosp.com',900,7),
(9,'Dr. Aman','General','9000000009','aman@hosp.com',500,3),
(10,'Dr. Neeraj','Neurology','9000000010','neeraj@hosp.com',1400,11);

INSERT INTO Departments VALUES
(1,'Cardiology'),(2,'Neurology'),(3,'Dermatology'),
(4,'Orthopedic'),(5,'Pediatrics'),(6,'ENT'),(7,'Gynecology'),(8,'General');

INSERT INTO Doctor_Department VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,1),(8,7),(9,8),(10,2);

INSERT INTO Appointments VALUES
(1,1,1,'2024-03-01','Completed'),
(2,2,2,'2024-03-02','Scheduled'),
(3,3,3,'2024-02-20','Completed'),
(4,4,4,'2024-02-15','Cancelled'),
(5,5,5,'2024-01-10','Completed'),
(6,6,6,'2024-03-03','Scheduled'),
(7,7,7,'2024-02-01','Completed'),
(8,8,8,'2024-01-20','Completed'),
(9,9,9,'2024-03-05','Scheduled'),
(10,10,10,'2024-02-10','Completed'),
(14, 2, 1, '2024-03-06', 'Completed'),
(15, 3, 1, '2024-03-07', 'Completed'),
(16, 4, 1, '2024-03-08', 'Completed'),
(17, 5, 1, '2024-03-09', 'Completed'),
(18, 6, 1, '2024-03-10', 'Completed');

INSERT INTO Medical_Records VALUES
(1,1,1,'Heart Pain','Medicine A','2024-03-01'),
(2,2,2,'Migraine','Medicine B','2024-03-02'),
(3,3,3,'Skin Allergy','Cream','2024-02-20'),
(4,4,4,'Fracture','Physio','2024-02-15'),
(5,5,5,'Fever','Syrup','2024-01-10'),
(6,6,6,'Ear Infection','Drops','2024-03-03'),
(7,7,7,'Chest Pain','ECG','2024-02-01'),
(8,8,8,'Pregnancy Check','Vitamins','2024-01-20'),
(9,9,9,'Cold','Tablet','2024-03-05'),
(10,10,10,'Headache','Painkiller','2024-02-10');

INSERT INTO Billing VALUES
(1,1,1,1200,'Paid','2024-03-01'),
(2,2,2,1500,'Pending',NULL),
(3,3,3,800,'Paid','2024-02-20'),
(4,4,4,1100,'Cancelled',NULL),
(5,5,5,700,'Paid','2024-01-10'),
(6,6,6,600,'Pending',NULL),
(7,7,7,1300,'Paid','2024-02-01'),
(8,8,8,900,'Paid','2024-01-20'),
(9,9,9,500,'Pending',NULL),
(10,10,10,1400,'Paid','2024-02-10');

SELECT * FROM Patients;

SELECT * FROM Doctors;

SELECT * FROM Departments;

SELECT * FROM Appointments;

SELECT * FROM Medical Records;

SELECT * FROM Billing;


# 1.------ CRUD ------

-- Insert new patient
INSERT INTO Patients (patient_id, name, dob, gender, phone_number, email, address, registration_date)
VALUES (13, 'Rohit Kumar', '1999-04-15', 'Male', '9898989898', 'rohit@gmail.com', 'Ahmedabad', CURDATE());

SELECT * FROM Patients;

-- Insert new doctor
INSERT INTO Doctors (doctor_id, name, specialization, phone_number, email, consultation_fee, experience_years)
VALUES (11, 'Dr. Suresh', 'Cardiology', '9000000011', 'suresh@hospital.com', 1800, 9);

SELECT * FROM Doctors;

-- Insert new appointment
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, status)
VALUES (11, 11, 11, CURDATE(), 'Scheduled');

SELECT * FROM Appointments;

UPDATE Patients
SET address = 'Maninagar, Ahmedabad'
WHERE patient_id = 1;
SELECT * FROM Patients;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Appointments
WHERE status = 'Cancelled'
  AND appointment_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SET SQL_SAFE_UPDATES = 1;  


# 2.------ WHERE,HAVING,LIMIT ------

SELECT * FROM Patients WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

#  HAVING
SELECT patient_id, SUM(amount) AS total_paid FROM Billing GROUP BY patient_id ORDER BY total_paid DESC LIMIT 5;

# LIMIT
SELECT * FROM Doctors WHERE consultation_fee > 1000;

# 3.------ AND,OR,NOT ------

# AND
SELECT * FROM Appointments WHERE status='Scheduled' AND doctor_id=3;

# OR
SELECT * FROM Doctors WHERE specialization='Cardiology' OR specialization='Neurology';

# NOT
SELECT * FROM Patients WHERE patient_id NOT IN (SELECT patient_id FROM Appointments WHERE appointment_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR));

# 4.------ ORDER BY , GROUP BY ------

SELECT * FROM Doctors ORDER BY specialization;

SELECT doctor_id, COUNT(*) AS total_patients FROM Appointments GROUP BY doctor_id;

# GROUP BY
SELECT d.department_name, SUM(b.amount) FROM Billing b
JOIN Appointments a ON b.appointment_id=a.appointment_id
JOIN Doctor_Department dd ON a.doctor_id=dd.doctor_id
JOIN Departments d ON dd.department_id=d.department_id
GROUP BY d.department_name;

# 5.------ AGGREGATE FUNCTIONS ------

SELECT SUM(amount) AS total_revenue FROM Billing WHERE payment_status='Paid';
SELECT doctor_id, COUNT(*) AS visits FROM Appointments GROUP BY doctor_id ORDER BY visits DESC LIMIT 1;
SELECT AVG(consultation_fee) FROM Doctors;

# 7.------ JOINS ------

# ----INNER JOIN----
SELECT d.doctor_id, d.name AS doctor_name, dep.department_name
FROM Doctors d
INNER JOIN Doctor_Department dd ON d.doctor_id = dd.doctor_id
INNER JOIN Departments dep ON dd.department_id = dep.department_id;

# -----LEFT JOIN-----
SELECT p.patient_id, p.name, a.appointment_date, a.status
FROM Patients p
LEFT JOIN Appointments a 
ON p.patient_id = a.patient_id
WHERE a.status = 'Completed';

# ----- RIGHT JOIN-----
SELECT a.appointment_id, a.appointment_date, b.payment_status
FROM Billing b
RIGHT JOIN Appointments a
ON b.appointment_id = a.appointment_id
WHERE b.appointment_id IS NULL;

#-----FULL OUTER JOIN-----

SELECT p.patient_id, p.name
FROM Patients p
LEFT JOIN Appointments a 
ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

# 8.------ SUBQUERIES ------
SELECT d.doctor_id, d.name AS doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM Appointments a
JOIN Doctors d 
ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.name
HAVING COUNT(a.appointment_id) > 5;

SELECT patient_id FROM Billing GROUP BY patient_id ORDER BY SUM(amount) DESC LIMIT 1;
SELECT * FROM Appointments WHERE doctor_id IN (SELECT doctor_id FROM Doctors WHERE specialization='Dermatology');

# 9.------ DATE FUNCTIONS ------

SELECT MONTH(appointment_date), COUNT(*) FROM Appointments GROUP BY MONTH(appointment_date);

SELECT DATEDIFF('2024-03-10','2024-03-01') AS stay_days;

SELECT DATE_FORMAT(treatment_date,'%d-%m-%Y') FROM Medical_Records;

# 10.------ STRING FUNCTIONS ------

SELECT UPPER(name) FROM Patients;

SELECT TRIM(name) FROM Doctors;

SELECT IFNULL(phone_number,'Not Available') FROM Patients;

# 11.------ WINDOW FUNCTIONS ------

SELECT doctor_id, COUNT(*) AS total_visits,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_no
FROM Appointments GROUP BY doctor_id;

SELECT payment_date, SUM(amount) OVER (ORDER BY payment_date) AS running_revenue FROM Billing;

SELECT appointment_date, COUNT(*) OVER (ORDER BY appointment_date) AS running_appointments FROM Appointments;

# 12.------ CASE EXPRESSION ------

SELECT p.patient_id,
CASE
 WHEN COUNT(m.record_id) > 5 THEN 'High'
 WHEN COUNT(m.record_id) BETWEEN 3 AND 5 THEN 'Medium'
 ELSE 'Low'
END AS Patient_Risk_Level
FROM Patients p
LEFT JOIN Medical_Records m ON p.patient_id=m.patient_id
GROUP BY p.patient_id;
  