-- Chapter 2 Basic SQL SELECT Statements
-- 1. P32
SELECT * FROM Customers;

-- 2. P33: SELECT query
SELECT Title FROM Books;

-- 3. P35: Mulitple columns
SELECT Title, Pubdate
	FROM Books;

-- 4. P37: Using Aliase
SELECT Title AS "Title of Book", Category
	FROM Books;

-- 5. P40: Calculate in column
SELECT Title, Retail-Cost Profit
	FROM Books;

-- 6. P42: Calculate with NULL value
SELECT Title, Retail, Discount, Retail-Discount
	FROM Books;

-- 7. P43: DISTICT for unduplicated values
SELECT DISTINCT State
	FROM Customers;

-- 8. P44: DISTICT for two data
SELECT DISTINCT State, City
	FROM Customers;

-- 9. P45: CONCATENATION '+'
SELECT Firstname + Lastname
	from Customers;

-- 10. P46: CONCATENATION '+' with a space
SELECT Firstname + ' ' + Lastname 'Customer Name'
	from Customers;

-- 11. P48: CONCATENATION with other data *
SELECT CONVERT(NVARCHAR(10), Customer#) + ' : ' + Firstname + ' ' + Lastname "Customer"
	from Customers;

-- 12. P53 Q15 QUERY
SELECT Title, Cost, Cost * 2
	'With 200 % Markup'
	FROM Books;