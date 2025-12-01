Adaptive Restocking and Expiry Tracking for Online Perishable Goods Store

Student: Honette Uwase — ID: 27628 Group: Tuesday Group

Create and configure a fully functional Oracle Pluggable Database (PDB) for the Adaptive Restocking System.

Pluggable Database Creation SQL Script Used
CREATE PLUGGABLE DATABASE tuesday_27628_honette_adaptiveRestock_db ADMIN USER restock_admin IDENTIFIED BY Honette ROLES = (DBA) FILE_NAME_CONVERT = ( 'C:/APP/RUGEROOLSEN/PRODUCT/21C/ORADATA/ORADATA/XE/PDBSEED/', 'C:/APP/RUGEROOLSEN/PRODUCT/21C/ORADATA/ORADATA/XE/tuesday_27628_honette_adaptiveRestock_db/' );

Output Pluggable database TUESDAY_27628_HONETTE_ADAPTIVERESTOCK_DB created.

📸 Screenshot #1 – PDB Created

/docs/screenshots_phase4/pdb_created.png

Open the PDB and Verify SQL Commands
ALTER PLUGGABLE DATABASE TUESDAY_27628_HONETTE_ADAPTIVERESTOCK_DB OPEN READ WRITE;

SELECT con_id, name, open_mode FROM v$pdbs WHERE name = 'TUESDAY_27628_HONETTE_ADAPTIVERESTOCK_DB';

ALTER SESSION SET CONTAINER = TUESDAY_27628_HONETTE_ADAPTIVERESTOCK_DB;

SHOW CON_NAME;

READ WRITE

📸 Screenshot #2 – PDB Opened & Container Verified

/docs/screenshots_phase4/pdb_opened.png

SQL Developer Connection Setup
Connection Name: Honette_PDB Username: restock_admin Role: Default Service Name: TUESDAY_27628_HONETTE_ADAPTIVERESTOCK_DB

📸 Screenshot #3 – SQL Developer Connection “Success”

/docs/screenshots_phase4/connection_success.png

Tablespace Creation SQL Script
-- Data tablespace CREATE TABLESPACE restock_data_ts DATAFILE 'C:/APP/.../tuesday_27628_honette_adaptiveRestock_db/restock_data01.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE 1G;

-- Index tablespace CREATE TABLESPACE restock_index_ts DATAFILE 'C:/APP/.../tuesday_27628_honette_adaptiveRestock_db/restock_index01.dbf' SIZE 50M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

-- Temp tablespace CREATE TEMPORARY TABLESPACE restock_temp_ts TEMPFILE 'C:/APP/.../tuesday_27628_honette_adaptiveRestock_db/restock_temp01.dbf' SIZE 50M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

📸 Screenshot #4 – Tablespaces Created Successfully

/docs/screenshots_phase4/tablespaces_created.png

Autoextend Verification SQL Commands SELECT tablespace_name, autoextensible FROM dba_data_files WHERE tablespace_name IN ('RESTOCK_DATA_TS','RESTOCK_INDEX_TS');
SELECT tablespace_name, autoextensible FROM dba_temp_files WHERE tablespace_name = 'RESTOCK_TEMP_TS';

all should show YES

📸 Screenshot #5 – Autoextend Verified

/docs/screenshots_phase4/autoextend_verified.png

Memory Parameters (SGA & PGA)
SHOW PARAMETER sga;

PGA SHOW PARAMETER pga;

📸 Screenshot #6 – SGA Parameters

/docs/screenshots_phase4/sga_output.png

📸 Screenshot #7 – PGA Parameters

/docs/screenshots_phase4/pga_output.png

Archive Logging Status
SELECT log_mode FROM v$database;

Expected (because Oracle XE): NOARCHIVELOG

📸 Screenshot #8 – Archive Log Status

/docs/screenshots_phase4/archive_log_status.png

Create Project Super User (restock_owner)
CREATE USER restock_owner IDENTIFIED BY Honette DEFAULT TABLESPACE restock_data_ts TEMPORARY TABLESPACE restock_temp_ts QUOTA UNLIMITED ON restock_data_ts;

GRANT CONNECT TO restock_owner; GRANT RESOURCE TO restock_owner;

-- Extra privileges (for XE) GRANT CREATE SESSION TO restock_owner; GRANT CREATE TABLE TO restock_owner; GRANT CREATE VIEW TO restock_owner; GRANT CREATE TRIGGER TO restock_owner; GRANT CREATE PROCEDURE TO restock_owner; GRANT CREATE SEQUENCE TO restock_owner; GRANT UNLIMITED TABLESPACE TO restock_owner;

Verify the User SQL
SELECT username, account_status, default_tablespace, temporary_tablespace FROM dba_users WHERE username = 'RESTOCK_OWNER';

📸 Screenshot #9 – User Verification

/docs/screenshots_phase4/restock_owner_verified.png
