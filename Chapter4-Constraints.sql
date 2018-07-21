-- Chapter4-Constraints
-- 1. P108: Add a PRIMARY KEY - Already defined.
ALTER TABLE Customers
	ADD CONSTRAINT cusotomers_customer#_pk PRIMARY KEY(customer#);

-- 2. P108: Add a new data into Customers table - Error! Because of the PRIMARY KEY [1020] number is already exist. 
INSERT INTO Customers(Customer#, LastName, FirstName, Region)
	VALUES(1020, 'PADDY', 'JACK', 'NE');

-- 3. P109: Add a new data into Customers table
INSERT INTO Customers(Customer#, LastName, FirstName, Region)
	VALUES(1022, 'PADDY', 'JACK', 'NE');

-- 4. P111: Add a FOREIGN KEY - Already defined.
ALTER TABLE Orders
	ADD CONSTRAINT orders_customer#_fk FOREIGN KEY (Customer#)
	REFERENCES Customers (customer#);

-- 5. P113: FOREIGN KEY constraint using columns in the same table
ALTER TABLE Customers
	ADD CONSTRAINT customers_referred_fk FOREIGN KEY (referred)
	REFERENCES Customers (customer#);

-- 6. P115: Adding a UNIQUE constraint
ALTER TABLE Books
	ADD CONSTRAINT books_title_uk UNIQUE (title);

-- 7. P117: Adding a CHECK constraint to the ORDERS table
ALTER TABLE Orders
	ADD CONSTRAINT orders_shipdate_ck CHECK (orderdate <= shipdate);

-- 8. P119: Adding a CHECK constraint to the ORDERITEMS table
ALTER TABLE Orderitems
	ADD CONSTRAINT orderitems_quantity_ck CHECK (quantity > 0);

-- 9. P120: Adding a NOT NULL constraint - In order to modify from [ALLOW NULL] to [NOT NULL] Drop the constraint PK
ALTER TABLE Orders
	DROP CONSTRAINT orders_customer#_fk;

ALTER TABLE Orders
	ALTER COLUMN Customer# NUMERIC(4) NOT NULL;

ALTER TABLE Orders
	ADD CONSTRAINT orders_customer#_fk FOREIGN KEY (Customer#)
	REFERENCES Customers (customer#);

-- 10. P122: DEPT table creation
CREATE TABLE Dept
(	deptid NUMERIC(2),
	dname NVARCHAR(20) NOT NULL,
	fax NVARCHAR(12),
	
	CONSTRAINT dept_deptid_pk PRIMARY KEY (deptid),
	CONSTRAINT dept_dname_uk UNIQUE (dname));

-- 11. P123: ETYPES table creation
CREATE TABLE Etypes
(	etypeid NUMERIC(2),
	etypename NVARCHAR(20) NOT NULL,
	
	CONSTRAINT etypes_etypeid_pk PRIMARY KEY (etypeid),
	CONSTRAINT etypes_etypename_uk UNIQUE (etypename));

-- 12. P123: EQUIP table creation
CREATE TABLE Equip
(	equipid NUMERIC(3),
	edesc NVARCHAR(30),
	purchase DATE,
	rating CHAR(1),
	deptid NUMERIC(2) NOT NULL,
	etypeid NUMERIC(2),
	
	CONSTRAINT equip_equipid_pk PRIMARY KEY (equipid),
	CONSTRAINT equip_deptid_fk FOREIGN KEY (deptid)
		REFERENCES dept (deptid),
	CONSTRAINT equip_etypeid_fk FOREIGN KEY (etypeid)
		REFERENCES etypes (etypeid),
	CONSTRAINT equip_rating_ck CHECK (rating IN ('A', 'B', 'C')));

-- 13. P128: Disabling and enabling constraints
ALTER TABLE Equip
	NOCHECK CONSTRAINT equip_rating_ck;

ALTER TABLE Equip
	CHECK CONSTRAINT equip_rating_ck;

-- 14. P129: Dropping a NOT NULL constraint by name
ALTER TABLE Equip
	DROP CONSTRAINT equip_rating_ck;