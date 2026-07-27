<<<<<<< HEAD
-- BOOK-01: Booking Module Database
-- Run this script in MySQL Workbench before starting Sprint 3
<<<<<<< HEAD

=======
=======
-- Sprint 3 - Booking Module Database
-- Run this entire script in MySQL Workbench

>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
CREATE DATABASE IF NOT EXISTS booking_module_db;
USE booking_module_db;

DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    booking_id   INT          PRIMARY KEY AUTO_INCREMENT,
    user_id      INT          NOT NULL,
    service_id   INT          NOT NULL DEFAULT 0,
    service_name VARCHAR(100) NOT NULL,
<<<<<<< HEAD
    booking_date DATE NOT NULL,
    time_slot VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    amount VARCHAR(50) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
>>>>>>> c686a1086cb7f136d49bf6fcb9c36af1183213cf
=======
    booking_date DATE         NOT NULL,
    time_slot    VARCHAR(50),
    address      TEXT,
    amount       DECIMAL(10,2) DEFAULT 0.00,
    status       VARCHAR(20)  DEFAULT 'Pending',
    created_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

-- Verify
SELECT 'booking_module_db created successfully' AS result;
SELECT * FROM bookings;
>>>>>>> 5ae139cc3a190f51136fbb7e7269b55c2064bb88
