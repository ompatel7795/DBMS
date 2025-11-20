-- ============================================
-- DBMS PRACTICAL EXAM 2025 - ALL 50 SOLUTIONS
-- ITM SLS Baroda University - BTECH III Semester
-- ============================================

-- ==========================================
-- SECTION A: SUPPLIER TABLE (Questions 1-10)
-- ==========================================

-- Q1: Display Supplier numbers and names whose name starts with 'R'
SELECT Sup_No, Sup_Name 
FROM Supplier 
WHERE Sup_Name LIKE 'R%';

-- Q2: Display names of suppliers who supply Processors and city is Delhi
SELECT Sup_Name 
FROM Supplier 
WHERE Item_Supplied = 'Processor' AND City = 'Delhi';

-- Q3: Display names of suppliers who supply same items as supplied by Ramesh
SELECT Sup_Name 
FROM Supplier 
WHERE Item_Supplied IN (
    SELECT Item_Supplied 
    FROM Supplier 
    WHERE Sup_Name = 'Ramesh'
);

-- Q4: Increase the price of Keyboard by 200
UPDATE Supplier 
SET Item_Price = Item_Price + 200 
WHERE Item_Supplied = 'Keyboard';

-- Q5: Display supplier numbers, names and itemprice for Delhi suppliers in ascending order of itemprice
SELECT Sup_No, Sup_Name, Item_Price 
FROM Supplier 
WHERE City = 'Delhi' 
ORDER BY Item_Price ASC;

-- Q6: Add a new column called CONTACTNO
ALTER TABLE Supplier 
ADD COLUMN CONTACTNO VARCHAR(15);

-- Q7: Delete the record whose itemprice is the lowest
DELETE FROM Supplier 
WHERE Item_Price = (
    SELECT MIN(Item_Price) 
    FROM Supplier
);

-- Q8: Create a view displaying only supplier numbers and names
CREATE VIEW SupplierView AS 
SELECT Sup_No, Sup_Name 
FROM Supplier;

-- Q9: Display records in descending order of itemprice for each itemsupplied
SELECT * 
FROM Supplier 
ORDER BY Item_Supplied, Item_Price DESC;

-- Q10: Display suppliers who supply items other than Processor or Keyboard
SELECT * 
FROM Supplier 
WHERE Item_Supplied NOT IN ('Processor', 'Keyboard');


-- ==========================================
-- SECTION B: EMPDETAILS TABLE (Questions 11-20)
-- ==========================================

-- Q11: Display all employees whose designation is Programmer
SELECT * 
FROM EmpDetails 
WHERE Designation = 'Programmer';

-- Q12: Display employees who have joined after 2014
SELECT * 
FROM EmpDetails 
WHERE YEAR(DOJ) > 2014;

-- Q13: Display all employees whose name ends with 'a'
SELECT * 
FROM EmpDetails 
WHERE Ename LIKE '%a';

-- Q14: Display total salary of all employees whose designation is Programmer
SELECT SUM(Salary) AS TotalSalary 
FROM EmpDetails 
WHERE Designation = 'Programmer';

-- Q15: Display all employee names in upper case
SELECT UPPER(Ename) AS EmployeeName 
FROM EmpDetails;

-- Q16: Display details of employee with highest experience
SELECT * 
FROM EmpDetails 
WHERE DOJ = (
    SELECT MIN(DOJ) 
    FROM EmpDetails
);

-- Q17: Display employees whose name contains 'ee'
SELECT * 
FROM EmpDetails 
WHERE Ename LIKE '%ee%';

-- Q18: Increase salaries by 5000 for employees whose designation is DBA
UPDATE EmpDetails 
SET Salary = Salary + 5000 
WHERE Designation = 'DBA';

-- Q19: Display employees whose salary is more than average salary
SELECT * 
FROM EmpDetails 
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM EmpDetails
);

-- Q20: Display in format: "Name is working as Designation with a Salary of Rs.Amount"
SELECT CONCAT(Ename, ' is working as ', Designation, ' with a Salary of Rs.', Salary) AS EmployeeInfo 
FROM EmpDetails;


-- ==========================================
-- SECTION C: EMPLOYEE-DEPARTMENT TABLES (Questions 21-30)
-- ==========================================

-- Q21: Display employees who earn more than average salary
SELECT * 
FROM Employee 
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employee
);

-- Q22: Display Eid, Ename and Dname
SELECT E.Eid, E.Ename, D.Dname 
FROM Employee E 
INNER JOIN Department D ON E.DeptId = D.DeptId;

-- Q23: Sort employee table in descending order of salaries
SELECT * 
FROM Employee 
ORDER BY Salary DESC;

-- Q24: List all job designations without repetitions
SELECT DISTINCT Designation 
FROM Employee;

-- Q25: Display employee details Department wise in ascending order of salaries
SELECT * 
FROM Employee 
ORDER BY DeptId, Salary ASC;

-- Q26: Display all clerks in DeptId D2
SELECT * 
FROM Employee 
WHERE Designation = 'Clerk' AND DeptId = 'D2';

