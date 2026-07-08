use hospitaldb;

INSERT INTO departments (department_name) VALUES
('Cardiology'),
('Dermatology'),
('Pediatrics'),
('Neurology'),
('Orthopedics'),
('General Medicine'),
('Oncology'),
('Gynaecology'),
('Psychiatry'),
('Ophthalmology');


-- user_id 1 is Admin, 2 to 21 are Patients, 22 to 41 are Doctors
INSERT INTO users (user_id, "admin", email, password_hash, role, provider, account_status) VALUES
-- 1 Admin
(1, 'admin@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'admin', 'local', 'Active'),

-- 20 Patients (IDs: 2 to 21)
(2, 'john.doe@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(3, 'jane.smith@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'google', 'Active'),
(4, 'bob.johnson@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(5, 'alice.williams@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(6, 'charlie.brown@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'google', 'Active'),
(7, 'david.jones@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(8, 'emma.miller@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Suspended'),
(9, 'frank.davis@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(10, 'grace.garcia@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'google', 'Active'),
(11, 'henry.rodriguez@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(12, 'ivy.wilson@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(13, 'jack.martinez@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(14, 'katie.anderson@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'google', 'Active'),
(15, 'liam.taylor@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk₀uBR₀Z₂BWh.T₁FR₀Q₅wLr₇cHmSGyg₇G₆', 'patient', 'local', 'Active'),
(16, 'mia.thomas@gmail.com', '$2b$1₀$5QX₀ITa₀r/MjDjKEcjgk₀uBR₀Z₂BWh.T₁FR₀Q₅wLr₇cHmSGyg₇G₆', 'patient', 'local', 'Active'),
(17, 'noah.moore@gmail.com', '$2b$₁₀$5QX₀ITa₀r/MjDjKEcjgk₀uBR₀Z₂BWh.T₁FR₀Q₅wLr₇cHmSGyg₇G₆', 'patient', 'local', 'PendingDeletion'),
(18, 'olivia.jackson@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(19, 'peter.martin@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'google', 'Active'),
(20, 'quinn.lee@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),
(21, 'rachel.perez@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'patient', 'local', 'Active'),

-- 20 Doctors (IDs: 22 to 41)
(22, 'dr.arnold@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(23, 'dr.bell@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(24, 'dr.carter@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk₀uBR₀Z₂BWh.T₁FR₀Q₅wLr₇cHmSGyg₇G₆', 'doctor', 'local', 'Active'),
(25, 'dr.davies@gmail.com', '$2b$1₀$5QX₀ITa₀r/MjDjKEcjgk₀uBR₀Z₂BWh.T₁FR₀Q₅wLr₇cHmSGyg₇G₆', 'doctor', 'local', 'Active'),
(26, 'dr.evans@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(27, 'dr.foster@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(28, 'dr.green@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(29, 'dr.harris@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(30, 'dr.irwin@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(31, 'dr.jones@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(32, 'dr.kelly@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(33, 'dr.lewis@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(34, 'dr.morris@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(35, 'dr.nelson@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(36, 'dr.owens@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(37, 'dr.parker@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(38, 'dr.quinn@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(39, 'dr.ross@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(40, 'dr.stone@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active'),
(41, 'dr.taylor@gmail.com', '$2b$10$5QX0ITa0r/MjDjKEcjgk0uBR0Z2BWh.T1FRQ0Q5wLr7cHmSGyg7G6', 'doctor', 'local', 'Active');

-- 3. INSERT SAMPLE DATA FOR PATIENTS (20 Records mapping to user_id 2-21)
INSERT INTO patients (user_id, age, gender, phone, address, blood_group) VALUES
(2, 28, 'Male', '9876543210', '123 Main St, Springfield', 'O+'),
(3, 34, 'Female', '9876543211', '456 Oak Ave, Metropolis', 'A+'),
(4, 45, 'Male', '9876543212', '789 Pine Rd, Gotham', 'B-'),
(5, 22, 'Female', '9876543213', '321 Elm St, Star City', 'AB+'),
(6, 31, 'Other', '9876543214', '654 Maple Dr, Central City', 'O-'),
(7, 60, 'Male', '9876543215', '987 Cedar Ln, Coast City', 'A-'),
(8, 19, 'Female', '9876543216', '147 Birch Hwy, Bludhaven', 'B+'),
(9, 52, 'Male', '9876543217', '258 Walnut Ct, Riverdale', 'AB-'),
(10, 27, 'Female', '9876543218', '369 Ash Blvd, Hill Valley', 'O+'),
(11, 41, 'Male', '9876543219', '741 Cherry Sq, Greenbow', 'A+'),
(12, 33, 'Female', '9876543220', '852 Willow Way, Mystic Falls', 'B+'),
(13, 29, 'Male', '9876543221', '963 Poplar Pl, Beacon Hills', 'O-'),
(14, 38, 'Female', '9876543222', '159 Beech Ter, Sunnydale', 'A-'),
(15, 25, 'Male', '9876543223', '753 Cypress Dr, Stars Hollow', 'AB+'),
(16, 47, 'Female', '9876543224', '951 Magnolia Ln, Rosewood', 'O+'),
(17, 63, 'Male', '9876543225', '357 Redwood Dr, Storybrooke', 'B-'),
(18, 50, 'Female', '9876543226', '426 Alder St, Twin Peaks', 'A+'),
(19, 21, 'Male', '9876543227', '842 Chestnut Rd, Pawnee', 'O+'),
(20, 36, 'Other', '9876543228', '193 Spruce St, Eagleton', 'AB-'),
(21, 30, 'Female', '9876543229', '517 Fir Ave, Scranton', 'B+');

-- 4. INSERT SAMPLE DATA FOR DOCTORS (20 Records mapping to user_id 22-41)
INSERT INTO doctors (user_id, department_id, qualification, experience, available_time, phone, consultation_fee) VALUES
(22, 1, 'MD - Cardiology', 12, '09:00 AM - 01:00 PM', '555-0101', 150.00),
(23, 1, 'DM - Cardiology', 8, '02:00 PM - 06:00 PM', '555-0102', 130.00),
(24, 2, 'MD - Dermatology', 15, '10:00 AM - 02:00 PM', '555-0103', 120.00),
(25, 2, 'DVD - Dermatology', 6, '04:00 PM - 08:00 PM', '555-0104', 100.00),
(26, 3, 'MD - Pediatrics', 10, '09:00 AM - 01:00 PM', '555-0105', 90.00),
(27, 3, 'DCH - Pediatrics', 5, '03:00 PM - 07:00 PM', '555-0106', 80.00),
(28, 4, 'DM - Neurology', 14, '11:00 AM - 03:00 PM', '555-0107', 200.00),
(29, 4, 'MD - Neurology', 9, '01:00 PM - 05:00 PM', '555-0108', 180.00),
(30, 5, 'MS - Orthopedics', 11, '08:00 AM - 12:00 PM', '555-0109', 110.00),
(31, 5, 'MCh - Orthopedics', 7, '02:00 PM - 06:00 PM', '555-0110', 120.00),
(32, 6, 'MD - General Medicine', 16, '09:00 AM - 03:00 PM', '555-0111', 70.00),
(33, 6, 'MBBS', 4, '03:00 PM - 09:00 PM', '555-0112', 50.00),
(34, 7, 'MD - Oncology', 13, '10:00 AM - 02:00 PM', '555-0113', 220.00),
(35, 7, 'DM - Oncology', 8, '02:00 PM - 06:00 PM', '555-0114', 210.00),
(36, 8, 'MD - Gynaecology', 10, '09:00 AM - 01:00 PM', '555-0115', 130.00),
(37, 8, 'DGO - Gynaecology', 7, '02:00 PM - 06:00 PM', '555-0116', 110.00),
(38, 9, 'MD - Psychiatry', 9, '11:00 AM - 03:00 PM', '555-0117', 140.00),
(39, 9, 'DPM - Psychiatry', 6, '04:00 PM - 08:00 PM', '555-0118', 120.00),
(40, 10, 'MS - Ophthalmology', 12, '09:00 AM - 01:00 PM', '555-0119', 100.00),
(41, 10, 'DO - Ophthalmology', 5, '02:00 PM - 06:00 PM', '555-0120', 80.00);

-- 1. INSERT SAMPLE DATA FOR MEDICINES (30 Records)
INSERT INTO medicines (medicine_name, price, usage_details, dosage, stock_quantity) VALUES
('Amoxicillin', 15.50, 'Take after food to avoid stomach upset.', '500mg', 150),
('Paracetamol', 4.20, 'For relief of mild to moderate pain and fever.', '650mg', 500),
('Ibuprofen', 6.80, 'Take with food or milk.', '400mg', 300),
('Metformin', 12.00, 'Used for blood sugar control in type 2 diabetes.', '850mg', 250),
('Atorvastatin', 24.50, 'Take once daily in the evening.', '20mg', 180),
('Lisinopril', 9.99, 'For high blood pressure control.', '10mg', 220),
('Levothyroxine', 14.25, 'Take on an empty stomach in the morning.', '75mcg', 400),
('Amlodipine', 8.50, 'Can be taken with or without food.', '5mg', 350),
('Omeprazole', 11.40, 'Take 30 minutes before breakfast.', '20mg', 200),
('Azithromycin', 18.90, 'Antibiotic course. Complete full dosage.', '250mg', 100),
('Losartan', 13.15, 'Do not stop abruptly.', '50mg', 160),
('Albuterol Inhaler', 35.00, 'Inhale 2 puffs as needed for shortness of breath.', '90mcg', 90),
('Gabapentin', 22.10, 'May cause drowsiness or dizziness.', '300mg', 140),
('Hydrochlorothiazide', 5.50, 'Take in the morning to avoid nighttime urination.', '25mg', 280),
('Sertraline', 19.50, 'Antidepressant. Take at the same time daily.', '50mg', 120),
('Metoprolol', 11.00, 'Take with or immediately following a meal.', '50mg', 210),
('Fluticasone Nasal Spray', 28.00, 'Use daily for allergy relief.', '50mcg', 85),
('Tramadol', 16.50, 'Analgesic for moderate to severe pain.', '50mg', 75),
('Montelukast', 17.80, 'Take in the evening for asthma/allergies.', '10mg', 190),
('Prednisone', 7.20, 'Take with food. Do not stop suddenly.', '10mg', 130),
('Cetirizine', 5.00, 'Antihistamine. Once daily.', '10mg', 450),
('Clopidogrel', 26.40, 'Blood thinner. Take daily.', '75mg', 110),
('Pantoprazole', 12.80, 'Take before morning meal.', '40mg', 240),
('Furosemide', 6.00, 'Diuretic. Monitor potassium levels.', '40mg', 170),
('Meloxicam', 14.00, 'For arthritis pain relief.', '15mg', 125),
('Rosuvastatin', 29.90, 'Cholesterol management.', '10mg', 140),
('Carvedilol', 10.50, 'Take with food to slow absorption rate.', '12.5mg', 165),
('Ciprofloxacin', 16.00, 'Avoid taking with dairy products.', '500mg', 105),
('Warfarin', 8.20, 'Requires regular blood monitoring.', '5mg', 150),
('Bupropion', 21.00, 'Swallow whole. Do not crush or chew.', '150mg', 95);

-- INSERT SAMPLE DATA FOR EMERGENCY SERVICES (10 Records)
INSERT INTO emergency_services (emergency_phone, ambulance_service, emergency_doctor) VALUES
('555-0911', 'City General Fleet A1', 'Dr. Arnold (Cardiology)'),
('555-0912', 'Metro Rescue Fleet B3', 'Dr. Carter (Dermatology)'),
('555-0913', 'First Responder Fleet C2', 'Dr. Evans (Pediatrics)'),
('555-0914', 'Rapid Transit Fleet D5', 'Dr. Green (Neurology)'),
('555-0915', 'Lifeline Ambulance E1', 'Dr. Jones (Orthopedics)'),
('555-0916', 'City General Fleet A2', 'Dr. Kelly (General Medicine)'),
('555-0917', 'Metro Rescue Fleet B4', 'Dr. Morris (Oncology)'),
('555-0918', 'First Responder Fleet C3', 'Dr. Owens (Gynaecology)'),
('555-0919', 'Rapid Transit Fleet D6', 'Dr. Quinn (Psychiatry)'),
('555-0920', 'Lifeline Ambulance E2', 'Dr. Stone (Ophthalmology)');

-- INSERT SAMPLE DATA FOR CONTACT HOSPITAL (1 Record)
INSERT INTO contact_hospital (hospital_phone, hospital_email, hospital_address) VALUES
('1-800-555-0199', 'contact@centralhospital.com', '742 Evergreen Terrace, Medical District, Springfield, Plaza 4005');

-- INSERT SAMPLE DATA FOR APPOINTMENTS (20 Records)
-- Maps all 20 unique patients to various unique doctors across 2026 calendar dates
INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, 1, '2026-07-10', '09:30:00', 'Confirmed'),
(2, 2, 2, '2026-07-10', '14:15:00', 'Confirmed'),
(3, 3, 3, '2026-07-11', '10:00:00', 'Pending'),
(4, 4, 4, '2026-07-11', '11:30:00', 'Confirmed'),
(5, 5, 5, '2026-07-12', '08:45:00', 'Cancelled'),
(6, 6, 6, '2026-07-12', '15:00:00', 'Completed'),
(7, 7, 7, '2026-07-13', '10:15:00', 'Confirmed'),
(8, 8, 8, '2026-07-13', '14:30:00', 'Pending'),
(9, 9, 9, '2026-07-14', '11:00:00', 'Completed'),
(10, 10, 10, '2026-07-14', '09:00:00', 'Confirmed'),
(11, 11, 11, '2026-07-15', '16:00:00', 'Confirmed'),
(12, 12, 12, '2026-07-15', '13:30:00', 'Completed'),
(13, 13, 13, '2026-07-16', '10:45:00', 'Confirmed'),
(14, 14, 14, '2026-07-16', '15:15:00', 'Pending'),
(15, 15, 15, '2026-07-17', '09:15:00', 'Cancelled'),
(16, 16, 16, '2026-07-17', '11:45:00', 'Completed'),
(17, 17, 17, '2026-07-18', '14:00:00', 'Confirmed'),
(18, 18, 18, '2026-07-18', '16:30:00', 'Pending'),
(19, 19, 19, '2026-07-19', '10:30:00', 'Completed'),
(20, 20, 20, '2026-07-19', '12:00:00', 'Confirmed');

-- 5. INSERT SAMPLE DATA FOR PATIENT RECORDS (20 Records)
-- Maps data for all 20 unique patients documenting their clinical history
INSERT INTO patient_records (patient_id, doctor_id, diagnosis, treatment, notes, visit_date) VALUES
(1, 1, 'Essential Hypertension', 'Prescribed Lisinopril 10mg once daily.', 'Patient should monitor blood pressure morning and evening.', '2026-06-01'),
(2, 2, 'Acute Contact Dermatitis', 'Apply Topical Hydrocortisone 1% cream.', 'Avoid synthetic laundry detergents for two weeks.', '2026-06-02'),
(3, 3, 'Acute Bronchitis', 'Amoxicillin 500mg, rest, hydration.', 'Review condition if fever persists past 72 hours.', '2026-06-03'),
(4, 4, 'Migraine without Aura', 'Sumatriptan 50mg at onset, avoid caffeine triggers.', 'Keep a detailed headache journal for the next month.', '2026-06-05'),
(5, 5, 'Lumbar Muscle Strain', 'Ibuprofen 400mg, physical therapy evaluations.', 'Strict bed rest discouraged; perform light walking.', '2026-06-06'),
(6, 6, 'Type 2 Diabetes Mellitus', 'Metformin 850mg twice daily with meals.', 'Referred to clinical dietitian for carb-counting support.', '2026-06-08'),
(7, 7, 'Iron Deficiency Anemia', 'Oral Ferrous Sulfate supplements, vitamin C.', 'Re-check complete blood count (CBC) in 6 weeks.', '2026-06-10'),
(8, 8, 'Generalized Anxiety Disorder', 'Sertraline 50mg daily, cognitive behavioral therapy.', 'Follow-up appointment booked in two weeks.', '2026-06-12'),
(9, 9, 'Allergic Rhinitis', 'Cetirizine 10mg daily, Fluticasone spray.', 'Symptoms heavily triggered by local pollen counts.', '2026-06-15'),
(10, 10, 'Hypercholesterolemia', 'Atorvastatin 20mg nightly, low-sodium regimen.', 'Fasting lipid panel required prior to next consult.', '2026-06-18'),
(11, 11, 'Gastroesophageal Reflux Disease', 'Omeprazole 20mg before breakfast.', 'Advised avoid eating within 3 hours of sleeping.', '2026-06-20'),
(12, 12, 'Streptococcal Pharyngitis', 'Azithromycin 250mg 5-day dose pack.', 'Discard toothbrush after 24 hours of antibiotic use.', '2026-06-22'),
(13, 13, 'Hypothyroidism', 'Levothyroxine 75mcg on empty stomach.', 'Schedule TSH blood draw in precisely 4 weeks.', '2026-06-25'),
(14, 14, 'Osteoarthritis of Knee', 'Meloxicam 15mg daily, low-impact exercise.', 'Discussed potential hyaluronan injections later.', '2026-06-26'),
(15, 15, 'Asthma - Mild Intermittent', 'Albuterol inhaler 2 puffs PRN for wheezing.', 'Ensure inhaler spacer device is cleaned weekly.', '2026-06-28'),
(16, 16, 'Vitamin D Deficiency', 'Cholecalciferol 50,000 IU weekly capsule.', 'Retest serum 25-hydroxyvitamin D levels in 2 months.', '2026-06-29'),
(17, 17, 'Gouty Arthritis Flare', 'Colchicine acute dose, continue allopurinol.', 'Increase fluid intake to flush out uric acid crystals.', '2026-06-30'),
(18, 18, 'Otitis Externa Right Ear', 'Ciprofloxacin otic drops 4 drops twice daily.', 'Keep ear canal completely dry during showers.', '2026-07-01'),
(19, 19, 'Tension Headaches', 'Paracetamol 650mg PRN, stress mitigation.', 'Ergonomic structural workspace overhaul suggested.', '2026-07-02'),
(20, 20, 'Plantar Fasciitis', 'Night splints, regular calf stretches, orthotics.', 'Avoid bare-foot walking on hardwood floor surfaces.', '2026-07-03');


-- 6. INSERT SAMPLE DATA FOR BILLING (20 Records)
INSERT INTO billing (appointment_id, consultation_fee, lab_test_fee, medicine_cost, room_charges, payment_status) VALUES
(1, 150.00, 45.00, 15.50, 0.00, 'Paid'),
(2, 130.00, 0.00, 4.20, 0.00, 'Paid'),
(3, 120.00, 75.00, 0.00, 0.00, 'Pending'),
(4, 100.00, 0.00, 6.80, 0.00, 'Paid'),
(5, 90.00, 0.00, 0.00, 0.00, 'Pending'), -- Cancelled but system captures base fee processing
(6, 80.00, 30.00, 12.00, 0.00, 'Paid'),
(7, 200.00, 120.00, 24.50, 150.00, 'Paid'), -- Includes room charge for short observation
(8, 180.00, 0.00, 9.99, 0.00, 'Pending'),
(9, 110.00, 50.00, 14.25, 0.00, 'Paid'),
(10, 120.00, 0.00, 8.50, 0.00, 'Paid'),
(11, 70.00, 0.00, 11.40, 0.00, 'Pending'),
(12, 50.00, 35.00, 18.90, 0.00, 'Paid'),
(13, 220.00, 110.00, 13.15, 0.00, 'Paid')
