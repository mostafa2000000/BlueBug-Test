-- Create database
CREATE DATABASE BooksDB;
GO

-- Use database
USE BooksDB;
GO

-- Create Books table
CREATE TABLE Books (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(500) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    rating INT NOT NULL,
    in_stock BIT NOT NULL,
    url NVARCHAR(1000) NOT NULL
);
GO

-- Import CSV data
BULK INSERT Books
FROM 'C:\Users\mostafa.hussin\Desktop\Books.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

-- Check number of imported books
SELECT COUNT(*) AS total_books
FROM Books;
GO

-- 1. Average price for each rating
SELECT
    rating,
    ROUND(AVG(price), 2) AS average_price
FROM Books
GROUP BY rating
ORDER BY rating;
GO

-- 2. Five most expensive books rated 4 or 5
SELECT TOP 5
    title,
    price,
    rating
FROM Books
WHERE rating IN (4, 5)
ORDER BY price DESC;
GO

-- 3. Out-of-stock books per rating
SELECT
    rating,
    SUM(
        CASE
            WHEN in_stock = 0 THEN 1
            ELSE 0
        END
    ) AS out_of_stock
FROM Books
GROUP BY rating
ORDER BY rating;
GO