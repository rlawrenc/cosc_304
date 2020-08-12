# DATA 540: Databases and Data Retrieval

Using and querying relational and NoSQL databases for analysis. Experience with SQL, JSON, and programs that use databases.

## Schedule

**Lecture:** Tuesday/Thursday 11:00 a.m. to 12:30 p.m. in SCI 396<br>
**Lab:** Thursday 1:30 p.m. to 3:30 p.m. in SCI 396

|   Date     | Topic  | Reading |
|------------|------|-----------|
| 2019-10-08 | [Relational Database Introduction](lectures/lecture1)  | [SQL for Web Nerds: Introduction](http://philip.greenspun.com/sql/introduction.html) |
| 2019-10-10 | [SQL DDL: CREATE, INSERT, DELETE, UPDATE](lectures/lecture2)  |  |
| 2019-10-15 | [SQL: select, project, join, ORDER BY](lectures/lecture3) | [SQL for Web Nerds: Queries](http://philip.greenspun.com/sql/queries.html) |
| 2019-10-17 | [SQL: GROUP BY, aggregate functions, subqueries, outer joins](lectures/lecture4) |  [SQL for Web Nerds: Complex Queries](http://philip.greenspun.com/sql/complex-queries.html) |
| 2019-10-22 | [Programming with Databases in R and Python](lectures/lecture5)      | [SQL Server and pyodbc](https://docs.microsoft.com/en-us/sql/connect/python/pyodbc/python-sql-driver-pyodbc), [pyodbc](https://github.com/mkleehammer/pyodbc/wiki)<br>[pyodbc Getting Started](https://github.com/mkleehammer/pyodbc/wiki/Getting-started)<br>[Python Database API](https://www.python.org/dev/peps/pep-0249)<br>[Python sqlite3](https://docs.python.org/3/library/sqlite3.html)<br> [MySQL and R Tutorial](https://programminghistorian.org/en/lessons/getting-started-with-mysql-using-r)<br>RStudio: [MySQL](https://db.rstudio.com/databases/my-sql/), [SQLServer](https://db.rstudio.com/databases/microsoft-sql-server/), [DB Queries](https://db.rstudio.com/getting-started/database-queries/),<br> [DBI](https://db.rstudio.com/dbi/), [SQLite](https://db.rstudio.com/databases/sqlite/) |
| 2019-10-24 | SQL Quiz |  |
| 2019-10-29 | [ER/UML Diagrams with Relational Mapping](lectures/lecture6) |  |
| 2019-10-31 | [XML, JSON, and NoSQL](lectures/lecture7) | [Intro to XML/XML Reference](http://www.w3schools.com/xml/xml_whatis.asp)<br>[XMLSchema Reference](https://www.w3schools.com/xml/schema_intro.asp)<br>[XML Validator](https://www.freeformatter.com/xml-validator-xsd.html), [Test XPath](http://cosc304.ok.ubc.ca/rlawrenc/tomcat/xml/xmlquery.html) |
| 2019-11-05 | [Advanced SQL: Views, Security, Transactions](lectures/lecture8) | [MySQL Recursive Query](http://www.mysqltutorial.org/mysql-recursive-cte/) |
| 2019-11-07 | Course Quiz |  |


## Labs

|     | Lab topic   | Lab Date | Due Date |
|-----|-------------|----------|----------|
| [1](labs/lab1) | SQL DDL | 2019-10-10 | 2019-10-17 20:00 |
| [2](labs/lab2) | SQL | 2019-10-17 | 2019-10-24 20:00 |
| [3](labs/lab3) | Database Programming | 2019-10-24 | 2019-10-31 20:00 |
| [4](labs/lab4) | ER diagrams/NoSQL | 2019-10-31 | 2019-11-07 20:00 |

## Quizzes
|     | Date and Time | Topic |
|-----|------|------|
| 1 | 2019-10-24 In-class | SQL | 
| 2 | 2019-11-07 In-class |  All course content  |

## Instructor
Dr. Ramon Lawrence, ASC 349, ramon.lawrence@ubc.ca, 250-807-9390

## TA
Debangsha Sarkar

## Marking and Evaluation
| Item | Weighting |
|------|-----------:|
| Clickers | 10% | 
| Labs | 30% | 
| Quizzes | 60% | 

## Learning Outcomes

After completing this course, students will be able to:

1. Explain the use case for databases and use relational databases and relational model terminology.
2. Write SQL DDL including CREATE and DROP TABLE, INSERT, UPDATE, and DELETE statements.
3. Perform SQL SELECT queries of moderate complexity including SELECT-FROM-WHERE, GROUP BY, ORDER BY, HAVING clauses and queries that contain subqueries, functions, and outer joins.
4. Write code in Python and R that queries a relational database.
5. Understand the components (entity, relationship, attribute) of an Entity-Relationship (ER) diagram in UML class diagram syntax in order to understand a database structure. Be able to convert an ER diagram into the relational model.
6. Fluency with XML and JSON representation formats and querying using XPath.


## Lecture Learning Objectives

1. Relational Database Introduction
      - define database, DBMS, schema, metadata
      - define program-data independence/data abstraction and explain how it is achieved by databases but not by file systems
      - Use relational model terminology: relation, attribute, tuple, domain, degree, cardinality
      - define and compare/contrast: DDL and DML
      - list the properties of relations
      - define superkey, key, candidate key, primary key, foreign key
      - define integrity, constraints, domain constraint, entity integrity constraint, referential integrity constraint
      - given a relation be able to: identify its cardinality, degree, domains, keys, and superkeys and determine if constraints are being violated
      - define: relational algebra, query language
  
2. SQL DDL: CREATE, INSERT, DELETE, UPDATE
      - recognize valid and invalid identifiers
      - explain the key types of constraints and how to enforce them: required (not null) data, domain constraints, entity integrity, referential integrity
      - write a CREATE TABLE statement given a high-level description
      - list what ALTER TABLE can and cannot do 
      - remove a table using DROP TABLE
      - create an index on fields of a table
      - explain how an index helps improve query time
      - write INSERT, DELETE, and UPDATE commands
      
3. SQL: select, project, join, ORDER BY
      * translate English questions into SQL queries that may require:<br>
            - SELECT-FROM-WHERE syntax for selection, projection, and join<br> 
            - renaming and aliasing including queries with multiple copies of the same relation <br>
            - ORDER BY <br>
            - LIMIT/OFFSET <br>
            - DISTINCT to eliminate duplicates <br>
            - UNION, EXCEPT, INTERSECT set operations <br>
            - IS NULL or IS NOT NULL <br>
            - LIKE string pattern matching <br>
      * read SQL queries to determine their output and English meaning

4. SQL: GROUP BY, aggregate functions, subqueries, outer joins
      - write SQL queries containing aggregate functions and calculated fields
      - write SQL queries requiring nested subqueries and the use of the appropriate operators such as comparison operators for single value subqueries, IN, NOT IN, ANY, ALL for table result subqueries, and EXISTS and NOT EXISTS for multiple result subqueries which may or may not contain results
      - lookup documentation on SQL functions supported by a particular database and use them as required in queries
      - explain the purpose of OUTER and NATURAL joins and use them for queries

5. Programming with Databases in R and Python
      - explain the common steps in querying a database using a programming language
      - draw and explain the database-program architecture and the key components
      - write a simple program to query a database in both Python and R
      - use a variety of databases including MySQL, Microsoft SQL Server, and SQLite
      - explain the purpose of ODBC
      - list the components of a database connection URL
      - use dplyr to query a database
      - be able to debug and resolve database connection and usage issues in Python and R code

6. ER/UML Diagrams with Relational Mapping
      - describe the three steps in database design including the results of each step
      - describe differences between conceptual, logical, and physical data models
      - define entity, relationship, and attribute
      - identify on an ER diagram: entity type, relationship type, degree of a relationship, recursive relationship, attribute, multi-valued attribute, derived attribute
      - identify on an ER diagram: primary key, partial primary key
      - identify on an ER diagram: cardinality and participation constraints
      - given an ER diagram, translate to the relational model with sufficient detail to be able to write queries using only an ER diagram in UML syntax

7. XML, JSON, and NoSQL
      - list some advantages of XML
      - given an XML document, determine if it is well-formed
      - given an XML document and a DTD or XML Schema, determine if it is valid
      - know the symbols (?, \*, +) for cardinality constraints in DTDs
      - compare and contrast ID/IDREFs in DTDs with keys and foreign keys in the relational model
      - list some advantages that XML Schema has over DTDs
      - explain why and when namespaces are used
      - given an XML document and query description, write an XPath query to retrieve the appropriate node sequence to answer the query
      - given an XML document and an XPath expression, list the result of evaluating the expression
      - understand the basic constructs used to encode JSON data
      - compare JSON representation versus relational model
      - understand alternative models for representing data besides the relational model
      - list some NoSQL databases and reason about their benefits and issues compared to the relational model for certain problems
      - explain at a high-level how MapReduce works      

8. Advanced SQL: Views, Security, Transactions
      - define views using CREATE VIEW from a high-level description
      - list advantages and disadvantages of views
      - use GRANT/REVOKE syntax
      - list the types of privileges and know when to use them
      - given a SQL command, explain what privileges are required for it to execute
      - explain how views are useful for security
      - define: transaction
      - list ACID properties
      - be aware of WITH RECURSIVE for recursive SQL queries
      
## Grievances and Complaints Procedures
A student who has a complaint related to this course should follow the procedures summarized below.
- The student should attempt to resolve the matter with the instructor first. Students may talk first to someone other than the
instructor if they do not feel, for whatever reason, that they can directly approach the instructor.
- If the complaint is not resolved to the student's satisfaction, the student should go to the departmental chair John Braun at
SCI 388, 807-8032.

## Your Responsibilities
Your responsibilities to this class and to your education as a whole include attendance and participation. You have a
responsibility to help create a classroom environment where all may learn. At the most basic level, this means you will
respect the other members of the class and the instructor and treat them with the courtesy you hope to receive in return.
Inappropriate classroom behavior may include: disruption of the classroom atmosphere, engaging in non-class activities,
talking on a cell-phone, inappropriate use of profanity in classroom discussion, use of abusive or disrespectful language
toward the instructor, a student in the class, or about other individuals or groups.

## Academic Integrity
The academic enterprise is founded on honesty, civility, and integrity. As members of this enterprise, all students are
expected to know, understand, and follow the codes of conduct regarding academic integrity. At the most basic level, this
means submitting only original work done by you and acknowledging all sources of information or ideas and attributing
them to others as required. This also means you should not cheat, copy, or mislead others about what is your work.
Violations of academic integrity (i.e., misconduct) lead to the breakdown of the academic enterprise, and therefore serious
consequences arise and harsh sanctions are imposed. For example, incidences of plagiarism or cheating usually result in a
failing grade or mark of zero on the assignment or in the course. Careful records are kept to monitor and prevent recidivism.
A more detailed description of academic integrity, including the policies and procedures, may be found at
http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,54,111,959. If you have any questions about how academic
integrity applies to this course, consult with the instructor.

## Disability Assistance
If you require disability-related accommodations to meet the course objectives, please contact the Diversity Advisor of
Disability Resources located in the University Centre, Room 227. For more information about Disability Resources or
academic accommodations, please visit the website at: http://students.ok.ubc.ca/drc/welcome.html

## Equity, Human Rights, Discrimination and Harassment
UBC Okanagan is a place where every student, staff and faculty member should be able to study and work in an
environment that is free from human rights based discrimination and harassment. If you require assistance related to an
issue of equity, discrimination or harassment, please contact the Equity Office, your administrative head of unit, and/or your
unit’s equity representative. UBC Okanagan Equity Advisor: ph. 250-807-9291; email equity.ubco@ubc.ca
Web: http://equity.ok.ubc.ca

## Missing an Exam
Only students who miss the final exam for a reason that corresponds to the University of British Columbia Okanagan's
policy on excused absences from examinations will be permitted to take the final exam at a later time. A make-up exam
may have a question format different from the regular exam. If the reason for
absence is satisfactory, the student’s final exam will be worth more of the final grade. Further information on Academic
Concession can be found under Policies and Regulation in the Okanagan Academic Calendar
http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,48,0,0


## Reference Material
* [SQL for Web Nerds](http://philip.greenspun.com/sql/index.html)
* [SQL Tutorial by Software Carpentry](http://swcarpentry.github.io/sql-novice-survey/) - uses SQLite and demonstrates using databases with Python/R
* [SQL in R with dplyr](https://datacarpentry.org/R-ecology-lesson/05-r-and-databases.html)
* [R DBI Package](https://www.rdocumentation.org/packages/DBI)
* [COSC 304](https://people.ok.ubc.ca/rlawrenc/teaching/304/index.html)
