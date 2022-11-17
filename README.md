# COSC 304 - Introduction to Databases - Winter 2022 Term 1

**Lecture:** 6:30 to 8:00 p.m. Monday/Wednesday in ASC 140 and live-stream on Zoom<br>
**Lab:** Drop-in virtual labs and help sessions

## Instructor
Dr. Ramon Lawrence, ASC 349, ramon.lawrence@ubc.ca, 250-807-9390<br>
**Office Hours:**	1 to 3 p.m. Mondays or by appointment<br>
**Office Location:** ASC 349 and virtual office hours on Zoom

## TAs Drop-in Session Hours
| Day/Time |  TA/Instructor |
|----------|----------------|
| Monday 9 to 11 a.m.  | 	Eranga Desaa / Ivan Carvalho / Omar Abdelaziz |
| Monday 1 to 3 p.m. | Dr. Ramon Lawrence |
| Monday 6:30 to 8 p.m. (class time)	| Eranga Desaa |
| Tuesday 2 to 4 p.m.	| Ivan Carvalho / Devon MacNeil |
| Wednesday 9 to 11 a.m.	| Omar Abdelaziz / Eranga Desaa |
| Wednesday 6:30 to 8 p.m. (class time)	| Devon MacNeil |
| Thursday 9 to 11 a.m. |	Omar Abdelaziz |
| Thursday 2 to 4 p.m. |	Ivan Carvalho |
| Friday 1 to 5 p.m. |	Devon MacNeil |

## Course Description
**Official Calendar:** Databases from a user's perspective: querying with SQL, designing with UML, and using programs to analyze data. Construction of database-driven applications and websites and experience with current database technologies.  Completion of COSC 121 is recommended.
**Prerequisite:** One of COSC 111, COSC 123, COSC 210. Third-year standing.

**Specific description:** This course provides an introduction to database systems including database querying, design, and programming. The course consists of three major components. The first component explains databases from a user perspective including how to query using SQL and relational algebra. The second component involves designing relational databases using Entity-Relationship (ER) diagrams and UML. The last part involves database and web programming with Java, JDBC, JSP, Python, and PHP. Students completing the course have experience with current database technologies, and the ability to use and develop databases and associated applications.

## Course Objectives
**Course Format:** Interactive classes consisting of topic introduction, understanding evaluation using quick questions, and concept mastery with larger exercises.  Practical skills and applications of topics covered in assignments as well as practice using industrial database systems and software.

**Learning Outcomes:**
 - Describe how databases provide data abstraction and simplify writing programs to store and manipulate data.
 - Create relational algebra queries on relational databases using selection, projection, join, and set operators.
 - Construct SQL CREATE TABLE, INSERT, UPDATE, DELETE, and SELECT statements including queries with multiple joins, aggregation, grouping, and subqueries. Explain the translation of a SQL query into relational algebra operators.
 - Analyze and understand existing database designs, design new databases using ER/UML modeling, and convert designs to the relational model including proper modeling of primary and foreign keys.
 - Develop programs and web sites that access a database to read data, perform analysis, and display output.
 - Use JSON and XML for data exchange and representation.
 - Execute and deploy databases on a computer using virtualization/containerization technology such as Docker.
<!-- - Implement database security using user accounts/passwords and managing SQL privileges using GRANT and REVOKE. -->

## Marking and Evaluation
| Item | Weighting | Description |
|------|-----------|-------------|
| Quizzes and Exercises | 10% | Online and during class time activities |
| Assignments | 25% | Weekly assignments |
| Midterm #1 | 15% | October 12th in class | 
| Midterm #2 | 15% | November 2nd in class | 
| Final Exam | 35% | Cumulative, 2.5 hours, **exams require a laptop** <br> **December 14, 2022 at 7:00PM in COM 201** | 

**A student must receive a combined grade of at least 50% on the exams (midterms and final) to pass the course.  Otherwise, the student receives a maximum overall grade of 45.**

