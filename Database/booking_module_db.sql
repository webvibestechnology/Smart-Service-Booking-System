CREATE DATABASE IF NOT EXISTS booking_module_db;
USE booking_module_db;

DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    booking_id   INT          PRIMARY KEY AUTO_INCREMENT,
    user_id      INT          NOT NULL,
    service_id   INT          NOT NULL DEFAULT 0,
    service_name VARCHAR(100) NOT NULL,
    booking_date DATE         NOT NULL,
    time_slot    VARCHAR(50),
    address      TEXT,
    amount       DECIMAL(10,2) DEFAULT 0.00,
    status       VARCHAR(20)  DEFAULT 'Pending',
    created_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);


SELECT 'booking_module_db created successfully' AS result;aa