# Diabetes Patient Database | SQL Project

## Project Overview

This project involves the design and implementation of a relational database using MySQL to organize and analyze diabetes patient information. The database stores information about patient demographics, medical history, lifestyle factors, laboratory results, diagnoses, and medications.

The purpose of this project is to demonstrate SQL programming, relational database design, data management, and analytical querying techniques within a healthcare-related context.

## Technologies Used

- **MySQL** – Relational database management
- **SQL** – Database creation, data manipulation, and querying
- **MySQL Workbench** – Database development and management

## Database Structure

The database consists of eight interconnected tables:

1. **Patients** – Stores patient demographics and early symptoms.
2. **Diabetes Type** – Contains different diabetes classifications.
3. **Medical History** – Records family history, blood pressure, and relevant medical conditions.
4. **Lifestyle Factors** – Stores exercise levels, dietary habits, smoking status, and alcohol use.
5. **Lab Results** – Contains blood glucose, insulin, and cholesterol measurements.
6. **Medications** – Stores medication names and classifications.
7. **Patient Diagnosis** – Connects patients to their diabetes diagnoses.
8. **Patient Medication** – Tracks patient prescriptions, dosages, and medication status.

Primary and foreign keys establish relationships between tables and support relational data integrity.

## SQL Features Demonstrated

- Database and table creation using `CREATE DATABASE` and `CREATE TABLE`
- Primary and foreign key relationships
- Data insertion using `INSERT INTO`
- Multi-table queries using `INNER JOIN` and `LEFT JOIN`
- Data filtering using `WHERE`
- Aggregation using `COUNT()` and `AVG()`
- Data grouping using `GROUP BY` and `HAVING`
- Sorting using `ORDER BY`
- Creating reusable database views using `CREATE VIEW`

## Data Analysis and Queries

The project includes SQL queries designed to retrieve and summarize patient information, including:

- Identifying patients with elevated blood glucose measurements
- Calculating average patient age by diabetes type
- Examining patient demographics
- Retrieving medication and prescription information
- Identifying patients based on lifestyle and medical history factors

The database also includes five views for organizing patient profiles, medication summaries, diabetes statistics, active prescriptions, and potentially high-risk patient records.

## Dataset

The project includes a small sample dataset containing 15 patient profiles, along with related medical history, diagnoses, lifestyle information, laboratory results, and medication records.

The dataset is intended to demonstrate relational database functionality and SQL querying rather than support real-world clinical conclusions.

## How to Run

1. Install MySQL and MySQL Workbench.
2. Download the `diabetes_database.sql` file from this repository.
3. Open the SQL file in MySQL Workbench.
4. Execute the script to create the database and populate the tables.
5. Run the included SQL queries to explore the data.

## Skills Demonstrated

- Relational database design
- SQL programming
- Data organization and retrieval
- Database relationships and referential integrity
- Analytical querying
- Healthcare data management concepts

## Future Improvements

- Expand the dataset for more comprehensive analysis.
- Improve data validation and consistency.
- Integrate Python for additional data analysis.
- Develop visualizations using Power BI or Python.
- Explore statistical relationships between patient characteristics and diabetes classifications.
