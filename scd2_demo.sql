-- =========================================
-- SCD Type 2 Demo (SQL version)
-- =========================================

-- Step 1: Create Customer Dimension Table
CREATE TABLE CustomerDim (
    CustomerKey INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Name VARCHAR(100),
    City VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    IsCurrent BOOLEAN
);

-- Step 2: Insert Initial Record
INSERT INTO CustomerDim (CustomerID, Name, City, StartDate, EndDate, IsCurrent)
VALUES (1, 'Alice', 'Manila', '2022-01-01', NULL, TRUE);

-- Check table after initial insert
SELECT * FROM CustomerDim;

-- Step 3: Simulate Change (Alice moves to Cebu)
-- Close old record
UPDATE CustomerDim
SET EndDate = '2023-06-30', IsCurrent = FALSE
WHERE CustomerID = 1 AND IsCurrent = TRUE;

-- Insert new record
INSERT INTO CustomerDim (CustomerID, Name, City, StartDate, EndDate, IsCurrent)
VALUES (1, 'Alice', 'Cebu', '2023-07-01', NULL, TRUE);

-- Step 4: Query Current Record
SELECT * FROM CustomerDim WHERE IsCurrent = TRUE;

-- Step 5: Query Historical Record (as of March 2023)
SELECT * FROM CustomerDim
WHERE CustomerID = 1
  AND '2023-03-15' BETWEEN StartDate AND COALESCE(EndDate, '9999-12-31');
