# DBMS Practical Exam 2025 - Complete Solution Summary

## ✅ All 50 Questions Solved!

### Quick Reference Guide

---

## 📚 Section A: Supplier Table (Q1-10)

| Q# | Topic | Key SQL Concept |
|----|-------|----------------|
| 1  | Names starting with 'R' | `LIKE 'R%'` |
| 2  | Multiple conditions | `AND` operator |
| 3  | Same items as another supplier | Subquery with `IN` |
| 4  | Update price | `UPDATE SET` |
| 5  | Sort by price | `ORDER BY ASC` |
| 6  | Add column | `ALTER TABLE ADD COLUMN` |
| 7  | Delete lowest price | `DELETE` with `MIN()` |
| 8  | Create view | `CREATE VIEW` |
| 9  | Sort by item then price | Multi-column `ORDER BY` |
| 10 | Exclude items | `NOT IN` |

---

## 📚 Section B: EmpDetails Table (Q11-20)

| Q# | Topic | Key SQL Concept |
|----|-------|----------------|
| 11 | Filter by designation | Simple `WHERE` |
| 12 | Joined after 2014 | `YEAR(DOJ) > 2014` |
| 13 | Names ending with 'a' | `LIKE '%a'` |
| 14 | Total salary | `SUM()` aggregate |
| 15 | Uppercase names | `UPPER()` function |
| 16 | Highest experience | `MIN(DOJ)` |
| 17 | Names containing 'ee' | `LIKE '%ee%'` |
| 18 | Increase DBA salaries | `UPDATE` with condition |
| 19 | Above average salary | Subquery with `AVG()` |
| 20 | Format string output | `CONCAT()` |

---

## 📚 Section C: Employee-Department (Q21-30)

| Q# | Topic | Key SQL Concept |
|----|-------|----------------|
| 21 | Above average salary | `AVG()` subquery |
| 22 | Join tables | `INNER JOIN` |
| 23 | Sort by salary | `ORDER BY DESC` |
| 24 | Unique designations | `DISTINCT` |
| 25 | Sort by dept & salary | Multi-level sort |
| 26 | Clerks in D2 | Multiple `AND` |
| 27 | Joined in 2011 | `YEAR()` function |
| 28 | Joined in February | `MONTH()` function |
| 29 | Salary range | `BETWEEN` |
| 30 | Calculate experience | `TIMESTAMPDIFF()` |

---

## 📚 Section D: Student Table (Q31-40)

| Q# | Topic | Key SQL Concept |
|----|-------|----------------|
| 31 | Exclude states | `NOT IN` |
| 32 | View for Telangana | `CREATE VIEW` |
| 33 | Index on name | `CREATE INDEX` |
| 34 | Female OBC Comp | Triple `AND` |
| 35 | Calculate age | `TIMESTAMPDIFF()` |
| 36 | Sort by course & name | Multi-column sort |
| 37 | Delete Comp after 2002 | `DELETE` with conditions |
| 38 | Add two columns | Multiple `ADD COLUMN` |
| 39 | Gender prefix | `CASE WHEN` |
| 40 | Name length 5 | `LENGTH()` |

---

## 📚 Section E: Library Table (Q41-50)

| Q# | Topic | Key SQL Concept |
|----|-------|----------------|
| 41 | Authors from publisher | `DISTINCT` with `WHERE` |
| 42 | Total cost per publisher | `GROUP BY` with `SUM()` |
| 43 | Count books | `COUNT()` |
| 44 | Rename column | `CHANGE COLUMN` |
| 45 | Sort by purchase date | `ORDER BY` date |
| 46 | Composite index | Multi-column index |
| 47 | Price range | `BETWEEN` |
| 48 | Update excluding publishers | `NOT IN` with `UPDATE` |
| 49 | Author contains Sharma | `LIKE '%Sharma%'` |
| 50 | View for Himalaya | `CREATE VIEW` |

---

## 🎯 SQL Concepts Coverage

