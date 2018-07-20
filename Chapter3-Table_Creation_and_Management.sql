-- Chapter3-Table_Creation_and_Management
-- P64: Create Table
DROP TABLE Acctmanager;

CREATE TABLE Acctmanager
(	amid NVARCHAR(12),
	amfirst NVARCHAR(12),
	amlast NVARCHAR(12),
	amdate DATE DEFAULT GETDATE(),
	amsal NUMERIC(8,2),
	amcomm NUMERIC(7,2) DEFAULT 0,
	amearn AS (amsal + amcomm),
	region NVARCHAR(2));

-- P71: Copy Table data into a new table
SELECT customer#, city, state, zip, referred, region
	INTO Cust_mkt
	FROM Customers;

-- P73: Add [ext] column into Publisher table
ALTER TABLE Publisher
	ADD ext NUMERIC(4);

-- P75: Modify column in table (Original NVARCHAR(30) change to NVARCHAR(40): It should be larger number than original)
ALTER TABLE Books
	ALTER COLUMN title NVARCHAR(40);

-- P79: DROP column
ALTER TABLE Publisher
	DROP COLUMN ext;

-- P83: RENAME table
EXEC sp_rename 'Cust_mkt', 'Cust_mkt_092009';

-- P85: TRUNCATE Table - Delete data in table (Table is not deleted, only data)
TRUNCATE TABLE Cust_mkt_092009;

-- P86: DROP Table
DROP TABLE Cust_mkt_092009;