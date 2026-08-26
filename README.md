# COSC 304 - Introduction to Databases - September 2026

## Instructor
Dr. Ramon Lawrence, ramon.lawrence@ubc.ca, 250-807-9390<br>
**Live Classroom Schedule:** 	5:00 to 6:30 p.m. Tuesday/Thursday<br>
**Mode of Delivery:** 			ART 366 and live-stream on Zoom<br>
**Office Hours:**				Mondays 1 to 3 p.m. (in-person and online)<br>
**Office Location:** 			SCI 200C<br>
**Calendar Description:** [https://okanagan.calendar.ubc.ca/course-descriptions/subject/cosco](https://okanagan.calendar.ubc.ca/course-descriptions/subject/cosco)

## Virtual Drop-in Help Session Hours
| Day/Time |  TA/Instructor |
|----------|----------------|
| Monday 1 to 3 p.m. 	| Dr. Ramon Lawrence (virtual and in-person) |
| Tuesday 1 to 3 p.m.	| TBD |
| Tuesday 5:00 p.m. to 6:30 p.m. (class time)	| TBD |
| Wednesday 1 to 3 p.m. | TBD |
| Thursday 1 to 3 p.m. | TBD |
| Thursday 5:00 p.m. to 6:30 p.m. (class time)	| TBD |
| Friday 1 to 3 p.m. 	| TBD |

For support in office hours and other times, join a queue or ask a question on the HelpMe system at: [https://coursehelp.ubc.ca/invite?cid=189&code=e8e6345892e4](https://coursehelp.ubc.ca/invite?cid=189&code=e8e6345892e4)

Login with your CWL user id and password.

PrairieLearn online system (login with your CWL): https://plcanary.ok.ubc.ca/

iClicker join code: [https://join.iclicker.com/CQQM](https://join.iclicker.com/CQQM)

## Course Description
**Official Calendar:** Databases from a user's perspective: querying with SQL, designing with UML, and using programs to analyze data. Construction of database-driven applications and websites and experience with current database technologies.  Completion of COSC 121 is recommended.
**Prerequisite:** Either (a) COSC_O 222 or (b) third-year standing and one of COSC_O 111, COSC_O 121, COSC_O 123.

**Specific description:** This course provides an introduction to database systems from a user and application perspective. Students learn how to query relational databases using SQL and relational algebra, design relational databases using ER/UML modeling, and use databases from programs and data analysis tools. These skills are integrated through practical work involving database programming, database-backed application development, and data analytics. Programming examples use Java and Python, with other technologies such as Node.js available for project development. Students completing the course gain practical experience with current database technologies and the ability to query and design databases, analyze data stored in databases, and develop programs that interact with database systems. AI is integrated throughout the course, with emphasis on using AI effectively while critically evaluating and verifying AI-generated queries, designs, code, and analysis.

## Course Objectives
**Course Format:** Interactive classes consist of topic introduction, quick questions for understanding, and larger exercises for developing concept mastery. Assignments provide practical experience applying course concepts using database systems, development and analysis software, and AI tools.

**Learning Outcomes:**
 - Describe how database systems provide data abstraction and support applications that store, retrieve, and manipulate data.
 - Create relational algebra queries on relational databases using selection, projection, join, and set operators.
 - Construct SQL CREATE TABLE, INSERT, UPDATE, DELETE, and SELECT statements including queries involving multiple joins, aggregation, grouping, and subqueries, and explain how SQL queries relate to relational algebra operations.
 - Analyze existing database designs, design relational databases using ER/UML modeling, and convert conceptual designs to relational schemas with appropriate primary and foreign keys.
 - Evaluate and improve relational database designs using functional dependencies and normalization.
 - Develop programs and database-backed applications that connect to databases, execute queries and updates, process results, and present output.
 - Perform data extraction, analysis, reporting, and visualization using data stored in databases.
 - Explain and use transactions, including the ACID properties and basic transaction control, and apply database security mechanisms including SQL privileges using GRANT and REVOKE.
 - Use semi-structured data representations including JSON and XML, and explain fundamental differences between relational and NoSQL database approaches.
 - Configure and run database systems using containerization technology such as Docker.
 - Use AI to assist with database querying, design, programming, and analysis while critically evaluating and validating AI-generated outputs. 

## Marking and Evaluation
| Item | Weighting | Description |
|------|-----------|-------------|
| Quizzes and Exercises | 10% | Online and during class time activities |
| Assignments | 20% | Weekly assignments |
| Midterm #1 | 15% | October 13th in class | 
| Midterm #2 | 15% | November 3rd in class | 
| Final Exam | 40% | Cumulative, 2.5 hours | 

**A student must receive a combined grade of at least 50% on the exams (midterms and final) to pass the course.  Otherwise, the student receives a maximum overall grade of 45.**

If a midterm exam is missed for any reason, the 15% is transferred to the final exam. 

The formula used is: 
`Midterm1 Percentage Mark * 15 + Midterm2 Percentage Mark * 15 + Final Exam Percentage Mark * 40`

For example, if the midterm 1 percentage mark was `80%`, the midterm 2 percentage mark was `60%`, and the final percentage mark was `40%`, then `.80 * 15 + .60 * 15 + .40 * 40 = 37`.  This is `>= 35`, which is 50% of the 70 total possible percentage marks for all exams combined.

## Textbook and Reference Material
 - All notes are online.
 - A textbook is not required. Students can get supplemental material from any database textbook.
 - The course uses iClicker Cloud (free). [Setup instructions for iClicker Cloud Student Account](https://lthub.ubc.ca/guides/iclicker-cloud-student-guide/). [iClicker Cloud Login](https://student.iclicker.com/#/login)

## Expectations
 - Attend all classes and prepare before attending class. 
 - Read the notes before the class time. **Expect to spend about five hours per week in out-of-class preparation.**
 - Learn the material in the course by completing all assignments. **No late assignments are accepted.**
 - Enjoy attending class activities and participating according to your personality.  Ask questions by posting in chat or raising your hand.
 - Please actively participate in class discussions, questions, and problem solving exercises.
 - **I want all students to pass the course, receive a good grade, and feel the course was beneficial.**

## Schedule

|   Date | Topic  | Reading and Resources |
|------------|------|-----------|
| Sept. 8 (T) | [**First day of classes.  Introduction to course**](topics/01_introduction)<br> [Introduction to databases](topics/02_database_introduction) |  |
| Sept. 10 (TH) | [Relational Model - Schemas, Keys, Constraints, Integrity](topics/03_relational_model) |  |
| Sept. 15 (T) | [Relational Algebra - Select, Project, Set Ops, Outer Joins](topics/04_relational_algebra) | [Online Relational Algebra Tool](https://dbis-uibk.github.io/relax/), [WorksOn Data Set](https://gist.github.com/rlawrenc/5a7eb3f69cbea033c04c3cdf680a2e39), [Bank Data Set](https://gist.github.com/rlawrenc/51721bd35f05ce3ef7391ff826f8f81a) |
| Sept. 17 (TH) | [SQL DDL – Create table/index, Insert/Delete/Update](topics/05_sql_ddl) | |
| Sept. 22 (T) | [SQL - Queries, LIKE operator, Set Operations, Order By](topics/06_sql) |  |
| Sept. 24 (TH) | [SQL - Group By, Aggregate Functions](topics/07_sql_aggregation) |  |
| Sept. 29 (T) | [SQL - Subqueries, Outer joins](topics/07_sql_aggregation) | |
| Oct. 1 (TH) | [Database Design – General Approach](topics/08_db_design)<br>[ER and UML Modeling](topics/09_er_design) | |
| Oct. 6 (T) | [ER and UML Modeling examples and questions](topics/09_er_design) | |
| Oct. 8 (TH) |  [EER Design - Specialization, Generalization, Aggregation](topics/10_eer_design)<br>[ER/EER Mapping to Relational model](topics/11_er_to_relational) | |
| Oct. 13 (T) | **Midterm Exam #1 In-Class** | |
| Oct. 15 (TH) | [Database Programming using Java/JDBC](topics/12_db_programming) | [Sample Java Code](topics/12_db_programming/code), [JDBC Tutorial](https://docs.oracle.com/javase/tutorial/jdbc/index.html)  |
| Oct. 20 (T) | [Database Programming using Python and R](topics/13_db_python_programming) | [Sample Python Code](topics/13_db_python_programming/code), [SQL Server and pyodbc](https://docs.microsoft.com/en-us/sql/connect/python/pyodbc/python-sql-driver-pyodbc), [pyodbc](https://github.com/mkleehammer/pyodbc/wiki)<br> [pyodbc Getting Started](https://github.com/mkleehammer/pyodbc/wiki/Getting-started), [Python Database API](https://www.python.org/dev/peps/pep-0249), [Python sqlite3](https://docs.python.org/3/library/sqlite3.html)  |
| Oct. 22 (TH) | [Database Web Programming – Web servers, JSP/PHP](topics/14_web_programming)| [Sample JSP/PHP Code](topics/14_web_programming/code)<br> [Comic - Why validation is important](https://xkcd.com/327/) <br> [SQL Injection Attack](https://cwe.mitre.org/data/definitions/89.html) |
| Oct. 27 (T) | [Advanced SQL DDL – Triggers](topics/15_triggers)<br> [Advanced SQL DDL – Views](topics/16_views) |  |
| Oct. 29 (TH) | [Advanced SQL – Security](topics/17_security)<br>[Advanced SQL – Transactions, Recursion](topics/18_transactions) | [MySQL Recursive Query](https://www.mysqltutorial.org/mysql-recursive-cte/) |
| Nov. 3 (T)  | **Midterm Exam #2 In-Class** | |
| Nov. 5 (TH) | [XML and XPath](topics/19_xml) |  [Sample XML Code](topics/19_xml/code), [Intro to XML/XML Reference](https://www.w3schools.com/xml/xml_whatis.asp)<br>[XMLSchema Reference](https://www.w3schools.com/xml/schema_intro.asp)<br>[XML Validator](https://www.freeformatter.com/xml-validator-xsd.html), [Test XPath](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/xml/xmlquery.html) |
| Nov. 10 (T) | **No class for Term 1 midterm break** | |
| Nov. 12 (TH) | **No class for Term 1 midterm break** | |
| Nov. 17 (T) | [JSON](topics/20_json)<br>[NoSQL Databases](topics/21_nosql) | |
| Nov. 19 (TH) | [AI and Databases](topics/AI_databases) | |
| Nov. 24 (T) | [Normalization and Design Verification](topics/22_normalization) | |
| Nov. 26 (TH) | [Database hosting and data cleansing/wrangling](topics/23_hosting) | [Sample D3 Code](topics/23_hosting/code) |
| Dec. 1 (T) | [Data warehousing and Data Mining](topics/24_data_warehousing)<br>[304 Course Summary and Preview of COSC 404](topics/25_course_summary) |  |
| Dec. 3 (TH) | **Project presentations<br>Final Exam Review** | |
| Dec. 8 (T) | TBD | |
<!--
| Dec. () | **COSC 304 Final Exam Wednesday, Dec. th at X:X p.m. in X. <br> Exam is closed book on paper.** | |
-->

## Labs

**Lab Schedule:** The dates below indicate the week in which each lab is expected to be completed. Labs are normally due on Friday of the following week. A 10% bonus is awarded for completion by the Monday following the scheduled lab week and a 5% bonus for completion by Wednesday. For bonus marks, labs must be demonstrated during virtual help/office hours. Exact submission deadlines are provided in Canvas.

| Lab | Date | Topic |
|---|---|---|
|  | September 7 – 11 | **No Lab during First Week of Class** |
| [1](labs/lab1) | September 14 – 18 | Lab 1: Querying using Relational Algebra |
| [2](labs/lab2) | September 21 – 25 | Lab 2: SQL DDL: CREATE, INSERT, UPDATE, and DELETE |
| [3](labs/lab3) | September 28 – October 2 | Lab 3: Writing SQL Queries |
| [4](labs/lab4) | October 5 – 9 | Lab 4: Database Design using UML Modeling |
| [5](labs/lab5) | October 12 – 16 | Lab 5: Converting UML Diagrams into the Relational Model |
| [6](labs/lab6) | October 19 – 23 | Lab 6: Programming with Databases using Java/Python |

### Development Stream

| Lab | Date | Topic |
|---|---|---|
| [7](labs/lab7) | October 26 – 30 | Lab 7: Building a Database-enabled Web Application |
| [8](labs/lab8) | November 2 – 6 | Lab 8: Images, Security, and Transactions |
|  | November 9 – 13 | **No Lab during Midterm Break** |
| [9](labs/lab9) | November 16 – 20 | Lab 9: Analysis and Development Assisted by AI |
| [10](labs/lab10) | November 23 – December 8 | Lab 10: Project Completion |

### Analysis Stream

| Lab | Date | Topic |
|---|---|---|
| [7](labs/lab7) | October 26 – 30 | Lab 7: Using Databases with Analysis Software (Excel) |
| [8](labs/lab8) | November 2 – 6 | Lab 8: Data Prediction, Forecasting, and Visualization |
|  | November 9 – 13 | **No Lab during Midterm Break** |
| [9](labs/lab9) | November 16 – 20 | Lab 9: Analysis and Development Assisted by AI |
| [10](labs/lab10) | November 23 – December 8 | Lab 10: Project Completion |

## UBC Values
UBC creates an exceptional learning environment that fosters global citizenship, advances a civil and sustainable society, and supports outstanding research to serve the people of British Columbia, Canada, and the world. UBC’s core values are excellence, integrity, respect, academic freedom, and accountability.

## Policies and Regulations
Visit [UBC Okanagan’s Academic Calendar](https://okanagan.calendar.ubc.ca/campus-wide-policies-and-regulations) for a list of campus-wide regulations and policies, as well as [term dates and deadlines](https://okanagan.calendar.ubc.ca/dates-and-deadlines). 

## Missing an Exam
Only students who miss the final exam for a reason that corresponds to the University of British Columbia Okanagan's policy on excused absences from examinations will be permitted to take the final exam at a later time. A make-up exam may have a question format different from the regular exam. **There will be no make-up midterm exams.**  If the reason for absence is satisfactory, the student’s final exam will be worth more of the final grade.  Further information on Academic Concession is in the Academic Calendar http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,48,0,0.

## Copyright Disclaimer   
Diagrams and figures included in lecture presentations adhere to Copyright Guidelines for UBC Faculty, Staff and Students http://copyright.ubc.ca/requirements/copyright-guidelines/ and UBC Fair Dealing Requirements for Faculty and Staff http://copyright.ubc.ca/requirements/fair-dealing/.  

## Grievances and Complaints Procedures
A student who has a complaint related to this course should follow the procedures summarized below:
 - The student should attempt to resolve the matter with the instructor first. Students may talk first to someone other than the instructor if they do not feel, for whatever reason, that they can directly approach the instructor. 
 - If the complaint is not resolved to the student's satisfaction, the student should e-mail the Associate Head, Dr. Abdallah Mohamed, undergrad.cs.ok@ubc.ca.
 
## Your Responsibilities
Your responsibilities to this class and to your education as a whole include attendance and participation. You have a responsibility to help create a classroom environment where all may learn. At the most basic level, this means you will respect the other members of the class and the instructor and treat them with the courtesy you hope to receive in return. Inappropriate classroom behavior may include: disruption of the classroom atmosphere, engaging in non-class activities, talking on a cell-phone, inappropriate use of profanity in classroom discussion, use of abusive or disrespectful language toward the instructor, a student in the class, or about other individuals or groups.

## Academic Integrity
The academic enterprise is founded on honesty, civility, and integrity.  As members of this enterprise, all students are expected to know, understand, and follow the codes of conduct regarding academic integrity.  At the most basic level, this means submitting only original work done by you and acknowledging all sources of information or ideas and attributing them to others as required.  This also means you should not cheat, copy, or mislead others about what is your work.  Violations of academic integrity (i.e., misconduct) lead to the breakdown of the academic enterprise, and therefore serious consequences arise and harsh sanctions are imposed.  For example, incidences of plagiarism or cheating may result in a mark of zero on the assignment or exam and more serious consequences may apply if the matter is referred to the President’s Advisory Committee on Student Discipline.  Careful records are kept in order to monitor and prevent recurrences. A more detailed description of academic integrity, including the University’s policies and procedures, may be found in the Academic Calendar at
http://okanagan.students.ubc.ca/calendar/index.cfm?tree=3,54,111,0. Learn more through the [Academic Integrity website](https://academicintegrity.ubc.ca/student-start/).

## Academic Misconduct
Violations of academic integrity (i.e., academic misconduct) lead to the breakdown of the academic enterprise, and therefore serious consequences arise and harsh sanctions are imposed. For example, incidences of plagiarism or cheating may result in a mark of zero on the assignment or exam and more serious consequences may apply if the matter is referred for consideration for academic discipline. Careful records are kept to monitor and prevent recurrences. Any instance of cheating or taking credit for someone else’s work, whether intentionally or unintentionally, can and often will result in at minimum a grade of zero for the assignment, and these cases will be reported to the Head of the Department and Associate Dean Academic of the Faculty.

**The use of artificial intelligence (AI) assistance, such as ChatGPT, Gemini, or Copilot, for any assessed portions of this course is not permitted unless explicitly specified by the instructor. Specifically, AI is not allowed for exams but is allowed for assignments as long as it is used properly for learning.**

## Academic Integrity Course Policies
Academic integrity is an important part of learning and professional practice. The following guidelines describe acceptable and unacceptable behaviours in this course.

### In-Class Participation and Quizzes and Teamwork Collaboration
#### Allowed
- Collaboration in groups of up to 4 on Canvas quizzes and in-class exercises
- Dividing questions or tasks among group members is allowed, but all group members are responsible for understanding the complete solution and are encouraged to work through the material together.

#### Not Allowed
 - One person providing all answers for a quiz/exercise to a group of people of any size
 - Sharing, posting, or distributing answers to other students or websites for quizzes/exercises
 - Answering questions for another student or submitting answers on their behalf
 - Requesting help from previous students in the course or other individuals outside of the course
 - Relying on others to do work for me or not contributing reasonable effort to group activities 

### Assignments
#### Allowed
- Collaborating with your approved group members (usually two) and submitting a shared answer to the assignment
- Requesting help from the TA or instructor and use the answer/code that they provide
- Answering general questions about assignments in chat or discussion forums (*Allowed with care*)
- Group members may divide tasks when completing an assignment, but all group members are expected to contribute meaningfully and understand the complete submitted solution.
- Use of AI tools, including GitHub Copilot, unless otherwise specified. Students are responsible for understanding, critically evaluating, and being able to explain all work they submit, including AI-assisted work.

#### Not Allowed
 - Working on an individual assignment with a group of people and submitting minor variations of work developed together
 - For group assignments, completing all work independently and providing an answer to the rest of group
 - Sharing solutions to assignments with other students or on the Internet	
 - Receiving or copying assignment solutions from other students, websites, tutors, or other external sources.
	
### Exams
#### Allowed
- Using approved material for the given exam format:
    - **closed book:** no supplementary resources allowed (no calculator, no cheat sheets)

#### Not Allowed
- Using any non-approved resource (people, AI, web, etc.) for exams 
- Allowing another person to write or complete any part of any exam 
- Posting or providing answers to students who have not yet completed the exam
- Requesting help from other people or web services for open book exams
- Posting or providing exam questions and answers after the exam has been completed

### Grading Practices   
Faculties, departments, and schools reserve the right to scale grades in order to maintain equity among sections and conformity to University, faculty, department, or school norms. Students should therefore note that an unofficial grade given by an instructor might be changed by the faculty, department, or school. Grades are not official until they appear on a student's academic record. http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,41,90,1014  If you have any questions about how academic integrity applies to this course, please consult with your professor.

### Disability Resource Centre
The Disability Resource Centre (DRC) facilitates disability-related accommodations and programming initiatives that ameliorate barriers for students with disabilities and/or ongoing medical conditions. If you require academic accommodations to achieve the objectives of a course, please contact the DRC at: University Centre building (UNC 215). Ph: 250.807.8053 Email: drc.questions@ubc.ca  Web: [https://students.ok.ubc.ca/drc](https://students.ok.ubc.ca/academic-success/disability-resources/)

### Equity and Inclusion Office
Through leadership, vision, and collaborative action, the Equity & Inclusion Office (EIO) develops action strategies in support of efforts to embed equity and inclusion in the daily operations across the campus. The EIO provides education and training from cultivating respectful, inclusive spaces and communities to understanding unconscious/implicit bias and its operation within in campus environments. UBC Policy 3 prohibits discrimination and harassment on the basis of BC’s Human Rights Code. If you require assistance related to an issue of equity, educational programs, discrimination or harassment please contact the EIO. Office: UNC 325H Ph: 250.807.9291 Email: equity.ubco@ubc.ca  Web: [https://equity.ok.ubc.ca](https://equity.ok.ubc.ca)

### Office of the Ombudsperson for Students  
The Office of the Ombudsperson for Students is an independent, confidential and impartial resource to ensure students are treated fairly. The Ombuds Office helps students navigate campus-related fairness concerns. They work with UBC community members individually and at the systemic level to ensure students are treated fairly and can learn, work and live in a fair, equitable and respectful environment. Ombuds helps students gain clarity on UBC policies and procedures, explore options, identify next steps, recommend resources, plan strategies and receive objective feedback to promote constructive problem solving. If you require assistance, please feel free to reach out for more information or to arrange an appointment.  Office: UNC 217 Ph: 250.807.9818 Email: ombuds.office.ok@ubc.ca   
Web: [https://ombudsoffice.ubc.ca](https://ombudsoffice.ubc.ca)

### Sexual Violence Prevention and Response Office (SVPRO)
The Sexual Violence Prevention and Response Office (SVPRO) is a confidential place for those who have been impacted by any form of sexual or gender-based violence, harassment, or harm, regardless of where or when it took place. SVPRO aims to be a safer space for all UBC students, faculty, and staff by respecting each person’s unique and multiple identities and experiences. All genders and sexualities are welcome. Nicola Townhome 120, 1270 International Mews 250.807.8053
Email: vpro.ok.ubc.ca Web: [https://svpro.ok.ubc.ca](https://svpro.ok.ubc.ca/)

### Student Learning Hub  
The Student Learning Hub is your go-to resource for free math, science, writing, and language learning support. The Hub welcomes undergraduate students from all disciplines and year levels to access a range of supports that include tutoring in math, sciences, languages, and writing, as well as help with academic integrity, study skills and learning strategies. Students are encouraged to visit often and early to build the skills, strategies and behaviours that are essential to being a confident and independent learner. For more information, please visit the Hub’s website. LIB 237. Ph: 250.807.8491 Email: learning.hub@ubc.ca [https://students.ok.ubc.ca/student-learning-hub](https://students.ok.ubc.ca/academic-success/learning-hub/)
 
### Wellbeing and Accessibility Services (WAS)
Wellbeing and Accessibility Services (WAS) supports holistic student wellbeing in body, mind, and spirit. Students can access nurses, physicians and counsellors for health care and counselling related to physical health, emotional/mental health and sexual/reproductive health concerns. WAS is also home to the Disability Resource Centre, Spiritual and Multi-Faith Services, and Campus Health and Education. If you require assistance with your health, please contact Wellbeing and Accessibility Services for more information or to book an appointment. UNC 337 250.807.9270 Email: healthwellness.okanagan@ubc.ca Web: https://students.ok.ubc.ca/was

### SAFEWALK
Don't want to walk alone at night?  Not too sure how to get somewhere on campus?  Call Safewalk at 250-807-8076.
For more information:  [https://security.ok.ubc.ca/safewalk](https://security.ok.ubc.ca/safewalk)  or download the UBC SAFE – Okanagan app.


## Reference Material
* [SQL Tutorial by Software Carpentry](https://swcarpentry.github.io/sql-novice-survey/) - uses SQLite and demonstrates using databases with Python/R
* [Codecademy SQL course](https://www.codecademy.com/learn/learn-sql)
* Sample databases WorksOn (SQL Notes): [WorksOn](topics/02_database_introduction/workson/WorksOn.accdb), [WorksOn DDL](topics/02_database_introduction/workson/MySQL_WorksOn_DDL.sql)






