## Textbook and Reference Material
 - All notes are online.
 - A textbook is not required. Students can get supplemental material from any database textbook.
 - The course uses iClicker Cloud (free). [Setup instructions for iClicker Cloud Student Account](https://lthub.ubc.ca/guides/iclicker-cloud-student-guide/). [iClicker Cloud (REEF) Login](http://app.reef-education.com/)

## Expectations
 - Attend all classes and prepare before attending class. 
 - Read the notes before the class time. **Expect to spend about five hours per week in out-of-class preparation.**
 - Learn the material in the course by completing all assignments. **No late assignments are accepted.**
 - Enjoy attending class activities and participate according to your personality.  Ask questions by posting on chat or raising your hand.
 - Please actively participate in class discussions, questions, and problem solving exercises.
 - **I want all students to pass the course, receive a good grade, and feel the course was beneficial.**

## Schedule


|   Date | Topic  | Reading and Resources |
|------------|------|-----------|
| Sept. 7 (W) | [**First day of classes.  Introduction to course**](topics/1_introduction)<br> [Introduction to databases](topics/2_database_introduction) | [SQL for Web Nerds: SQL Introduction](https://philip.greenspun.com/sql/introduction.html) |
| Sept. 12 (M) | [Relational Model - Schemas, Keys, Constraints, Integrity](topics/3_relational_model) |  |
| Sept. 14 (W) | [Relational Algebra - Select, Project, Set Ops, Outer Joins](topics/4_relational_algebra) | [Online Relational Algebra Tool](https://dbis-uibk.github.io/relax/), [WorksOn Data Set](https://gist.github.com/rlawrenc/5a7eb3f69cbea033c04c3cdf680a2e39), [Bank Data Set](https://gist.github.com/rlawrenc/51721bd35f05ce3ef7391ff826f8f81a) |
| Sept. 19 (M) | [SQL DDL – Create table/index, Insert/Delete/Update](topics/5_sql_ddl)<br> **No class due to national day of mourning** | |
| Sept. 21 (W) | [SQL - Queries, LIKE operator, Set Operations, Order By](topics/6_sql) | [SQL for Web Nerds: SQL Queries](https://philip.greenspun.com/sql/queries.html) |
| Sept. 26 (M) | [SQL - Group By, Aggregate Functions](topics/7_sql_aggregation) | [SQL for Web Nerds: SQL Complex Queries](https://philip.greenspun.com/sql/complex-queries.html) |
| Sept. 28 (W) | [SQL - Subqueries, Outer joins](topics/7_sql_aggregation) | |
| Oct. 3 (M) | [Database Design – General Approach](topics/8_db_design)<br>[ER and UML Modeling](topics/9_er_design) | |
| Oct. 5 (W) | [ER and UML Modeling examples and questions](topics/9_er_design) <br>(**TA will deliver class.**) | |
| Oct. 10 (M) | **No class due to Thanksgiving** | |
| Oct. 12 (W) | **Midterm Exam #1 In-Class** | |
| Oct. 17 (M) | [EER Design - Specialization, Generalization, Aggregation](topics/10_eer_design)<br>[ER/EER Mapping to Relational model](topics/11_er_to_relational) | |
| Oct. 19 (W) | [Database Programming using Java/JDBC](topics/12_db_programming) | [Sample Java Code](topics/12_db_programming/code), [JDBC Tutorial](https://docs.oracle.com/javase/tutorial/jdbc/index.html)  |
| Oct. 24 (M) | [Database Programming using Python and R](topics/13_db_python_programming) | [Sample Python Code](topics/13_db_python_programming/code), [SQL Server and pyodbc](https://docs.microsoft.com/en-us/sql/connect/python/pyodbc/python-sql-driver-pyodbc), [pyodbc](https://github.com/mkleehammer/pyodbc/wiki)<br> [pyodbc Getting Started](https://github.com/mkleehammer/pyodbc/wiki/Getting-started), [Python Database API](https://www.python.org/dev/peps/pep-0249), [Python sqlite3](https://docs.python.org/3/library/sqlite3.html)  |
| Oct. 26 (W) | [Database Web Programming – Web servers, JSP/PHP](topics/14_web_programming) <br>(**TA will deliver class.**) | [Sample JSP/PHP Code](topics/14_web_programming/code)<br> [Comic - Why validation is important](https://xkcd.com/327/) |
| Oct. 31 (M) | [Advanced SQL DDL – Triggers](topics/15_triggers)<br> [Advanced SQL DDL – Views](topics/16_views) | [SQL for Web Nerds: SQL Triggers](https://philip.greenspun.com/sql/triggers.html) |
| Nov. 2 (W) | **Midterm Exam #2 In-Class** | |
| Nov. 7 (M) | **No class for Term 1 midterm break** | |
| Nov. 9 (W) | **No class for Term 1 midterm break** | |
| Nov. 14 (M) | [Advanced SQL – Security](topics/17_security)<br>[Advanced SQL – Transactions, Recursion](topics/18_transactions) | [MySQL Recursive Query](https://www.mysqltutorial.org/mysql-recursive-cte/) |
| Nov. 16 (W) | [XML and XPath](topics/19_xml) |  [Sample XML Code](topics/19_xml/code), [Intro to XML/XML Reference](https://www.w3schools.com/xml/xml_whatis.asp)<br>[XMLSchema Reference](https://www.w3schools.com/xml/schema_intro.asp)<br>[XML Validator](https://www.freeformatter.com/xml-validator-xsd.html), [Test XPath](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/xml/xmlquery.html) |
| Nov. 21 (M) | [JSON](topics/20_json)<br>[NoSQL Databases](topics/21_nosql) | |
| Nov. 23 (W) | [Normalization and Design Verification](topics/22_normalization) | |
| Nov. 28 (M) | [Database hosting and data cleansing/wrangling](topics/23_hosting) | [Sample D3 Code](topics/23_hosting/code) |
| Nov. 30 (W) | [Data warehousing and Data Mining](topics/24_data_warehousing)<br>[304 Course Summary and Preview of COSC 404](topics/25_course_summary) | [10 Rules for Data Storage](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/refs/rulesfordatastorage.pdf) |
| December 5 (M) | Project completion | |
| December 7 (W) | **Final Exam Review** | |


## Labs

|  Lab  |  Date  |  Topic  |
|----|------|-------|
|  | September 5 – 9 |	**No Lab during First Week of Class** |
| [1](labs/lab1) | September 12 – 16 | Lab 1: Querying using Relational Algebra |
| [2](labs/lab2) | September 19 – 23 | Lab 2: Creating tables using SQL and MySQL |
| [3](labs/lab3) | September 26 – 30 | Lab 3: Writing SQL queries on a MySQL database |
| [4](labs/lab4) | October 3 – 7 | Lab 4: Database Design using UML Modeling |
| [5](labs/lab5) | October 10 – 21 |Lab 5: Converting UML Diagrams into the Relational Model |
| [6](labs/lab6) | October 24 – 28 | Lab 6: Programming with Java/Python using MySQL and SQL Server |
| [7](labs/lab7) | Oct. 31 – Nov. 4 | Lab 7: Building a Database-enabled Web Site using JSP/PHP |
|  | November 7 - 11 |	**No Lab during Midterm Break** |
| [8](labs/lab8) | November 14 – 18 | Lab 8: Images, Security, and Transactions |
| [9](labs/lab9) | November 21 – 25 | Lab 9: XML, JSON, Views, and Triggers |
| [10](labs/lab10) | Nov. 28 – Dec. 2 | Lab 10: Project Completion |

## Missing an Exam
Only students who miss the final exam for a reason that corresponds to the University of British Columbia Okanagan's policy on excused absences from examinations will be permitted to take the final exam at a later time. A make-up exam may have a question format different from the regular exam. There will be no make-up midterm exams.  If the reason for absence is satisfactory, the student’s final exam will be worth more of the final grade.  Further information on Academic Concession is in the Academic Calendar http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,48,0,0.

## Copyright Disclaimer   
Diagrams and figures included in lecture presentations adhere to Copyright Guidelines for UBC Faculty, Staff and Students http://copyright.ubc.ca/requirements/copyright-guidelines/ and UBC Fair Dealing Requirements for Faculty and Staff http://copyright.ubc.ca/requirements/fair-dealing/.  Some of these figures and images are subject to copyright and will not be posted to Connect. All material uploaded to Connect that contain diagrams and figures are used with permission of the publisher; are in the public domain; are licensed by Creative Commons; meet the permitted terms of use of UBC’s library license agreements for electronic items; and/or adhere to the UBC Fair Dealing Requirements for Faculty and Staff. Access to the Connect course site is limited to students currently registered in this course. Under no circumstance are students permitted to provide any other person with means to access this material. Anyone violating these restrictions may be subject to legal action. Permission to electronically record any course materials must be granted by the instructor. Distribution of this material to a third party is forbidden.

## Grievances and Complaints Procedures
A student who has a complaint related to this course should follow the procedures summarized below:
 - The student should attempt to resolve the matter with the instructor first. Students may talk first to someone other than the instructor if they do not feel, for whatever reason, that they can directly approach the instructor. 
 - If the complaint is not resolved to the student's satisfaction, the student should e-mail the Associate Head, Dr. Yves Lucet at yves.lucet@ubc.ca or the Department Head, Dr. John Braun at cmps.depthead@ubc.ca.
 
## Your Responsibilities
Your responsibilities to this class and to your education as a whole include attendance and participation. You have a
responsibility to help create a classroom environment where all may learn. At the most basic level, this means you will
respect the other members of the class and the instructor and treat them with the courtesy you hope to receive in return.
Inappropriate classroom behavior may include: disruption of the classroom atmosphere, engaging in non-class activities,
talking on a cell-phone, inappropriate use of profanity in classroom discussion, use of abusive or disrespectful language
toward the instructor, a student in the class, or about other individuals or groups.

## Academic Integrity
The academic enterprise is founded on honesty, civility, and integrity.  As members of this enterprise, all students are expected to know, understand, and follow the codes of conduct regarding academic integrity.  At the most basic level, this means submitting only original work done by you and acknowledging all sources of information or ideas and attributing them to others as required.  This also means you should not cheat, copy, or mislead others about what is your work.  Violations of academic integrity (i.e., misconduct) lead to the breakdown of the academic enterprise, and therefore serious consequences arise and harsh sanctions are imposed.  For example, incidences of plagiarism or cheating may result in a mark of zero on the assignment or exam and more serious consequences may apply if the matter is referred to the President’s Advisory Committee on Student Discipline.  Careful records are kept in order to monitor and prevent recurrences. A more detailed description of academic integrity, including the policies and procedures, may be found: http://okanagan.students.ubc.ca/calendar/index.cfm?tree=3,54,111,0  If you have any questions about how academic integrity applies to this course, please consult with your professor.


## Academic Integrity Course Policies
Academic integrity is critical to being a professional developer and a respected person. This is a guide to what is and is not acceptable behaviors in this course.

### In-Class Participation and Quizzes and Teamwork Collaboration
#### Allowed
- Collaboration in groups of up to 4 on Canvas quizzes and in-class exercises

#### Not Allowed
 - One person providing all answers for a quiz/exercise to a group of people of any size
 - Sharing, posting, or distributing answers to other students or websites for quizzes/exercises
 - Answering questions for another student or submitting answers on their behalf
 - Requesting help from previous students in the course or other individuals outside of the course
 - Relying on others to do work for me or not contributing reasonable effort to group activities
 - Dividing up the work for a quiz or exercise between members of an approved group (*Not Recommended*)

### Assignments
#### Allowed
- Collaborating with your approved group members (usually two) and submitting a shared answer to the assignment
- Request help from the TA or instructor and use the answer/code that they provide
- Answer general questions about assignments in chat or discussion forums (*Allowed with care*)

#### Not Allowed
 - Working on an individual assignment with a group of people and submitting minor variations of work developed together
 - For group assignment, completing all work independently and providing answer to rest of group
 - Sharing solutions to assignments with other students or on the Internet	
 - Receiving solutions to assignments from other sources (students, web, tutors)	
	
### Exams
#### Allowed
- Using course material including assignments, notes, and quizzes in an open book exam

#### Not Allowed
- Using any non-approved resource (people, web, etc.) for exams **(severe)**
- Allowing another person to write or complete any part of any exam **(severe)**
- Posting or providing answers to students who have not yet completed the exam
- Requesting help from other people or web services for open book exams
- Posting or providing exam questions and answers after exam has been completed

### Grading Practices   
Faculties, departments, and schools reserve the right to scale grades in order to maintain equity among sections and conformity to University, faculty, department, or school norms. Students should therefore note that an unofficial grade given by an instructor might be changed by the faculty, department, or school. Grades are not official until they appear on a student's academic record. http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,41,90,1014  If you have any questions about how academic integrity applies to this course, please consult with your professor.

### Disability Resource Centre
The Disability Resource Centre ensures educational equity for students with disabilities and chronic medical conditions. If you are disabled, have an injury or illness and require academic accommodations to meet the course objectives, please contact Earllene Roberts, the Diversity Advisor for the Disability Resource Centre located in the University Centre building (UNC 215). Ph: 250.807.9263 Email: earllene.roberts@ubc.ca  Web: [https://students.ok.ubc.ca/drc](https://students.ok.ubc.ca/drc)

### Equity and Inclusion Office
Through leadership, vision, and collaborative action, the Equity & Inclusion Office (EIO) develops action strategies in support of efforts to embed equity and inclusion in the daily operations across the campus. The EIO provides education and training from cultivating respectful, inclusive spaces and communities to understanding unconscious/implicit bias and its operation within in campus environments. UBC Policy 3 prohibits discrimination and harassment on the basis of BC’s Human Rights Code. If you require assistance related to an issue of equity, educational programs, discrimination or harassment please contact the EIO. Office: UNC 325H Ph: 250.807.9291 Email: equity.ubco@ubc.ca  Web: [https://equity.ok.ubc.ca](https://equity.ok.ubc.ca)

### Office of the Ombudsperson for Students  
The Office of the Ombudsperson for Students is an independent, confidential and impartial resource to ensure students are treated fairly. The Ombuds Office helps students navigate campus-related fairness concerns. They work with UBC community members individually and at the systemic level to ensure students are treated fairly and can learn, work and live in a fair, equitable and respectful environment. Ombuds helps students gain clarity on UBC policies and procedures, explore options, identify next steps, recommend resources, plan strategies and receive objective feedback to promote constructive problem solving. If you require assistance, please feel free to reach out for more information or to arrange an appointment.  Office: UNC 328 Ph: 250.807.9818 Email: ombuds.office.ok@ubc.ca   
Web: [https://ombudsoffice.ubc.ca](https://ombudsoffice.ubc.ca)

### Sexual Violence Prevention and Response Office (SVPRO)
A safe and confidential place for UBC students, staff and faculty who have experienced sexual violence regardless of when or where it took place. Just want to talk? We are here to listen and help you explore your options. We can help you find a safe place to stay, explain your reporting options (UBC or police), accompany you to the hospital, or support you with academic accommodations. You have the right to choose what happens next. We support your decision, whatever you decide. Visit svpro.ok.ubc.ca or call us at 250.807.9640.

### Independent Investigations Office (IIO)
If you or someone you know has experienced sexual assault or some other form of sexual misconduct by a UBC community member and you want the Independent Investigations Office (IIO) at UBC to investigate, please contact the IIO. Investigations are conducted in a trauma informed, confidential and respectful manner in accordance with the principles of procedural fairness. You can report your experience directly to the IIO by calling 604-827-2060. Web:  [https://investigationsoffice.ubc.ca](https://investigationsoffice.ubc.ca) E-mail: director.of.investigations@ubc.ca  

### Student Learning Hub  
The Student Learning Hub (LIB 237) is your go-to resource for free math, science, writing, and language learning support. The Hub welcomes undergraduate students from all disciplines and year levels to access a range of supports that include tutoring in math, sciences, languages, and writing, as well as help with study skills and learning strategies. For more information, please visit the Hub’s website [https://students.ok.ubc.ca/student-learning-hub](https://students.ok.ubc.ca/student-learning-hub) or call 250-807-9185.  
 
### Student Wellness   
At UBC Okanagan health services to students are provided by Student Wellness.  Nurses, physicians and counsellors provide health care and counselling related to physical health, emotional/mental health and sexual/reproductive health concerns. As well, health promotion, education and research activities are provided to the campus community.  If you require assistance with your health, please contact Student Wellness for more information or to book an appointment.  

UNC 337 250.807.9270  
email: healthwellness.okanagan@ubc.ca  
Web: [https://students.ok.ubc.ca/health-wellness](https://students.ok.ubc.ca/health-wellness)  

### SAFEWALK
Don't want to walk alone at night?  Not too sure how to get somewhere on campus?  Call Safewalk at 250-807-8076.
For more information:  [https://security.ok.ubc.ca/safewalk](https://security.ok.ubc.ca/safewalk)  or download the UBC SAFE – Okanagan app.


## Reference Material
* [SQL for Web Nerds](https://philip.greenspun.com/sql/index.html)
* [SQL Tutorial by Software Carpentry](https://swcarpentry.github.io/sql-novice-survey/) - uses SQLite and demonstrates using databases with Python/R
* [Codecademy SQL course](https://www.codecademy.com/learn/learn-sql)
* [Amazon Database Blog](https://aws.amazon.com/blogs/database/)
* Sample databases WorksOn (SQL Notes): [WorksOn](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/WorksOn.accdb), [WorksOn DDL](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/MySQL_WorksOn_DDL.sql)



