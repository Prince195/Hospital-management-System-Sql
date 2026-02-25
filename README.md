# 🏥 Hospital Management System – SQL Project

## 📌 Project Overview

The **Hospital Management System** is a relational database project designed using **MySQL** to manage core hospital operations such as patients, doctors, departments, appointments, medical records, and billing. This system demonstrates practical usage of **SQL concepts** including CRUD operations, joins, subqueries, aggregate functions, date & time functions, string functions, and window functions.

This project is suitable for **college mini-projects, SQL practice, and portfolio/GitHub submission**.

---

## 🎯 Objectives

* To design a normalized relational database for hospital operations
* To perform **Create, Read, Update, Delete (CRUD)** operations
* To implement **Joins** for meaningful data retrieval
* To use **Subqueries** for advanced filtering
* To apply **Aggregate Functions** for analytics
* To work with **Date & Time functions**
* To demonstrate **String functions**
* To use **Window functions** for ranking and running totals

---

## 🗂️ Database Schema

### 🔹 Tables Used

* **Patients** – Stores patient details
* **Doctors** – Stores doctor information
* **Departments** – Hospital departments
* **Doctor_Department** – Mapping doctors to departments
* **Appointments** – Appointment details
* **Medical_Records** – Diagnosis & treatment info
* **Billing** – Payment and billing information

### 🔗 Relationships

* One **Doctor** can belong to one **Department**
* One **Patient** can have multiple **Appointments**
* Each **Appointment** is linked to one **Doctor** and one **Patient**
* Each **Appointment** can have one **Billing record**

---

## ⚙️ Technologies Used

* **Database:** MySQL
* **Tool:** MySQL Workbench / phpMyAdmin
* **Language:** SQL

---

## 🛠️ Features Implemented

### ✅ 1. CRUD Operations

* Insert new patients, doctors, and appointments
* Update patient details
* Delete old or cancelled appointments

### ✅ 2. Filtering & Conditions

* WHERE clause
* AND, OR, NOT operators
* LIMIT clause

### ✅ 3. Sorting & Grouping

* ORDER BY for sorting results
* GROUP BY with HAVING clause

### ✅ 4. Aggregate Functions

* `SUM()` – Total revenue
* `COUNT()` – Number of appointments per doctor
* `AVG()` – Average consultation fee

### ✅ 5. Joins

* INNER JOIN – Doctors with Departments
* LEFT JOIN – Patients with completed appointments
* RIGHT JOIN – Appointments without billing
* Alternative logic for FULL OUTER JOIN in MySQL

### ✅ 6. Subqueries

* Doctors handling maximum patients
* Patient with highest billing
* Appointments with Dermatology specialists

### ✅ 7. Date & Time Functions

* Extract month from appointment dates
* Format treatment dates
* Calculate durations

### ✅ 8. String Functions

* Convert patient names to uppercase
* Trim doctor names
* Replace NULL phone numbers with default values

### ✅ 9. Window Functions (MySQL 8+)

* Rank doctors by number of patients
* Calculate cumulative revenue
* Running total of appointments

---

## 📊 Sample Queries (Examples)

```sql
-- Doctors with their departments
SELECT d.name AS doctor_name, dep.department_name
FROM Doctors d
JOIN Doctor_Department dd ON d.doctor_id = dd.doctor_id
JOIN Departments dep ON dd.department_id = dep.department_id;
```

```sql
-- Total revenue from paid bills
SELECT SUM(amount) AS total_revenue
FROM Billing
WHERE payment_status = 'Paid';
```

```sql
-- Rank doctors by appointments
SELECT 
    d.name,
    COUNT(a.appointment_id) AS total_patients,
    RANK() OVER (ORDER BY COUNT(a.appointment_id) DESC) AS rank_no
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.name;
```

---

## 📈 Learning Outcomes

By completing this project, I learned:

* How to design relational databases
* How to apply normalization concepts
* How to write complex SQL queries
* How joins and subqueries work in real-world databases
* How to perform analytical queries using window functions
* How hospital workflows can be modeled using database systems

---

## 🚀 How to Run the Project

1. Create database in MySQL
2. Run all `CREATE TABLE` queries
3. Insert sample data
4. Execute SQL queries to test outputs
5. Verify results in MySQL Workbench
