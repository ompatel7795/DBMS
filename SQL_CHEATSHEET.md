# 📚 SQL Quick Reference Cheatsheet

## Common Patterns from All 50 Questions

---

## 🔍 String Operations

### Pattern Matching with LIKE
```sql
-- Starts with 'R'
WHERE Sup_Name LIKE 'R%'

-- Ends with 'a'
WHERE Ename LIKE '%a'

-- Contains 'ee'
WHERE Ename LIKE '%ee%'

-- Contains 'Sharma'
WHERE Author LIKE '%Sharma%'
```

### String Functions
```sql
-- Convert to uppercase
SELECT UPPER(Ename) FROM EmpDetails

-- Combine strings
SELECT CONCAT('Mr. ', Sname) FROM Student
SELECT CONCAT(Ename, ' is working as ', Designation)

-- String length
WHERE LENGTH(Sname) = 5
```

---

## 🔢 Aggregate Functions

```sql
-- Sum of values
SELECT SUM(Salary) AS TotalSalary FROM Employee

-- Average value
SELECT AVG(Salary) FROM Employee

-- Count records
SELECT COUNT(*) AS TotalBooks FROM Library

-- Minimum value
SELECT MIN(Item_Price) FROM Supplier
SELECT MIN(DOJ) FROM Employee  -- Earliest date

-- Maximum value
SELECT MAX(Salary) FROM Employee
```

---

## 📊 GROUP BY Operations

```sql
-- Group and sum
SELECT Publisher, SUM(Price) AS TotalCost 
FROM Library 
GROUP BY Publisher

-- Group and count
SELECT DeptId, COUNT(*) AS EmployeeCount 
FROM Employee 
GROUP BY DeptId

-- Group and average
SELECT Course, AVG(Age) AS AvgAge 
FROM Student 
GROUP BY Course
```

---

## 📅 Date Functions

```sql
-- Extract year
WHERE YEAR(DOJ) = 2011
WHERE YEAR(DOJ) > 2014

-- Extract month (1=Jan, 2=Feb, etc.)
WHERE MONTH(DOJ) = 2

-- Current date
SELECT CURDATE()

-- Calculate date difference
SELECT TIMESTAMPDIFF(YEAR, DOJ, CURDATE()) AS Experience
SELECT TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age
```

---

## 🔄 Sorting (ORDER BY)

```sql
-- Single column ascending
ORDER BY Item_Price ASC

-- Single column descending
ORDER BY Salary DESC

-- Multiple columns
ORDER BY DeptId, Salary ASC
ORDER BY Item_Supplied, Item_Price DESC
ORDER BY Course, Sname ASC
```

---

## 🎯 Filtering (WHERE)

### Single Condition
```sql
WHERE Designation = 'Programmer'
WHERE City = 'Delhi'
WHERE Gender = 'F'
```

### Multiple Conditions (AND)
```sql
WHERE Item_Supplied = 'Processor' AND City = 'Delhi'
WHERE Gender = 'F' AND Course = 'Comp' AND Category = 'OBC'
WHERE Designation = 'Clerk' AND DeptId = 'D2'
```

### Multiple Conditions (OR)
```sql
WHERE City = 'Delhi' OR City = 'Mumbai'
WHERE State = 'Telangana' OR State = 'AndhraPradesh'
```

### IN Operator
```sql
WHERE Item_Supplied IN ('Processor', 'Keyboard')
WHERE State IN ('Telangana', 'AndhraPradesh')
```

### NOT IN Operator
```sql
WHERE Item_Supplied NOT IN ('Processor', 'Keyboard')
WHERE State NOT IN ('Telangana', 'AndhraPradesh')
WHERE Publisher NOT IN ('Himalaya', 'Kalyani')
```

### BETWEEN Operator
```sql
WHERE Salary BETWEEN 30000 AND 45000
WHERE Price BETWEEN 500 AND 700
```

---

## 🔗 Subqueries

### With IN
```sql
-- Find matching items
WHERE Item_Supplied IN (
    SELECT Item_Supplied 
    FROM Supplier 
    WHERE Sup_Name = 'Ramesh'
)
```

### With Comparison
```sql
-- Above average
WHERE Salary > (SELECT AVG(Salary) FROM Employee)

-- Minimum value
WHERE Item_Price = (SELECT MIN(Item_Price) FROM Supplier)

-- Maximum value (earliest date)
WHERE DOJ = (SELECT MIN(DOJ) FROM Employee)
```

---

## 🔗 JOIN Operations

```sql
-- Inner Join
SELECT E.Eid, E.Ename, D.Dname 
FROM Employee E 
INNER JOIN Department D ON E.DeptId = D.DeptId

-- Join with condition
SELECT * 
FROM Employee E 
JOIN Department D ON E.DeptId = D.DeptId 
WHERE E.Salary > 50000
```

---

## ✏️ UPDATE Operations

```sql
-- Simple update
UPDATE Supplier 
SET Item_Price = Item_Price + 200 
WHERE Item_Supplied = 'Keyboard'

-- Update with condition
UPDATE EmpDetails 
SET Salary = Salary + 5000 
WHERE Designation = 'DBA'

-- Update excluding values
UPDATE Library 
SET Price = Price + 200 
WHERE Publisher NOT IN ('Himalaya', 'Kalyani')
```

---

## 🗑️ DELETE Operations

```sql
-- Delete with condition
DELETE FROM Student 
WHERE Course = 'Comp' AND YEAR(DOB) > 2002

-- Delete minimum value
DELETE FROM Supplier 
WHERE Item_Price = (SELECT MIN(Item_Price) FROM Supplier)
```

