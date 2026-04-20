-- ============================================
-- Hotel Management System — Database Schema
-- hotel_db.sql
-- ============================================

CREATE DATABASE IF NOT EXISTS hotel_db;
USE hotel_db;

-- ----------------------
-- Table: rooms
-- ----------------------
CREATE TABLE IF NOT EXISTS rooms (
    room_id     INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10)    NOT NULL UNIQUE,
    type        ENUM('Single', 'Double', 'Suite', 'Deluxe') NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    status      ENUM('Available', 'Occupied', 'Under Maintenance') DEFAULT 'Available',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------
-- Table: guests
-- ----------------------
CREATE TABLE IF NOT EXISTS guests (
    guest_id    INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100)   NOT NULL,
    cnic        VARCHAR(15)    UNIQUE,
    phone       VARCHAR(15),
    email       VARCHAR(100),
    address     TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------
-- Table: bookings
-- ----------------------
CREATE TABLE IF NOT EXISTS bookings (
    booking_id  INT AUTO_INCREMENT PRIMARY KEY,
    guest_id    INT            NOT NULL,
    room_id     INT            NOT NULL,
    check_in    DATE           NOT NULL,
    check_out   DATE           NOT NULL,
    status      ENUM('Confirmed', 'Checked In', 'Checked Out', 'Cancelled') DEFAULT 'Confirmed',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id)  REFERENCES rooms(room_id)   ON DELETE CASCADE
);

-- ----------------------
-- Table: invoices
-- ----------------------
CREATE TABLE IF NOT EXISTS invoices (
    invoice_id  INT AUTO_INCREMENT PRIMARY KEY,
    booking_id  INT            NOT NULL,
    amount      DECIMAL(10, 2) NOT NULL,
    paid        BOOLEAN        DEFAULT FALSE,
    date_issued DATE           DEFAULT (CURRENT_DATE),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- ============================================
-- Sample Data (for testing)
-- ============================================

INSERT INTO rooms (room_number, type, price, status) VALUES
('101', 'Single',  3500.00, 'Available'),
('102', 'Double',  5500.00, 'Available'),
('201', 'Suite',   12000.00, 'Available'),
('202', 'Deluxe',  8500.00,  'Available'),
('301', 'Single',  3500.00, 'Occupied');

INSERT INTO guests (name, cnic, phone, email, address) VALUES
('Ali Hassan',    '35202-1234567-1', '0300-1234567', 'ali@email.com',   'Lahore, Pakistan'),
('Sara Khan',     '35202-7654321-2', '0312-9876543', 'sara@email.com',  'Islamabad, Pakistan'),
('Ahmed Niazi',   '37405-1111111-3', '0333-1112233', 'ahmed@email.com', 'Rawalpindi, Pakistan');

INSERT INTO bookings (guest_id, room_id, check_in, check_out, status) VALUES
(1, 5, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 3 DAY), 'Checked In'),
(2, 2, DATE_ADD(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 4 DAY), 'Confirmed');

INSERT INTO invoices (booking_id, amount, paid) VALUES
(1, 10500.00, FALSE),
(2, 16500.00, FALSE);
