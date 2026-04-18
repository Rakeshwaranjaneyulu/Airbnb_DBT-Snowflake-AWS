# Airbnb Data Engineering Project (dbt + Snowflake + AWS)

## 📌 Overview
This project demonstrates an end-to-end data engineering pipeline built using **dbt, Snowflake, and AWS** to transform raw Airbnb data into analytics-ready datasets.

The pipeline follows a **Medallion Architecture (Bronze → Silver → Gold)** to ensure scalable, testable, and reliable data transformations.

---

## 🏗️ Architecture

Raw Data → Bronze → Silver → Gold → Analytics / Reporting

- **Bronze Layer**: Raw ingestion (no transformation)
- **Silver Layer**: Cleaned and standardized data
- **Gold Layer**: Business-level models (facts & dimensions)

---

## 🧰 Tech Stack
- **dbt (Data Build Tool)** – transformation & modeling
- **Snowflake** – cloud data warehouse
- **AWS S3** – data storage
- **SQL** – transformations
- **Git/GitHub** – version control

---

## 📊 Data Model

### Fact Table
- `FACT`
  - booking_id
  - listing_id
  - host_id
  - total_amount
  - service_fee
  - cleaning_fee

### Dimension Tables
- `DIM_LISTINGS`
- `DIM_HOSTS`
- `DIM_BOOKINGS`

---

## 🔄 Key Transformations
- Built incremental models for scalable data processing
- Applied joins across booking, listing, and host data
- Created surrogate keys and clean dimensions
- Implemented dbt snapshots for slowly changing dimensions

---

## ✅ Data Quality Checks
- Not Null tests
- Unique key validation
- Referential integrity checks

---

## ⚡ Key Highlights
- Designed modular dbt models using Jinja templating
- Implemented layered architecture for maintainability
- Optimized queries for Snowflake performance
- Built reusable SQL patterns using config-driven joins

---

## 🚀 How to Run

```bash
dbt deps
dbt seed
dbt run
dbt test
