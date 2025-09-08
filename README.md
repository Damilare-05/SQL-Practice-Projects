

# SQL-Practice-Projects

[![Repository Star](https://img.shields.io/github/stars/Damilare-05/SQL-Practice-Projects?style=social)](https://github.com/Damilare-05/SQL-Practice-Projects/stargazers)

---

## Overview / Description

This repository contains a collection of SQL practice files aimed at exploring and improving SQL skills using **Microsoft SQL Server (T-SQL)**. It includes structured practice tasks, checkpoints, a final project, and solutions—perfect for learners, educators, or anyone sharpening their querying abilities.

Use cases include:

* Practicing DQL (Data Query Language) fundamentals and advanced queries.
* Building a solid understanding of SQL through hands-on exercises.
* Reviewing solution patterns and project workflows.

---

## Features

* A variety of practice files with incremental difficulty
* Checkpoint SQL files to validate skills at stages (`Checkpoint1.sql`, `Checkpoint2.sql`)
* A comprehensive "Practice Questions for DQL Statements.sql" file with targeted exercises
* A "Final Project" file that integrates concepts in a cohesive manner
* A solution file to reference best practices and compare query logic

---

## Installation Instructions

```bash
# 1. Clone the repository
git clone https://github.com/Damilare-05/SQL-Practice-Projects.git
cd SQL-Practice-Projects

# 2. Open *.sql files using Microsoft SQL Server tools:
#    - Microsoft SQL Server Management Studio (SSMS)
#    - Azure Data Studio
#    - Any T-SQL-supportive IDE

# 3. Execute files in a logical progression:
#    a) Run Checkpoint files (Checkpoint1.sql, Checkpoint2.sql)
#    b) Work through Practice Questions for DQL Statements.sql
#    c) Attempt the Final Project (SQL Final project.sql)
#    d) Review queries in Solution.ssmssln or associated solution file

# 4. (Optional) Create a new database for assignments:
-- In SSMS:
CREATE DATABASE SQLPractice;
USE SQLPractice;
-- Then run the .sql files within this context
```

---

## Usage

### Example Workflow:

1. Open **Checkpoint1.sql** in SSMS; attempt the problems, run queries to test and experiment.
2. Progress to **Practice Questions for DQL Statements.sql**: modify, challenge yourself, add comments or queries.
3. Complete the **SQL Final project.sql**, combining multiple concepts from earlier exercises.
4. Compare your solutions against the **Solution.ssmssln** (Visual Studio solution file) or equivalent for clarity and improvement.

### Sample Output

While the repository doesn’t include screenshots, you can expect outputs like:

```sql
-- Sample query result after running a SELECT:
SELECT TOP 5 * FROM Orders;
-- Returns first 5 rows from Orders table in tabular format
```

---

## Project Structure

```
/
├── Checkpoint1.sql                   # First set of practice checkpoint queries
├── Checkpoint2.sql                   # Second checkpoint level
├── Practice Questions for DQL Statements.sql  # Core DQL practice exercises
├── SQL Final project.sql             # Comprehensive final SQL project file
├── SQLAssignmentGomyCode.sql         # Possibly an assignment or earlier practice file
├── SQLQueryPractice.sql              # Additional practice queries
├── Solution.ssmssln                  # Visual Studio solution with corresponding queries
├── README.md                         # This file
```

---

## Technologies Used

* **Microsoft SQL Server ** — Query execution and database environment


---

## Contributing Guidelines

Contributions are welcome! Here’s how to get started:

1. Fork the repository and create a feature branch (`feature/add-query-topic`).
2. Add new SQL exercises, checkpoints, or improve existing ones.
3. Ensure files are well-commented and logically structured.
4. Commit, then open a Pull Request with a clear description of your additions.

---


## Acknowledgments / Credits

* Self-driven development and practice
* Anyone who reviews, stars, or contributes to this learning repository