-- Q27: Display employees who joined in year 2011
SELECT * 
FROM Employee 
WHERE YEAR(DOJ) = 2011;

-- Q28: Display employees who joined in month of February
SELECT * 
FROM Employee 
WHERE MONTH(DOJ) = 2;

-- Q29: Display employees whose salary is between 30000 and 45000
SELECT * 
FROM Employee 
WHERE Salary BETWEEN 30000 AND 45000;

-- Q30: Display employee details with work experience till current date
SELECT *, 
    TIMESTAMPDIFF(YEAR, DOJ, CURDATE()) AS Experience_Years 
FROM Employee;


-- ==========================================
-- SECTION D: STUDENT TABLE (Questions 31-40)
-- ==========================================

-- Q31: Display students not from Telangana or AndhraPradesh
SELECT * 
FROM Student 
WHERE State NOT IN ('Telangana', 'AndhraPradesh');

-- Q32: Create view displaying Sid, Sname for students from Telangana
CREATE VIEW TelanganaStudents AS 
SELECT Sid, Sname 
FROM Student 
WHERE State = 'Telangana';

-- Q33: Create index on column Sname
CREATE INDEX idx_Sname ON Student(Sname);

-- Q34: Display female students enrolled in Comp course who belong to OBC
SELECT * 
FROM Student 
WHERE Gender = 'F' AND Course = 'Comp' AND Category = 'OBC';

-- Q35: Display student IDs, names and present age
SELECT Sid, Sname, 
    TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age 
FROM Student;

-- Q36: Display students in ascending order of names for each course
SELECT * 
FROM Student 
ORDER BY Course, Sname ASC;

-- Q37: Delete students enrolled in Comp course who were born after 2002
DELETE FROM Student 
WHERE Course = 'Comp' AND YEAR(DOB) > 2002;

-- Q38: Add two new columns Contactno and Email
ALTER TABLE Student 
ADD COLUMN Contactno VARCHAR(15), 
ADD COLUMN Email VARCHAR(100);

-- Q39: Display student names prefixed with Mr./Ms. based on gender
SELECT 
    CASE 
        WHEN Gender = 'M' THEN CONCAT('Mr. ', Sname)
        WHEN Gender = 'F' THEN CONCAT('Ms. ', Sname)
    END AS StudentName 
FROM Student;

-- Q40: Display student names where length is 5 characters
SELECT Sname 
FROM Student 
WHERE LENGTH(Sname) = 5;


-- ==========================================
-- SECTION E: LIBRARY TABLE (Questions 41-50)
-- ==========================================

-- Q41: Display list of authors from Himalaya publications
SELECT DISTINCT Author 
FROM Library 
WHERE Publisher = 'Himalaya';

-- Q42: Display total cost of books purchased Publisher wise
SELECT Publisher, SUM(Price) AS TotalCost 
FROM Library 
GROUP BY Publisher;

-- Q43: Count total number of books under Kalyani publications
SELECT COUNT(*) AS TotalBooks 
FROM Library 
WHERE Publisher = 'Kalyani';

-- Q44: Rename column Publisher to Publications
ALTER TABLE Library 
CHANGE COLUMN Publisher Publications VARCHAR(50);

-- Q45: Display books in ascending order of DatePurchased
SELECT * 
FROM Library 
ORDER BY DatePurchased ASC;

-- Q46: Create index on fields BookName and Author
CREATE INDEX idx_BookName_Author ON Library(BookName, Author);

-- Q47: Display books whose price is between 500 and 700
SELECT * 
FROM Library 
WHERE Price BETWEEN 500 AND 700;

-- Q48: Increase price by 200 for publishers other than Himalaya or Kalyani
UPDATE Library 
SET Price = Price + 200 
WHERE Publisher NOT IN ('Himalaya', 'Kalyani');

-- Q49: Display books where author name contains 'Sharma'
SELECT * 
FROM Library 
WHERE Author LIKE '%Sharma%';

-- Q50: Create view displaying BookId and BookName for Himalaya publisher
CREATE VIEW HimalayaBooks AS 
SELECT BookId, BookName 
FROM Library 
WHERE Publisher = 'Himalaya';


-- ============================================
-- END OF ALL 50 SOLUTIONS
-- ============================================
-- Total Questions: 50
-- Sections: 5 (A, B, C, D, E)
-- Topics Covered: 
--   - Basic Queries (SELECT, WHERE)
--   - String Operations (LIKE, CONCAT, UPPER)
--   - Aggregate Functions (SUM, AVG, COUNT, MIN, MAX)
--   - Date Functions (YEAR, MONTH, TIMESTAMPDIFF)
--   - Data Manipulation (UPDATE, DELETE, INSERT)
--   - Table Modifications (ALTER TABLE)
--   - Views (CREATE VIEW)
--   - Indexes (CREATE INDEX)
--   - Joins (INNER JOIN)
--   - Subqueries
--   - CASE Expressions
-- ============================================