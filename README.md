# Flyway Setup for Oracle Database

This repository contains a simple and convenient shell script for installing Flyway CLI along with the Oracle JDBC driver for managing database migrations effectively.

---

## 🚀 Quick Setup

### Step 1: Clone this repository

```bash
git clone <your_repository_url>
cd <repository_directory>
```

### Step 2: Execute the setup script

Make the script executable and run it:

```bash
chmod +x flyway_setup.sh
./flyway_setup.sh
```

---

## 📁 Project Structure

After running the script, your directory will look like this:

```
flyway-migration-template/
│── flyway/                 # Flyway executable
│── drivers/
│   └── ojdbc8.jar          # Oracle JDBC Driver
│── sql/
│   ├── common/             # Migration and rollback scripts for the environment
│   └── <env>
│── conf/
│   ├── flyway-dev.conf     # Add your environment configs here
│   └── flyway-prod.conf
├── db.sh                   # start, stop and restart the db
├── flyway.sh               # Helper script to manage migrations
└── flyway_setup.sh         # Installation script
```

---

## 🛠 Usage

### Manage migrations with ease using `flyway.sh`

```bash
./flyway.sh [environment] [command]
```

**Example:**

```bash
./flyway.sh dev migrate
./flyway.sh prod info
```

Supported commands:

- `info` - Check migration state
- `migrate` - Apply migrations
- `validate` - Validate migrations
- `clean` - Drop database objects (use cautiously!)

---

## ✅ Prerequisites

- **Java 17 (OpenJDK)** installed (automatically installed by script)
- Internet access for initial setup (Flyway CLI and Oracle JDBC)

---

## ⚠️ Important Notes

- Ensure the database credentials in `conf` files are secure.
- Do not commit sensitive information like database passwords.

---

## 📚 References

- [Flyway Documentation](https://flywaydb.org/documentation/)
- [Oracle JDBC Driver](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)

---

Happy migrating! 🚀🐦