-- ============================================
-- File: data.sql
-- Sample data for demo, testing, and analysis
-- ============================================

-- Patients
INSERT INTO Patients VALUES
(1, 'John', 'Doe', '1990-03-15', 'Male', '2105551234', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '1985-08-22', 'Female', '2105552345', 'jane.smith@example.com'),
(3, 'Emily', 'Davis', '1993-12-01', 'Female', '2105553456', 'emily.davis@example.com'),
(4, 'Michael', 'Brown', '1980-07-09', 'Male', '2105554567', 'michael.brown@example.com'),
(5, 'Sarah', 'Wilson', '2000-04-17', 'Female', '2105555678', 'sarah.wilson@example.com');

-- Departments
INSERT INTO Departments VALUES
(1, 'Cardiology'),
(2, 'Pediatrics'),
(3, 'Dermatology');

-- Doctors
INSERT INTO Doctors VALUES
(101, 'Alice', 'Johnson', 'Cardiologist', '2105551111', 'alice.johnson@hospital.com', 1),
(102, 'David', 'Lee', 'Pediatrician', '2105552222', 'david.lee@hospital.com', 2),
(103, 'Laura', 'Martinez', 'Dermatologist', '2105553333', 'laura.martinez@hospital.com', 3);

-- Appointments
INSERT INTO Appointments VALUES
(1001, 1, 101, '2025-04-05', 'Chest pain', 'Completed'),
(1002, 2, 102, '2025-04-06', 'Routine checkup', 'Completed'),
(1003, 3, 103, '2025-04-07', 'Skin rash', 'Scheduled'),
(1004, 4, 101, '2025-04-08', 'Heart palpitations', 'Scheduled');

-- Medical Records
INSERT INTO MedicalRecords VALUES
(201, 1, 'Hypertension', 'Lifestyle changes, medication', '2025-04-05'),
(202, 2, 'Healthy', 'Routine advice', '2025-04-06'),
(203, 3, 'Eczema', 'Topical creams', '2025-04-07');

-- Prescriptions
INSERT INTO Prescriptions VALUES
(301, 1, 101, 'Lisinopril', '10mg daily', '2025-04-05', '2025-05-05'),
(302, 3, 103, 'Hydrocortisone cream', 'Apply twice daily', '2025-04-07', '2025-04-21');

-- Insurance
INSERT INTO Insurance VALUES
(401, 1, 'Blue Cross', 'BC123456', 80),
(402, 2, 'Aetna', 'AE987654', 90),
(403, 3, 'UnitedHealth', 'UH456789', 85);

-- Billing
INSERT INTO Billing VALUES
(501, 1001, 150.00, TRUE),
(502, 1002, 100.00, TRUE),
(503, 1003, 120.00, FALSE),
(504, 1004, 180.00, FALSE);