---

## 🏗️ ALTER TABLE

### Add Column
```sql
-- Single column
ALTER TABLE Supplier 
ADD COLUMN CONTACTNO VARCHAR(15)

-- Multiple columns
ALTER TABLE Student 
ADD COLUMN Contactno VARCHAR(15), 
ADD COLUMN Email VARCHAR(100)
```

### Rename Column
```sql
ALTER TABLE Library 
CHANGE COLUMN Publisher Publications VARCHAR(50)
```

---

## 👁️ CREATE VIEW

```sql
-- Simple view
CREATE VIEW SupplierView AS 
SELECT Sup_No, Sup_Name 
FROM Supplier

-- View with condition
CREATE VIEW TelanganaStudents AS 
SELECT Sid, Sname 
FROM Student 
WHERE State = 'Telangana'

-- View with join
CREATE VIEW EmployeeDept AS 
SELECT E.Eid, E.Ename, D.Dname 
FROM Employee E 
JOIN Department D ON E.DeptId = D.DeptId
```

---

## 🔍 CREATE INDEX

```sql
-- Single column index
CREATE INDEX idx_Sname ON Student(Sname)

-- Composite index (multiple columns)
CREATE INDEX idx_BookName_Author ON Library(BookName, Author)

-- Index for faster searches
CREATE INDEX idx_City ON Supplier(City)
```

---

## 🎭 CASE Expressions

```sql
-- Simple CASE
SELECT 
    CASE 
        WHEN Gender = 'M' THEN CONCAT('Mr. ', Sname)
        WHEN Gender = 'F' THEN CONCAT('Ms. ', Sname)
    END AS StudentName 
FROM Student

-- CASE with conditions
SELECT Ename,
    CASE 
        WHEN Salary > 50000 THEN 'High'
        WHEN Salary > 30000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryLevel
FROM Employee
```

---

## 🎯 DISTINCT

```sql
-- Remove duplicates
SELECT DISTINCT Designation FROM Employee
SELECT DISTINCT Author FROM Library WHERE Publisher = 'Himalaya'
SELECT DISTINCT City FROM Supplier
```

---

## 📋 Common Query Patterns

### Pattern 1: Find Above Average
```sql
SELECT * 
FROM Employee 
WHERE Salary > (SELECT AVG(Salary) FROM Employee)
```

### Pattern 2: Find Earliest/Latest
```sql
-- Highest experience (earliest date)
WHERE DOJ = (SELECT MIN(DOJ) FROM Employee)

-- Most recent (latest date)
WHERE DOJ = (SELECT MAX(DOJ) FROM Employee)
```

### Pattern 3: Same as Another
```sql
SELECT Sup_Name 
FROM Supplier 
WHERE Item_Supplied IN (
    SELECT Item_Supplied 
    FROM Supplier 
    WHERE Sup_Name = 'Ramesh'
)
```

### Pattern 4: Format Output
```sql
SELECT CONCAT(Ename, ' is working as ', Designation, 
              ' with a Salary of Rs.', Salary) AS Info 
FROM EmpDetails
```

### Pattern 5: Calculate Age/Experience
```sql
SELECT Sid, Sname, 
    TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age 
FROM Student
```

---

## 🚫 Common Mistakes to Avoid

1. **Forgetting WHERE in UPDATE/DELETE**
   ```sql
   -- WRONG: Updates all records
   UPDATE Employee SET Salary = 50000
   
   -- CORRECT: Updates specific records
   UPDATE Employee SET Salary = 50000 WHERE Eid = 101
   ```

2. **Missing Parentheses in Subqueries**
   ```sql
   -- WRONG
   WHERE Salary > SELECT AVG(Salary) FROM Employee
   
   -- CORRECT
   WHERE Salary > (SELECT AVG(Salary) FROM Employee)
   ```

3. **Using = instead of LIKE for patterns**
   ```sql
   -- WRONG: Won't work
   WHERE Ename = '%a'
   
   -- CORRECT
   WHERE Ename LIKE '%a'
   ```

4. **Forgetting ASC/DESC**
   ```sql
   -- Default is ASC, but be explicit
   ORDER BY Salary DESC  -- High to low
   ORDER BY Salary ASC   -- Low to high
   ```

---

## 💡 Quick Tips

1. **LIKE Wildcards**
   - `%` = Any number of characters
   - `_` = Exactly one character

2. **Date Comparisons**
   - MIN(date) = Earliest
   - MAX(date) = Latest

3. **NULL Handling**
   - Use `IS NULL` not `= NULL`
   - Use `IS NOT NULL` not `!= NULL`

4. **String Functions**
   - UPPER() - Uppercase
   - LOWER() - Lowercase
   - CONCAT() - Join strings
   - LENGTH() - String length

5. **Aggregate Functions**
   - Always return single value
   - Can use in subqueries
   - Need GROUP BY for per-group aggregates

---

## 🎯 Exam Strategy

1. **Read Carefully**: Understand what question asks
2. **Identify Operation**: SELECT, UPDATE, DELETE, etc.
3. **Check Conditions**: Single or multiple WHERE
4. **Pick Right Function**: String, date, or aggregate
5. **Test Logic**: Think through the result

---

## 📱 Print This!

This cheatsheet covers all patterns from the 50 questions.
Keep it handy during practice and exams!

---

**Master these patterns = Master the exam! 🎯**

*Quick Reference for DBMS Practical Exam 2025*