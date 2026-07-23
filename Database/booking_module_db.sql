-- BOOK-01: Booking Module Database
-- Run this script in MySQL Workbench before starting Sprint 3
<<<<<<< HEAD

=======
CREATE DATABASE IF NOT EXISTS booking_module_db;
USE booking_module_db;

CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    service_id INT NOT NULL,
    service_name VARCHAR(100) NOT NULL,
    booking_date DATE NOT NULL,
    time_slot VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    amount VARCHAR(50) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
