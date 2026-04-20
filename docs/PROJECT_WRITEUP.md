# Project Deep-Dive: Hotel Management System

> This document is intended for interviewers, recruiters, and technical reviewers who want to understand the design decisions, challenges, and learning outcomes of this project.

---

## 🎯 Project Summary

The **Hotel Management System** is a desktop application built in **Java** with a **MySQL** backend. It automates core hotel operations: room management, guest registration, booking, check-in/check-out, and invoice generation.

- **Type:** Full-stack desktop application (Java Swing + MySQL)
- **Purpose:** Portfolio project demonstrating OOP, database design, and GUI development
- **Timeline:** Built over ~2 weeks as part of academic coursework

---

## 💡 Problem I Was Solving

Many small hotels in Pakistan still rely on manual registers and Excel sheets to manage bookings. This leads to:
- Double bookings due to no real-time availability tracking
- Lost guest records
- Slow invoice calculation

This project simulates a lightweight, low-cost solution for such hotels — deployable on any Windows machine with Java installed.

---

## 🏗️ Architecture & Design Decisions

### Layered Architecture

The application follows a basic **3-tier architecture**:

```
┌─────────────────────────────┐
│  Presentation Layer         │  Java Swing (GUI Forms)
│  (Dashboard, Forms, Tables) │
├─────────────────────────────┤
│  Business Logic Layer       │  Java Classes (Booking rules,
│  (Validation, Calculations) │  invoice computation, availability)
├─────────────────────────────┤
│  Data Layer                 │  JDBC + MySQL
│  (CRUD Operations)          │  Parameterized queries
└─────────────────────────────┘
```

### Key Design Decisions

**1. Single DBConnection Class (Singleton Pattern)**

Rather than opening a new connection in every method, I created a centralized `DBConnection.java` class that manages one connection throughout the application lifecycle. This avoids connection overhead and makes credential management easier.

**2. PreparedStatements over raw SQL**

All database queries use `PreparedStatement` instead of `Statement` + string concatenation. This prevents SQL injection attacks — an important security consideration even in a desktop app.

**3. Room Status as ENUM**

Room status (`Available`, `Occupied`, `Under Maintenance`) is stored as a MySQL ENUM. This enforces valid states at the database level rather than relying solely on application code.

---

## 🔑 Core Features Explained

### Room Availability Logic
When a booking is created:
1. System checks if the room's status is `Available`
2. Checks for overlapping bookings in the `bookings` table for the same date range
3. If both pass → booking is confirmed and room status updated to `Occupied`

### Invoice Calculation
Invoice amount = `(check_out - check_in)` days × `room.price`

This is computed in Java before being stored in the `invoices` table, so the price is locked at the time of booking — even if the room's rate changes later.

---

## 🧗 Challenges & How I Solved Them

| Challenge | Solution |
|---|---|
| Managing DB connection across multiple forms | Created a static `DBConnection` utility class shared across the app |
| Preventing double bookings | Added date-overlap query before confirming any reservation |
| Keeping UI and data in sync | Refreshed JTable models after every CRUD operation using custom `loadData()` methods |
| JDBC driver not found at runtime | Documented exact library setup steps; added driver to project classpath via NetBeans Libraries |

---

## 📚 What I Learned

- **JDBC & MySQL integration** — connecting Java to a relational database, writing parameterized queries, handling ResultSets
- **Java Swing** — building forms, tables (JTable), dialogs, and event listeners
- **OOP principles** — encapsulation in model classes, separation of UI from data logic
- **Database design** — normalization, foreign keys, ENUM types, referential integrity
- **Git basics** — version control, meaningful commits, repository documentation

---

## 🚀 Future Improvements (If I Continue This Project)

- [ ] Add user authentication (admin vs receptionist roles)
- [ ] Export invoices to PDF using Apache PDFBox or iText
- [ ] Migrate GUI to JavaFX for a more modern look
- [ ] Add a reporting dashboard (occupancy rate, monthly revenue)
- [ ] Replace JDBC with Hibernate/JPA (ORM layer)
- [ ] Write unit tests with JUnit for business logic methods
- [ ] Package as an executable `.jar` or `.exe` installer

---

## 🧪 How to Test Core Functionality

1. **Add a room** → Go to Room Management → Add New Room
2. **Register a guest** → Guest Management → New Guest
3. **Make a booking** → Booking → Select guest and room → Set dates → Confirm
4. **Generate invoice** → Billing → Select booking → Generate Invoice
5. **Check-out** → Update booking status → Room status auto-updates to Available

---

## 🤝 Open to Discussion

I'm happy to walk through any part of this codebase in an interview — from the database schema design to specific Java classes. Feel free to reach out via [GitHub Issues](../../issues) or LinkedIn.
