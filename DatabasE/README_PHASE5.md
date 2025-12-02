1. Phase Overview

Phase V focuses on building the physical database structure for the Adaptive Restocking and Expiry Tracking System.
The goal is to implement all tables, constraints, indexes, and test data needed to support:

automatic restocking

expiry monitoring

discount management

inventory movement logging

This phase also includes validation queries and documentation.

 2. Database Entities Implemented
 PRODUCTS

Stores product details, prices, categories, minimum stock levels, and status.

 EXPIRY_TRACKING

Tracks expiry dates, quantities, and remaining shelf life for every perishable item.

 RESTOCK_RULES

Stores minimum stock levels and restocking quantities.

 DISCOUNT_RULES

Defines discount amounts for products approaching expiry.

 INVENTORY_LOG

Tracks every stock event (RESTOCK, SALE, EXPIRED, MANUAL) with timestamps.


 4. How to Run the Scripts
Step 1 — Connect to the PDB

Use SQL Developer or SQL*Plus:

Username: RESTOCK_OWNER

Password: Honette

Service Name: TUESDAY_27628_HONETTE_ADAPTIVERESTOCK_DB

Step 2 — Run the CREATE script
@create_tables.sql


This script creates:

all 5 system tables

primary keys

foreign keys

check constraints

unique constraints

defaults

performance indexes

Step 3 — Run the INSERT script
@insert_data.sql


Inserted dataset includes:

Table	Rows
PRODUCTS	200
EXPIRY_TRACKING	300
RESTOCK_RULES	300
DISCOUNT_RULES	100
INVENTORY_LOG	300

All rows follow business rules and realistic perishable-goods behavior.

Step 4 — Run the Validation Queries
@validation_queries.sql


This verifies:

Table creation

Row counts

Constraint enforcement

Index creation

Foreign key integrity

Business rule validation

Data distribution correctness

Screenshots of these results are located inside the screenshots/ folder.

5. Validation Checklist
 All entities converted to tables
 Oracle data types used correctly
 PK and FK constraints enforced
 UNIQUE, CHECK, NOT NULL, DEFAULT constraints implemented
 Indexes created for performance
 100–500+ rows inserted per table Edge cases and realistic testing data included
✔ Validation queries executed successfully
✔ All screenshots captured
