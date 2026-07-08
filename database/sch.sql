create database hospitaldb;

use hospitaldb;


#users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) DEFAULT NULL,
    role ENUM('patient', 'doctor', 'admin') DEFAULT 'patient',
    provider ENUM('local', 'google') DEFAULT 'local',
    account_status ENUM(
        'Active',
        'Suspended',
        'PendingDeletion'
    ) DEFAULT 'Active',
    deletion_date DATETIME DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    age INT NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address TEXT,
    blood_group ENUM(
        'A+','A-',
        'B+','B-',
        'AB+','AB-',
        'O+','O-'
    ),
    FOREIGN KEY(user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

select * from patients;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    department_id INT NOT NULL,
    qualification VARCHAR(100),
    experience INT,
    available_time VARCHAR(100),
    phone VARCHAR(15),
    consultation_fee DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

CREATE TABLE appointments (

    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM(
        'Pending',
        'Confirmed',
        'Completed',
        'Cancelled'
    ) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE patient_records (

    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    diagnosis TEXT,
    treatment TEXT,
    notes TEXT,
    visit_date DATE,
    FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE billing (

    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    consultation_fee DECIMAL(10,2) DEFAULT 0,
    lab_test_fee DECIMAL(10,2) DEFAULT 0,
    medicine_cost DECIMAL(10,2) DEFAULT 0,
    room_charges DECIMAL(10,2) DEFAULT 0,
    total_amount DECIMAL(10,2) GENERATED ALWAYS AS (

        consultation_fee +
        lab_test_fee +
        medicine_cost +
        room_charges

    ) STORED,
    payment_status ENUM(
        'Pending',
        'Paid'
    ) DEFAULT 'Pending',

    FOREIGN KEY(appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE medicines (

    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    usage_details TEXT,
    dosage VARCHAR(100),
    stock_quantity INT DEFAULT 0
);

CREATE TABLE emergency_services (

    emergency_id INT AUTO_INCREMENT PRIMARY KEY,
    emergency_phone VARCHAR(15),
    ambulance_service VARCHAR(100),
    emergency_doctor VARCHAR(100)
);

CREATE TABLE contact_hospital (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_phone VARCHAR(15),
    hospital_email VARCHAR(100),
    hospital_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);