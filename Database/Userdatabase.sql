CREATE DATABASE auth_DB;
USE auth_DB;

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
mobile VARCHAR(15) NOT NULL,
password VARCHAR(255) NOT NULL,
role VARCHAR(20),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Test ADMIN user
INSERT INTO users (full_name, email, mobile, password, role)
VALUES ('Admin User', 'admin@test.com', '9999999999', 'Admin@123', 'ADMIN');

-- Test PROVIDER user  
INSERT INTO users (full_name, email, mobile, password, role)
VALUES ('Provider User', 'provider@test.com', '8888888888', 'Provider@123', 'PROVIDER');

