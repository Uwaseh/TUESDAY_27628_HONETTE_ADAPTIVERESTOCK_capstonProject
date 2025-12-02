CREATE PLUGGABLE DATABASE tuesday_27628_honette_adaptiveRestock_db
  ADMIN USER restock_admin IDENTIFIED BY Honette
  ROLES = (DBA)
  FILE_NAME_CONVERT = (
    'C:\APP\RUGEROOLSEN\PRODUCT\21C\ORADATA\ORADATA\XE\PDBSEED\',
    'C:\APP\RUGEROOLSEN\PRODUCT\21C\ORADATA\ORADATA\XE\tuesday_27628_honette_adaptiveRestock_db\'
  );

ALTER SESSION SET CONTAINER = TUESDAY_27628_HONETTE_ADAPTIVERESTOCK_DB;
SHOW CON_NAME;

//creation of table space

CREATE TABLESPACE restock_data_ts
  DATAFILE 'C:/APP/RUGEROOLSEN/PRODUCT/21C/ORADATA/ORADATA/XE/tuesday_27628_honette_adaptiveRestock_db/restock_data01.dbf'
  SIZE 100M 
  AUTOEXTEND ON NEXT 10M 
  MAXSIZE 1G;

-- INDEX TABLESPACE
CREATE TABLESPACE restock_index_ts
  DATAFILE 'C:/APP/RUGEROOLSEN/PRODUCT/21C/ORADATA/ORADATA/XE/tuesday_27628_honette_adaptiveRestock_db/restock_index01.dbf'
  SIZE 50M 
  AUTOEXTEND ON NEXT 10M 
  MAXSIZE 500M;

-- TEMPORARY TABLESPACE
CREATE TEMPORARY TABLESPACE restock_temp_ts
  TEMPFILE 'C:/APP/RUGEROOLSEN/PRODUCT/21C/ORADATA/ORADATA/XE/tuesday_27628_honette_adaptiveRestock_db/restock_temp01.dbf'
  SIZE 50M 
  AUTOEXTEND ON NEXT 10M 
  MAXSIZE 500M;


--Tablespace verfication
SELECT tablespace_name, contents
FROM dba_tablespaces
WHERE tablespace_name LIKE 'RESTOCK%';

SELECT tablespace_name, file_name, autoextensible
FROM dba_data_files
WHERE tablespace_name IN ('RESTOCK_DATA_TS', 'RESTOCK_INDEX_TS');

SELECT tablespace_name, file_name, autoextensible
FROM dba_temp_files
WHERE tablespace_name = 'RESTOCK_TEMP_TS';


-- Memory parameters (SGA)
SHOW PARAMETER sga;