-- 1. DATABASE & TABLES
CREATE DATABASE RetailStoreDB;
USE RetailStoreDB;

CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockCount INT
);

INSERT INTO Inventory VALUES
(101, 'Laptop', 'Electronics', 80000, 15),
(102, 'Phone', 'Electronics', 50000, 8),
(103, 'Chair', 'Furniture', 5000, 25);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Inventory(ProductID)
);

INSERT INTO Sales VALUES (1, '2025-01-10', 101, 1, 80000), (2, '2025-01-12', 103, 2, 10000);

-- 2. ANALYTICAL QUERIES
-- Query 1: Revenue by Category (JOINS)
SELECT p.Category, SUM(s.TotalAmount) AS TotalRevenue
FROM Inventory p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.Category;

-- Query 2: Stock Alert (CASE STATEMENT)
SELECT ProductName, StockCount,
CASE WHEN StockCount <= 10 THEN 'Reorder' ELSE 'Available' END AS Status
FROM Inventory;
