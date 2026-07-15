CREATE DATABASE service_module_db;
USE service_module_db;

CREATE TABLE IF NOT EXISTS service (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO service (service_name, description, price, category, status) VALUES
('AC Repair', 'Deep cleaning, gas leak detection, and high-pressure jet wash for AC.', 499.00, 'AC Maintenance', 'Active'),
('Plumbing', 'Fixing water leakages, pipeline repairs, and bathroom fittings installation.', 299.00, 'Plumbing Services', 'Active'),
('Electrician', 'Home wiring check, fan/light installation, and switchboard repairs.', 199.00, 'Electrical Services', 'Active'),
('Home Cleaning', 'Full deep cleaning of rooms, kitchen, and bathroom with sanitization.', 149.00, 'Cleaning Services', 'Active'),
('Laptop Repair', 'Software installation, OS formatting, and laptop hardware repair.', 399.00, 'IT & Repair', 'Active');

SELECT * FROM service;