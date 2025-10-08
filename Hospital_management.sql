DROP TABLE IF EXISTS Hospital_Data;

CREATE TABLE Hospital_Data(
Hospital_Name VARCHAR(150) NOT NULL,
Location VARCHAR(150) NOT NULL,
Department  VARCHAR(150) NOT NULL,
Doctors_Count INT,
Patients_Count INT,
Admission_Date DATE,
Discharge_Date DATE,
Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM Hospital_Data;

--1) Total number of patients

SELECT SUM(patients_count) AS Total_patients
FROM Hospital_Data;

--2) Average number of doctors per hospital

SELECT AVG(doctors_count) AS avg_doc_count
FROM Hospital_Data;

--3) Top 3 departments with  the highest number of patients

SELECT department,patients_count AS Patient_number
FROM Hospital_Data
ORDER BY patients_count DESC
LIMIT 3;

--4) Hospital with the maximum medical expenses

SELECT * FROM Hospital_Data;

SELECT hospital_name,medical_expenses
FROM Hospital_Data
ORDER BY medical_expenses DESC
LIMIT 1;

--5) Daily Average medical expense

SELECT AVG(medical_expenses) 
AS avg_med_expenses_per_day
FROM Hospital_Data;

--6) Longest Hospital Stay 

SELECT
    hospital_name,location,department,admission_date,discharge_date,
     (discharge_date - admission_date) AS Stay_Duration_in_days
FROM Hospital_Data
ORDER BY Stay_Duration_in_days DESC
LIMIT 1;


--7) Total Patients Treated Per City 

SELECT * FROM Hospital_Data;

SELECT 
location,SUM(patients_count) AS total_patients_treated_per_city
FROM Hospital_Data
GROUP BY location
ORDER BY total_patients_treated_per_city DESC


--8) Average Length of Stay Per Department 

SELECT department,AVG(discharge_date-admission_date) AS avg_stay_duration
FROM Hospital_Data
GROUP BY department
ORDER BY avg_stay_duration DESC


--9) Identify the Department with the Lowest Number of Patients 
SELECT * FROM Hospital_Data;

SELECT department, SUM(patients_count) AS number_of_patients
FROM Hospital_Data
GROUP BY department
ORDER BY number_of_patients ASC
LIMIT 1;


--10) Monthly Medical Expenses Report 
SELECT * FROM Hospital_Data;

SELECT  hospital_name, TO_CHAR(admission_date, 'YYYY-MM') AS month, SUM(medical_expenses) AS total_expenses
FROM Hospital_Data
GROUP BY hospital_name, TO_CHAR(admission_date, 'YYYY-MM')
ORDER BY month, total_expenses DESC;


   
   





    
    



