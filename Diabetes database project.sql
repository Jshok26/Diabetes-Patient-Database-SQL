-- =============================================
--  DIABETES DATABASE
-- Complete SQL File with Tables, Sample Data, Views, and Queries
-- =============================================

CREATE DATABASE diabetes_project;
USE diabetes_project;

-- =============================================
-- TABLE CREATION (8 tables as per design)
-- =============================================

-- Table 1: Patients
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    age INT,
    ethnicity VARCHAR(45),
    early_onset_symptoms VARCHAR(45)
);

-- Table 2: Diabetes Type (lookup table)
CREATE TABLE diabetes_type (
    diabetes_type_id INT PRIMARY KEY AUTO_INCREMENT,
    diabetes_type VARCHAR(45)
);

-- Table 3: Medical History
CREATE TABLE medical_history (
    medical_history_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    family_history VARCHAR(45),
    history_pcos VARCHAR(45),
    blood_pressure VARCHAR(45),
    pre_gest_diabetes VARCHAR(45),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Table 4: Lifestyle Factors
CREATE TABLE lifestyle_factors (
    lifestyle_factors_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    exercise_levels VARCHAR(45),
    dietary_habits VARCHAR(45),
    smoking_status VARCHAR(45),
    alcohol_use VARCHAR(45),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Table 5: Lab Results
CREATE TABLE lab_results (
    lab_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    blood_glucose_levels VARCHAR(45),
    insulin_levels VARCHAR(45),
    cholesterol_levels VARCHAR(45),
    test_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Table 6: Medications
CREATE TABLE medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    medication_name VARCHAR(100),
    medication_type VARCHAR(45)
);

-- Table 7: Patient Diagnosis (links patients to diabetes types)
CREATE TABLE patient_diagnosis (
    diagnosis_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    diabetes_type_id INT,
    diagnosis_date DATE,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (diabetes_type_id) REFERENCES diabetes_type(diabetes_type_id)
);

-- Table 8: Patient Medication (links patients to medications)
CREATE TABLE patient_medication (
    patient_medication_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    medication_id INT,
    dosage VARCHAR(45),
    start_date DATE,
    is_active VARCHAR(3),  -- Use 'YES' or 'NO' for simplicity
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

-- =============================================
-- INSERT SAMPLE DATA (15 patients as shown above)
-- =============================================
-- =============================================
-- SAMPLE DATA FOR DIABETES DATABASE
-- =============================================

-- 1. PATIENTS TABLE (Demographic information only - ethical design)
INSERT INTO patients (patient_id, age, ethnicity, early_onset_symptoms) VALUES
(1, 45, 'Hispanic', 'Increased thirst and frequent urination'),
(2, 32, 'Asian', 'Unexplained weight loss'),
(3, 58, 'Caucasian', 'Blurred vision and fatigue'),
(4, 28, 'African American', 'No early symptoms - routine checkup'),
(5, 62, 'Caucasian', 'Slow healing wounds'),
(6, 39, 'Hispanic', 'Numbness in feet'),
(7, 51, 'Asian', 'Recurrent infections'),
(8, 44, 'African American', 'Increased hunger'),
(9, 67, 'Caucasian', 'Dry skin and itching'),
(10, 29, 'Hispanic', 'Frequent yeast infections'),
(11, 73, 'Asian', 'None - incidental finding'),
(12, 41, 'Caucasian', 'Fatigue and irritability'),
(13, 55, 'African American', 'Ketones in urine'),
(14, 38, 'Hispanic', 'Extreme thirst'),
(15, 49, 'Asian', 'Weight gain and fatigue');

-- 2. DIABETES_TYPE TABLE (Lookup table)
INSERT INTO diabetes_type (diabetes_type_id, diabetes_type) VALUES
(1, 'Type 1 Diabetes'),
(2, 'Type 2 Diabetes'),
(3, 'Gestational Diabetes'),
(4, 'Prediabetes'),
(5, 'Steroid-Induced Diabetes'),
(6, 'LADA (Latent Autoimmune Diabetes in Adults)'),
(7, 'Neonatal Diabetes Mellitus (NDM)'),
(8, 'Wolfram Syndrome');

-- 3. MEDICAL_HISTORY TABLE (Separated for privacy)
INSERT INTO medical_history (medical_history_id, patient_id, family_history, history_pcos, blood_pressure, pre_gest_diabetes) VALUES
(1, 1, 'Mother with Type 2', 'No', '130/85', 'No'),
(2, 2, 'Father with Type 1', 'No', '118/76', 'No'),
(3, 3, 'Both parents diabetic', 'No', '145/92', 'No'),
(4, 4, 'Grandmother only', 'Yes', '122/80', 'Yes'),
(5, 5, 'No family history', 'No', '138/88', 'No'),
(6, 6, 'Sibling with Type 2', 'No', '128/84', 'No'),
(7, 7, 'Mother and aunt', 'No', '135/86', 'No'),
(8, 8, 'No family history', 'Yes', '115/75', 'Yes'),
(9, 9, 'Father with Type 2', 'No', '142/90', 'No'),
(10, 10, 'Sibling with Type 1', 'No', '120/78', 'No'),
(11, 11, 'No family history', 'No', '150/95', 'No'),
(12, 12, 'Mother with Type 2', 'No', '125/82', 'No'),
(13, 13, 'Both parents', 'No', '140/88', 'No'),
(14, 14, 'No family history', 'Yes', '128/79', 'Yes'),
(15, 15, 'Father only', 'No', '135/84', 'No');

-- 4. LIFESTYLE_FACTORS TABLE (Separated for role-based access)
INSERT INTO lifestyle_factors (lifestyle_factors_id, patient_id, exercise_levels, dietary_habits, smoking_status, alcohol_use) VALUES
(1, 1, 'Moderate', 'Balanced diet', 'Non-smoker', 'Occasional'),
(2, 2, 'Low', 'High carbohydrate', 'Non-smoker', 'None'),
(3, 3, 'Sedentary', 'High fat/sugar', 'Former smoker', 'Moderate'),
(4, 4, 'High', 'Mediterranean diet', 'Non-smoker', 'Occasional'),
(5, 5, 'Low', 'Processed foods', 'Current smoker', 'Heavy'),
(6, 6, 'Moderate', 'Balanced', 'Non-smoker', 'Occasional'),
(7, 7, 'Sedentary', 'Fast food', 'Current smoker', 'Moderate'),
(8, 8, 'High', 'Vegetarian', 'Non-smoker', 'None'),
(9, 9, 'Low', 'High sugar', 'Former smoker', 'Moderate'),
(10, 10, 'Moderate', 'Balanced', 'Non-smoker', 'Occasional'),
(11, 11, 'Sedentary', 'Low fiber', 'Non-smoker', 'None'),
(12, 12, 'Moderate', 'Balanced', 'Non-smoker', 'Occasional'),
(13, 13, 'Low', 'High fat', 'Current smoker', 'Heavy'),
(14, 14, 'High', 'Plant-based', 'Non-smoker', 'None'),
(15, 15, 'Moderate', 'Mixed diet', 'Non-smoker', 'Occasional');

-- 5. LAB_RESULTS TABLE (Clinical data)
INSERT INTO lab_results (lab_id, patient_id, blood_glucose_levels, insulin_levels, cholesterol_levels, test_date) VALUES
(1, 1, '145 mg/dL', '12 µU/mL', '210 mg/dL', '2024-01-15'),
(2, 2, '168 mg/dL', '8 µU/mL', '195 mg/dL', '2024-01-20'),
(3, 3, '210 mg/dL', '15 µU/mL', '245 mg/dL', '2024-01-10'),
(4, 4, '95 mg/dL', '18 µU/mL', '180 mg/dL', '2024-01-25'),
(5, 5, '185 mg/dL', '10 µU/mL', '230 mg/dL', '2024-01-18'),
(6, 6, '156 mg/dL', '11 µU/mL', '205 mg/dL', '2024-01-22'),
(7, 7, '198 mg/dL', '9 µU/mL', '225 mg/dL', '2024-01-12'),
(8, 8, '102 mg/dL', '20 µU/mL', '175 mg/dL', '2024-01-28'),
(9, 9, '225 mg/dL', '7 µU/mL', '260 mg/dL', '2024-01-08'),
(10, 10, '130 mg/dL', '14 µU/mL', '190 mg/dL', '2024-01-30'),
(11, 1, '138 mg/dL', '13 µU/mL', '208 mg/dL', '2024-02-15'),
(12, 2, '160 mg/dL', '9 µU/mL', '198 mg/dL', '2024-02-20'),
(13, 5, '178 mg/dL', '11 µU/mL', '228 mg/dL', '2024-02-18'),
(14, 7, '190 mg/dL', '10 µU/mL', '222 mg/dL', '2024-02-12'),
(15, 9, '215 mg/dL', '8 µU/mL', '255 mg/dL', '2024-02-08');

-- 6. MEDICATIONS TABLE
INSERT INTO medications (medication_id, medication_name, medication_type) VALUES
(1, 'Metformin', 'Biguanide'),
(2, 'Insulin Glargine', 'Long-acting Insulin'),
(3, 'Glipizide', 'Sulfonylurea'),
(4, 'Jardiance', 'SGLT2 Inhibitor'),
(5, 'Ozempic', 'GLP-1 Agonist'),
(6, 'Prednisone', 'Corticosteroid'),
(7, 'Humalog', 'Rapid-acting Insulin'),
(8, 'Januvia', 'DPP-4 Inhibitor');

-- 7. PATIENT_DIAGNOSIS TABLE (Junction table)
INSERT INTO patient_diagnosis (diagnosis_id, patient_id, diabetes_type_id, diagnosis_date, notes) VALUES
(1, 1, 2, '2023-06-15', 'Patient responds well to Metformin'),
(2, 2, 1, '2023-08-20', 'Requires insulin therapy'),
(3, 3, 2, '2022-11-10', 'Poor diet adherence'),
(4, 4, 4, '2024-01-05', 'Early intervention recommended'),
(5, 5, 2, '2021-03-25', 'High cholesterol comorbidity'),
(6, 6, 5, '2023-10-12', 'Steroid-induced from asthma treatment'),
(7, 7, 2, '2022-09-18', 'Smoking cessation advised'),
(8, 8, 4, '2024-02-01', 'Lifestyle modification working'),
(9, 9, 2, '2020-05-30', 'Severe case requiring multiple medications'),
(10, 10, 1, '2023-12-10', 'Newly diagnosed young adult'),
(11, 11, 2, '2019-08-22', 'Long-term management patient'),
(12, 12, 6, '2023-07-14', 'LADA - slow progression'),
(13, 13, 2, '2021-11-05', 'Family history strong factor'),
(14, 14, 3, '2024-01-20', 'Gestational - monitoring required'),
(15, 15, 4, '2024-02-10', 'Prevention program enrolled');

-- 8. PATIENT_MEDICATION TABLE (Junction table for prescriptions)
INSERT INTO patient_medication (patient_medication_id, patient_id, medication_id, dosage, start_date, is_active) VALUES
(1, 1, 1, '500mg twice daily', '2023-06-20', TRUE),
(2, 2, 2, '10 units at bedtime', '2023-08-25', TRUE),
(3, 3, 1, '1000mg twice daily', '2022-12-01', TRUE),
(4, 3, 4, '10mg daily', '2023-03-15', TRUE),
(5, 5, 1, '500mg twice daily', '2021-04-01', TRUE),
(6, 5, 8, '100mg daily', '2021-04-01', TRUE),
(7, 6, 6, '5mg daily', '2023-10-15', FALSE),
(8, 7, 3, '5mg daily', '2022-10-01', TRUE),
(9, 9, 2, '20 units at bedtime', '2020-06-10', TRUE),
(10, 9, 5, '0.5mg weekly', '2023-01-20', TRUE),
(11, 10, 7, '5 units with meals', '2023-12-15', TRUE),
(12, 11, 1, '850mg twice daily', '2019-09-01', TRUE),
(13, 12, 1, '500mg daily', '2023-08-01', TRUE),
(14, 13, 2, '15 units at bedtime', '2021-12-01', TRUE),
(15, 14, 1, '500mg twice daily', '2024-01-25', TRUE);



-- =============================================
-- STEP 4: CREATE VIEWS (for Requirement B)
-- =============================================

-- View 1: Complete patient profile
CREATE VIEW patient_profile AS
SELECT 
    p.patient_id,
    p.age,
    p.ethnicity,
    dt.diabetes_type,
    pd.diagnosis_date,
    mh.family_history,
    mh.blood_pressure,
    lf.exercise_levels,
    lf.smoking_status,
    lr.blood_glucose_levels,
    lr.cholesterol_levels
FROM patients p
LEFT JOIN patient_diagnosis pd ON p.patient_id = pd.patient_id
LEFT JOIN diabetes_type dt ON pd.diabetes_type_id = dt.diabetes_type_id
LEFT JOIN medical_history mh ON p.patient_id = mh.patient_id
LEFT JOIN lifestyle_factors lf ON p.patient_id = lf.patient_id
LEFT JOIN lab_results lr ON p.patient_id = lr.patient_id;

-- View 2: High risk patients
CREATE VIEW high_risk_patients AS
SELECT 
    p.patient_id,
    p.age,
    p.ethnicity,
    lr.blood_glucose_levels,
    lf.smoking_status,
    mh.family_history
FROM patients p
JOIN lab_results lr ON p.patient_id = lr.patient_id
JOIN lifestyle_factors lf ON p.patient_id = lf.patient_id
JOIN medical_history mh ON p.patient_id = mh.patient_id
WHERE lr.blood_glucose_levels > 180;

-- View 3: Medication summary
CREATE VIEW medication_summary AS
SELECT 
    m.medication_name,
    m.medication_type,
    COUNT(pm.patient_id) AS number_of_patients
FROM medications m
LEFT JOIN patient_medication pm ON m.medication_id = pm.medication_id
GROUP BY m.medication_id, m.medication_name, m.medication_type;

-- View 4: Diabetes type statistics
CREATE VIEW diabetes_stats AS
SELECT 
    dt.diabetes_type,
    COUNT(pd.patient_id) AS patient_count,
    ROUND(AVG(p.age), 1) AS average_age
FROM diabetes_type dt
LEFT JOIN patient_diagnosis pd ON dt.diabetes_type_id = pd.diabetes_type_id
LEFT JOIN patients p ON pd.patient_id = p.patient_id
GROUP BY dt.diabetes_type_id, dt.diabetes_type;

-- View 5: Active prescriptions
CREATE VIEW active_prescriptions AS
SELECT 
    p.patient_id,
    p.age,
    m.medication_name,
    pm.dosage,
    pm.start_date
FROM patients p
JOIN patient_medication pm ON p.patient_id = pm.patient_id
JOIN medications m ON pm.medication_id = m.medication_id
WHERE pm.is_active = 'YES';

-- =============================================
--  Complex QUERIES (for Requirement A)
-- =============================================

-- Query 1: List all patients with their diabetes type
SELECT 
    p.patient_id,
    p.age,
    p.ethnicity,
    dt.diabetes_type
FROM patients p
JOIN patient_diagnosis pd ON p.patient_id = pd.patient_id
JOIN diabetes_type dt ON pd.diabetes_type_id = dt.diabetes_type_id;

-- Query 2: Find patients with high blood glucose (> 180)
SELECT 
    p.patient_id,
    p.age,
    lr.blood_glucose_levels,
    lr.test_date
FROM patients p
JOIN lab_results lr ON p.patient_id = lr.patient_id
WHERE lr.blood_glucose_levels > 180
ORDER BY lr.blood_glucose_levels DESC;

-- Query 3: Count patients by ethnicity
SELECT 
    ethnicity,
    COUNT(*) AS total_patients
FROM patients
GROUP BY ethnicity
ORDER BY total_patients DESC;

-- Query 4: Show patients who smoke and have high blood pressure
SELECT 
    p.patient_id,
    p.age,
    lf.smoking_status,
    mh.blood_pressure
FROM patients p
JOIN lifestyle_factors lf ON p.patient_id = lf.patient_id
JOIN medical_history mh ON p.patient_id = mh.patient_id
WHERE lf.smoking_status = 'Current smoker'
  AND mh.blood_pressure > '130/80';

-- Query 5: Average age by diabetes type
SELECT 
    dt.diabetes_type,
    ROUND(AVG(p.age), 1) AS average_age,
    COUNT(p.patient_id) AS number_of_patients
FROM diabetes_type dt
JOIN patient_diagnosis pd ON dt.diabetes_type_id = pd.diabetes_type_id
JOIN patients p ON pd.patient_id = p.patient_id
GROUP BY dt.diabetes_type;

-- Query 6: Show patients and their prescribed medications
SELECT
    p.patient_id,
    p.age,
    m.medication_name,
    m.medication_type,
    pm.dosage
FROM patients p
JOIN patient_medication pm 
    ON p.patient_id = pm.patient_id
JOIN medications m 
    ON pm.medication_id = m.medication_id;

-- Query 7: Average age by diabetes type for patients older than 30
SELECT
    dt.diabetes_type,
    AVG(p.age) AS avg_age
FROM patients p
JOIN patient_diagnosis pd
    ON p.patient_id = pd.patient_id
JOIN diabetes_type dt
    ON pd.diabetes_type_id = dt.diabetes_type_id
WHERE p.age > 30
GROUP BY dt.diabetes_type
HAVING AVG(p.age) > 40;

-- =============================================
-- STEP 6: VERIFY EVERYTHING WORKS
-- =============================================

-- Check all tables have data
SELECT 'patients' AS table_name, COUNT(*) AS `rows` FROM patients
UNION ALL 
SELECT 'diabetes_type', COUNT(*) FROM diabetes_type
UNION ALL 
SELECT 'medical_history', COUNT(*) FROM medical_history
UNION ALL 
SELECT 'lifestyle_factors', COUNT(*) FROM lifestyle_factors
UNION ALL 
SELECT 'lab_results', COUNT(*) FROM lab_results
UNION ALL 
SELECT 'medications', COUNT(*) FROM medications
UNION ALL 
SELECT 'patient_diagnosis', COUNT(*) FROM patient_diagnosis
UNION ALL 
SELECT 'patient_medication', COUNT(*) FROM patient_medication;

-- Show all views
SELECT * FROM patient_profile LIMIT 5;
SELECT * FROM high_risk_patients;
SELECT * FROM medication_summary;
SELECT * FROM diabetes_stats;
SELECT * FROM active_prescriptions;