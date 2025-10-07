DROP TABLE IF EXISTS books;

CREATE TABLE Books(
Books_ID SERIAL PRIMARY KEY,
Title Varchar(150),
Author VARCHAR(50),
Genre VARCHAR(50),
Published_Year INT,
Price NUMERIC(10,2),
Stock INT
);

DROP TABLE IF EXISTS customers;

CREATE TABLE Customers(
Customers_ID SERIAL PRIMARY KEY,
Name Varchar(50),
Email VARCHAR(50),
Phone VARCHAR(15),
City VARCHAR(50),
Country Varchar(150)
);

DROP TABLE IF EXISTS orders;

CREATE TABLE Orders(
Order_ID SERIAL PRIMARY KEY,
Customers_ID INT REFERENCES Customers(Customers_ID),
Book_ID INT REFERENCES Books(Books_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2)
);

--import data into books table
--COPY BOOKS(Books_ID,Title,Genre,Published_Year,Price,Stock)
--FROM 'D:/SQL/Books.csv'
--CSV HEADER;


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

--1) Retrieve all books in the "Fiction" genre
SELECT * FROM Books
WHERE 
genre='Fiction'
;


--2) Find nooks published after the YEar 1950:
SELECT * FROM Books
WHERE
published_year>1950
;


--3) List all the customers from the Canada:
SELECT * FROM Customers
WHERE Country='Canada'
;


--4) Show orders placed in November 2023:
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'
;


--5) Retrieve the total stocks of books available:
SELECT SUM(Stock) AS Total_stocks
FROM Books;


--6) Find the details of the most expensive book:

SELECT * FROM Books
ORDER BY PRICE DESC
LIMIT 1;


--7) Show all the customers who ordered more than 1 quantity of book:

SELECT * FROM Orders
WHERE
quantity>1;


--8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders
WHERE 
total_amount>20;


--9)List all the genre available in the Books Table:
SELECT DISTINCT genre 
FROM Books;


--10) Find the book with the lowest stock:
SELECT * FROM Books
ORDER BY stock ASC
LIMIT 1;


--11) Calculate the total revenue generated from all the Orders:
SELECT SUM(total_amount) 
FROM Orders
AS total_revenue;

--ADVANCE QUERIES

--1) Retrieve the total number of books sold for each revnue:

SELECT * FROM ORDERS;

SELECT b.genre, SUM(o.quantity)  AS Total_Books_Sold
FROM Orders o
JOIN Books b ON o.Book_ID=b.Books_ID
GROUP BY b.genre;


--2)Find the average price of the books in the 'Fantasy' genre:
SELECT AVG(price)  AS Average_Price
FROM Books
WHERE genre='Fantasy'
;


--3) List customers who have placed at least w orders:
SELECT * FROM Orders
SELECT * FROM Books
SELECT * FROM Customers

SELECT c.customers_id,c.name, COUNT(o.order_id) AS ORDER_COUNT
FROM Orders o
JOIN Customers c ON o.customers_id=c.customers_id
GROUP BY c.customers_id, c.name
HAVING COUNT(Order_id)>=2;


--4) Find the most frequently ordered books:
SELECT o.Book_ID,b.Title,COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN Books b ON o.book_id=b.books_id
GROUP BY o.book_id,b.title
ORDER BY ORDER_COUNT DESC
LIMIT 4;


--5)Show the top 3 most expensive books of 'Fantasy' Genre:
SELECT * FROM BOOKS 
WHERE genre='Fantasy'
ORDER BY price DESC 
LIMIT 3;


--6) Retrieve the total quantity of bookssold by each author:
SELECT b.author,SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN Books b ON o.book_id=b.books_id
GROUP BY b.author;


--7) List the cities where customers spent over $30 are located:
SELECT DISTINCT c.city,o.total_amount 
FROM Orders o
JOIN Customers c ON o.customers_id=c.customers_id
WHERE o.total_amount>300;


--8)Find the customer who spent the most on orders:

SELECT c.customers_id,c.name,SUM(o.total_amount) AS Total_spent
FROM Orders o
JOIN customers c ON o.order_ID=c.customers_ID
GROUP BY c.name,c.customers_id
ORDER BY Total_spent DESC
LIMIT 1;


--9) Calculate the stock remaining after the fulfilling all orders:

SELECT b.books_id,b.stock,COALESCE(SUM(o.quantity),0) AS Order_quantity,
b.stock-COALESCE(SUM(o.quantity),0) AS REMAINING_QUANTITY 
FROM books b
LEFT JOIN
orders o ON o.book_id=b.books_id
GROUP BY b.books_id;




















