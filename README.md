# 🏨 Hotel Management System

<div align="center">

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![NetBeans](https://img.shields.io/badge/NetBeans-1B6AC6?style=for-the-badge&logo=apache-netbeans-ide&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A full-featured desktop application to manage hotel operations — rooms, guests, bookings, and billing — all in one place.**

[Features](#-features) • [Demo](#-screenshots) • [Setup](#-getting-started) • [Database](#-database-schema) • [Architecture](#-project-structure)

</div>

---

## 📌 Overview

The **Hotel Management System** is a Java-based desktop application built to streamline day-to-day hotel operations. It replaces manual paperwork with a clean, intuitive GUI that allows hotel staff to manage rooms, handle guest check-ins/check-outs, track bookings, and generate invoices — all from a single dashboard.

> Built as an academic/portfolio project demonstrating real-world OOP design, database integration, and GUI development in Java.

---

## ✨ Features

| Module | Description |
|---|---|
| 🛏️ **Room Management** | Add, update, delete rooms; track availability and room types |
| 👤 **Guest Records** | Register guests, store contact info, view history |
| 📅 **Booking System** | Create, modify, and cancel reservations |
| 🧾 **Billing & Invoices** | Auto-generate invoices based on stay duration and services |
| 🔍 **Search & Filter** | Quickly find rooms or guests by various criteria |
| 📊 **Dashboard** | Overview of occupancy, current guests, and pending checkouts |

---

## 🛠️ Tech Stack

- **Language:** Java (JDK 8+)
- **GUI Framework:** Java Swing
- **Database:** MySQL 8.0
- **Build Tool:** Apache Ant (`build.xml`)
- **IDE:** Apache NetBeans

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- [Java JDK 8+](https://www.oracle.com/java/technologies/downloads/)
- [MySQL Server 8.0](https://dev.mysql.com/downloads/mysql/)
- [Apache NetBeans IDE](https://netbeans.apache.org/) *(recommended)*
- [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/) *(JDBC Driver)*

---

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/ahmxdniazi/Hotel-Management-System.git
cd Hotel-Management-System
```

**2. Set up the database**
```bash
mysql -u root -p
```
```sql
CREATE DATABASE hotel_db;
USE hotel_db;
SOURCE docs/hotel_db.sql;
```

**3. Configure DB connection**

Open `src/hotelmanagementsystem/DBConnection.java` and update:
```java
private static final String URL      = "jdbc:mysql://localhost:3306/hotel_db";
private static final String USERNAME = "your_mysql_username";
private static final String PASSWORD = "your_mysql_password";
```

**4. Add JDBC Driver to project**

- Download [mysql-connector-java.jar](https://dev.mysql.com/downloads/connector/j/)
- In NetBeans: Right-click project → Properties → Libraries → Add JAR

**5. Run the project**

- Open project in NetBeans
- Press **F6** or click ▶ Run
- Or via terminal:
```bash
ant run
```

---

## 🗄️ Database Schema

```
hotel_db
├── rooms          (room_id, room_number, type, price, status)
├── guests         (guest_id, name, cnic, phone, email, address)
├── bookings       (booking_id, guest_id, room_id, check_in, check_out, status)
└── invoices       (invoice_id, booking_id, amount, paid, date_issued)
```

See [`docs/hotel_db.sql`](docs/hotel_db.sql) for the full schema with sample data.

---

## 📁 Project Structure

```
Hotel-Management-System/
├── src/
│   └── hotelmanagementsystem/
│       ├── Main.java              # Entry point
│       ├── DBConnection.java      # Database connection handler
│       ├── Dashboard.java         # Main dashboard UI
│       ├── RoomManagement.java    # Room CRUD operations
│       ├── GuestManagement.java   # Guest registration & records
│       ├── BookingManagement.java # Reservation handling
│       └── Invoice.java           # Billing & invoice generation
├── docs/
│   ├── hotel_db.sql               # Database schema + seed data
│   └── screenshots/               # App screenshots
├── build.xml                      # Ant build configuration
├── manifest.mf                    # JAR manifest
├── .gitignore
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

---

## 🤝 Contributing

Contributions are welcome! Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) for guidelines.

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add: your feature description"`
4. Push and open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** — see the [`LICENSE`](LICENSE) file for details.

---

## 👨‍💻 Author

**Ahmad Niazi**
- GitHub: [@ahmxdniazi](https://github.com/ahmxdniazi)

---

<div align="center">
⭐ If you found this project helpful, consider giving it a star!
</div>
