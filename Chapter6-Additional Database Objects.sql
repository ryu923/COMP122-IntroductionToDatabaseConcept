-- Chapter6-Additional Database Objects
-- 1. P187: Generate a sequence for order numbers
CREATE SEQUENCE orders_order#_seq
	START WITH 1021
	INCREMENT BY 1;

SELECT *
	FROM sys.sequences;

-- 2. P189: Inserting a row using a sequence to provide a PRIMARY KEY value
ALTER TABLE Orders
	DROP CONSTRAINT orders_customer#_fk;

INSERT INTO Orders (Order#, Customer#, OrderDate, ShipDate, ShipStreet, ShipCity, ShipState, ShipZip)
	VALUES (NEXT VALUE FOR orders_order#_seq, 1010, '06-APR-09', NULL, '123 WEST MAIN', 'ATLANTA', 'GA', 30418);

-- 3. P190: Order added using a sequence value for the Order#
SELECT Order#, Customer#, OrderDate, ShipDate, ShipStreet, ShipCity, ShipState, ShipZip
	FROM Orders
	WHERE Customer# = 1010;

-- 4. Inserting a row using a sequence to provide a PRIMARY KEY value
ALTER TABLE ORDERITEMS
	DROP CONSTRAINT orderitems_order#_fk;

INSERT INTO ORDERITEMS (Order#, Item#, ISBN, Quantity, PaidEach)
	VALUES ( NEXT VALUE FOR orders_order#_seq, 1, 8117949391, 1, 8.50);

-- 5. P192: Create sequence and table with default value using a sequence
CREATE SEQUENCE test_defval_seq
	START WITH 100
	INCREMENT BY 1
	NO CACHE
	NO CYCLE;

CREATE TABLE test_defval
	(col1 NUMERIC DEFAULT NEXT VALUE FOR test_defval_seq,
	 col2 NUMERIC);

-- 6. P194: Command to change the INCREMENT BY setting for a sequence
ALTER SEQUENCE test_defval_seq
	INCREMENT BY 10;

-- 7. P197: Dropping the ORDERS_ORDER#_SEQ sequence
DROP SEQUENCE orders_order#_seq;

-- 8. P198: Create table with an Identity Column
CREATE TABLE test_ident
(	col1 NUMERIC IDENTITY PRIMARY KEY,
	col2 NUMERIC);

-- 9. P198: Test inserts on Identity Column
INSERT INTO test_ident (col2)
	VALUES (350);

INSERT INTO test_ident (col2)
	VALUES (355);

-- 10. P201: Creating an index on the Zip column
CREATE INDEX customers_zip_idx
	ON customers (zip);

-- 11. P203: View the explain plan indicating a full table scan
SELECT customer#, lastname, city, state, zip
	FROM Customers
	WHERE zip = 49006;

-- 12.P205: Explicitly creating a unique index
CREATE UNIQUE INDEX books_title_idx
	ON customers (zip);

-- 13. P206: Creating a composite index
CREATE INDEX customer_name_idx
	ON customers (lastname, firstname);

-- 14. P213: Create a synonym
CREATE SYNONYM orderentry
	FOR Orders;

-- 15. P214: Using a synonym
SELECT * FROM orderentry
	WHERE Customer# = 1010;

-- 16. P215: Command to delete the ORDERENTRY synonym
DROP SYNONYM orderentry;