### String Operations (10 questions)
- LIKE with wildcards (%, _)
- CONCAT for string joining
- UPPER/LOWER for case conversion
- LENGTH for string size

### Aggregate Functions (8 questions)
- SUM() - Total values
- AVG() - Average values
- COUNT() - Count records
- MIN() - Minimum value
- MAX() - Maximum value

### Date Functions (6 questions)
- YEAR() - Extract year
- MONTH() - Extract month
- CURDATE() - Current date
- TIMESTAMPDIFF() - Calculate difference

### Table Operations (8 questions)
- CREATE VIEW (4 times)
- CREATE INDEX (2 times)
- ALTER TABLE (2 times)

### Data Manipulation (8 questions)
- UPDATE (3 times)
- DELETE (2 times)
- INSERT operations

### Advanced Queries (10 questions)
- Subqueries (5 times)
- JOIN operations (1 time)
- CASE expressions (1 time)
- GROUP BY (1 time)
- DISTINCT (2 times)

---

## 💡 Pro Tips for Exam

1. **Pattern Matching**
   - `LIKE 'R%'` → Starts with R
   - `LIKE '%a'` → Ends with a
   - `LIKE '%ee%'` → Contains ee

2. **Common Mistakes to Avoid**
   - Don't forget WHERE clause in UPDATE/DELETE
   - Use parentheses in subqueries
   - Remember ASC/DESC in ORDER BY
   - Check date format in comparisons

3. **Quick Syntax Reference**
   ```sql
   -- Filtering
   WHERE condition AND condition
   WHERE column IN (value1, value2)
   WHERE column BETWEEN value1 AND value2
   
   -- Aggregation
   SELECT COUNT(*) FROM table
   SELECT SUM(column) FROM table GROUP BY other_column
   
   -- Joins
   SELECT * FROM table1 JOIN table2 ON table1.id = table2.id
   
   -- Modification
   UPDATE table SET column = value WHERE condition
   DELETE FROM table WHERE condition
   ALTER TABLE table ADD COLUMN column_name datatype
   ```

4. **Time-Saving Tips**
   - Read question carefully for exact requirements
   - Identify key SQL operation needed
   - Use copy button to get clean code
   - Understand explanation to grasp concept

---

## 📊 Question Difficulty Distribution

- **Easy** (20 questions): Basic SELECT, WHERE, simple conditions
- **Medium** (20 questions): Aggregate functions, date operations, sorting
- **Hard** (10 questions): Subqueries, joins, complex conditions, views

---

## 🎓 Study Strategy

### Day 1-2: Basic Operations
- Focus on Sections A & B (Q1-20)
- Practice WHERE clauses
- Master string operations

### Day 3-4: Intermediate Concepts
- Focus on Sections C & D (Q21-40)
- Practice aggregate functions
- Understand date operations

### Day 5: Advanced Topics
- Focus on Section E (Q41-50)
- Practice views and indexes
- Master GROUP BY

### Day 6: Revision
- Review all 50 questions
- Practice difficult ones
- Time yourself

---

## ✨ Website Features You Can Use

1. **Navigation Bar**: Jump to any section instantly
2. **Copy Button**: One-click code copying
3. **Explanations**: Understand each solution
4. **Mobile Friendly**: Study on any device
5. **Scroll to Top**: Quick navigation
6. **Smooth Animations**: Better reading experience

---

## 🚀 How to Use This Website

1. Open index.html in your browser
2. Use navigation to jump to sections
3. Read each question carefully
4. Try solving it yourself first
5. Check the solution
6. Read the explanation
7. Click copy to save the code
8. Practice variations

---

## 📱 Access Anywhere

This website works on:
- 💻 Desktop computers
- 📱 Mobile phones
- 📱 Tablets
- 🌐 Any modern browser

---

**Good luck with your DBMS Practical Exam! 🎯**

Remember: Understanding > Memorization

---

*Website created with ❤️ for DBMS students*