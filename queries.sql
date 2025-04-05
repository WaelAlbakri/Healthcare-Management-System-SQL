-- ============================================
-- File: queries.sql
-- Example SQL queries for analytics and reporting
-- ============================================

-- 1. View all patients
SELECT * FROM Patients;

-- 2. List doctors and their specialties
SELECT FirstName, LastName, Specialty FROM Doctors;

-- 3. Upcoming appointments after April 6, 2025
SELECT * FROM Appointments
WHERE AppointmentDate > '2025-04-06';

-- 4. Appointments with patient and doctor names
SELECT 
    a.AppointmentID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    a.AppointmentDate,
    a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- 5. Prescriptions with names and dosages
SELECT 
    pr.PrescriptionID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    pr.Medication,
    pr.Dosage
FROM Prescriptions pr
JOIN Patients p ON pr.PatientID = p.PatientID
JOIN Doctors d ON pr.DoctorID = d.DoctorID;

-- 6. Total appointments per doctor
SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    COUNT(*) AS TotalAppointments
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
GROUP BY d.DoctorID;

-- 7. Total unpaid billing
SELECT 
    SUM(Amount) AS TotalUnpaid
FROM Billing
WHERE Paid = FALSE;

-- 8. Patients with more than one appointment
SELECT PatientID
FROM Appointments
GROUP BY PatientID
HAVING COUNT(*) > 1;

-- 9. Latest prescription per patient
SELECT *
FROM Prescriptions p1
WHERE StartDate = (
    SELECT MAX(StartDate)
    FROM Prescriptions p2
    WHERE p2.PatientID = p1.PatientID
);

-- 10. Billing with readable payment status
SELECT 
    BillingID,
    Amount,
    CASE 
        WHEN Paid THEN 'Paid'
        ELSE 'Pending'
    END AS PaymentStatus
FROM Billing;

-- 11. Doctors and their departments
SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    dept.Name AS Department
FROM Doctors d
JOIN Departments dept ON d.DepartmentID = dept.DepartmentID;