-- ============================================
-- File: schema.sql
-- Project: Healthcare Management System
-- Description: Core schema for managing patient care, appointments, billing, and reporting
-- Author: Wael Ahmed (Data Analyst)
-- ============================================

-- Table: Patients
-- Stores personal and contact information of patients
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Table: Doctors
-- Stores doctor details, specialties, and department reference
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Table: Departments
-- Categorizes doctors by department
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Adds department linkage to doctors
ALTER TABLE Doctors
ADD DepartmentID INT,
ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- Table: Appointments
-- Tracks doctor-patient interactions and visit status
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Reason TEXT,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Table: MedicalRecords
-- Stores medical history and treatments for each patient
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    Diagnosis TEXT,
    Treatment TEXT,
    RecordDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Table: Prescriptions
-- Tracks medications prescribed by doctors to patients
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Medication VARCHAR(100),
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Table: Insurance
-- Stores insurance providers and coverage details per patient
CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY,
    PatientID INT,
    Provider VARCHAR(100),
    PolicyNumber VARCHAR(50),
    CoveragePercent INT CHECK (CoveragePercent BETWEEN 0 AND 100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Table: Billing
-- Tracks financial charges and payment status for appointments
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    AppointmentID INT,
    Amount DECIMAL(10, 2),
    Paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);