# COSC 304 - Introduction to Databases - Winter W1 2021

## Instructor
Dr. Youry Khmelevsky, youry.khmelevsky@ubc.ca, 250-762-5445, ext. 4741<br>
**Classroom Schedule:** Tuesday/Thursday, 12:30 pm - 1:50 pm<br>
**Mode of Delivery:** Online
**Office Hours:**	Tuesday and Thursday, 2:00 pm – 2:30 pm or by an appointment<br>
**Office Location:** virtual office hours<br>
**Course Website:** Canvas<br>
**Text Book:** N/A<br>
**Calendar Course Description, from the UBCO Calendar:** http://www.calendar.ubc.ca/okanagan/courses.cfm?go=name&code=COSC

## TAs
| willmcfarland17@gmail.com (Office hours:   Wednesday 9:30am-10:30am, Thursday 9:30-10:30) | McFarland, Will  |<br>
| pradeepmahato007@gmail.com (Office hours:  Tuesday 4:00 pm-6:00 pm) | Mahato, Pradeep   |<br>
| tanjum@mail.ubc.ca (Office hours:  Friday 12:30 pm - 2:30 pm) | Anjum, Taif |<br>

## Course Description
**Official Calendar:** Databases from a user's perspective: querying with SQL, designing with UML, and using programs to analyze data. Construction of database-driven applications and websites and experience with current database technologies.  Completion of COSC 121 is recommended.
**Prerequisite:** One of COSC 111, COSC 123, COSC 210. Third-year standing.

**Specific description:** This course provides an introduction to database systems including database querying, design, and programming. The course consists of three major components. The first component explains databases from a user perspective including how to query using SQL and relational algebra. The second component involves designing relational databases using Entity-Relationship (ER) diagrams and UML. The last part involves database and web programming with Java, JDBC, JSP, Python, and PHP. Students completing the course have experience with current database technologies, and the ability to use and develop databases and associated applications.

## Course Objectives
**Course Format:** Interactive online classes consisting of topic introduction, understanding evaluation using quick questions, and concept mastery with larger exercises.  Practical skills and applications of topics covered in assignments as well as practice using industrial database systems and software.

**Learning Outcomes:**
 - Understand the use case for databases and the relational model for data storage.
 - Proficiency in creating queries on relational databases using relational algebra and SQL.
 - Read existing database designs, design new databases using ER/UML modeling, and convert to the relational model.
 - Construct programs that access a database to read data, perform analysis, and output results.
 - Exposure to database technologies like NoSQL, JSON, XML, and cloud databases.

## Marking and Evaluation
| Item | Weighting | Description |
|------|-----------|-------------|
| Quizzes and Exercises | 10% | Online and during class time activities |
| Assignments | 25% | Weekly assignments |
| Midterm #1 | 15% | October 14th in class | 
| Midterm #2 | 15% | November 9th in class | 
| Final Exam | 35% | Cumulative, two and half hours ; **Exams require a web camera.**| 

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
**Lecture:** 12:30 to 2:00 p.m. Tuesday and Thursday<br>
**Lab:** Drop-in virtual labs and help sessions

|   Date | Topic  | Reading and Resources |
|------------|------|-----------|
| Sept. 9 (R) | [**First day of classes.  Introduction to course/databases**](lectures/lecture1) | [SQL for Web Nerds: SQL Introduction](http://philip.greenspun.com/sql/introduction.html) |
| Sept. 14 (T) | [Relational Model - Schemas, Keys, Constraints, Integrity](lectures/lecture2) |  |
| Sept. 16 (R) | [Relational Algebra - Select, Project, Set Ops, Outer Joins](lectures/lecture3) | [Online Relational Algebra Tool](http://dbis-uibk.github.io/relax/), [WorksOn Data Set](https://gist.github.com/rlawrenc/5a7eb3f69cbea033c04c3cdf680a2e39), [Bank Data Set](https://gist.github.com/rlawrenc/51721bd35f05ce3ef7391ff826f8f81a) |
| Sept. 21 (T) | [SQL DDL – Create table/index, Insert/Delete/Update](lectures/lecture4) | [Linux Shell Intro](https://drive.google.com/open?id=1ij785M5nfCkfsiYbCgXc5fmuRq790mJJv08VYJ1bE4w) |
| Sept. 23 (R) | [SQL - Queries, LIKE operator, Set Operations, Order By](lectures/lecture5) | [SQL for Web Nerds: SQL Queries](http://philip.greenspun.com/sql/queries.html) |
| Sept. 28 (T) | [SQL - Group By, Aggregate Functions](lectures/lecture6) | [SQL for Web Nerds: SQL Complex Queries](http://philip.greenspun.com/sql/complex-queries.html) |
| Sept. 30 (R) | [SQL - Subqueries, Outer joins](lectures/lecture6) | |
| Oct. 5 (T) | [Database Design – General Approach ; ER and UML Modeling](lectures/lecture7) | |
| Oct. 7 (R) | [ER and UML Modeling examples and questions](lectures/lecture8) | |
| Oct. 12 (T) | **No class due to Thanksgiving** | |
| Oct. 14 (R) | **Midterm Exam #1 In-Class** | |
| Oct. 19 (T) | [EER Design - Specialization, Generalization, Aggregation<br>ER/EER Mapping to Relational model](lectures/lecture9) | |
| Oct. 21 (R) | [Database Programming using Java/JDBC](lectures/lecture10) | [Sample Java Code](lectures/lecture10/code), [JDBC Tutorial](https://docs.oracle.com/javase/tutorial/jdbc/index.html)  |
| Oct. 26 (T) | [Database Programming using Python and R](lectures/lecture11) | [Sample Python Code](lectures/lecture11/code), [SQL Server and pyodbc](https://docs.microsoft.com/en-us/sql/connect/python/pyodbc/python-sql-driver-pyodbc), [pyodbc](https://github.com/mkleehammer/pyodbc/wiki)<br> [pyodbc Getting Started](https://github.com/mkleehammer/pyodbc/wiki/Getting-started), [Python Database API](https://www.python.org/dev/peps/pep-0249), [Python sqlite3](https://docs.python.org/3/library/sqlite3.html)  |
| Oct. 28 (R) | [Database Web Programming – Web servers, JSP/PHP](lectures/lecture12) | [Sample JSP/PHP Code](lectures/lecture12/code)<br> [Comic - Why validation is important](http://xkcd.com/327/) |
| Nov. 2 (T) | [Advanced SQL DDL – Triggers and Views](lectures/lecture13) | [SQL for Web Nerds: SQL Triggers](http://philip.greenspun.com/sql/triggers.html) |
| Nov. 4 (R) | [Advanced SQL – Security, Transactions, Recursion](lectures/lecture14) | [MySQL Recursive Query](http://www.mysqltutorial.org/mysql-recursive-cte/) |
| Nov. 8-12 | **No class for Term 1 midterm break** | |
| Nov. 16 (T) | **Midterm Exam #2 In-Class** | Consent Forms:<br> Student Consent: https://ubc.ca1.qualtrics.com/jfe/form/SV_1YtWwaxpaX7sx1A<br> Instructor and Teaching Assistant Consent: https://ubc.ca1.qualtrics.com/jfe/form/SV_6yxChQZI2lfDx8a<br> Surveys - Make available after Midterm 2:<br> Student Survey: https://ubc.ca1.qualtrics.com/jfe/form/SV_86W8svTSmCAFDrU<br> Instructor and Teaching Assistant Survey: https://ubc.ca1.qualtrics.com/jfe/form/SV_3l7hy3uGUjJ5WwC|
| Nov. 18 (R) | [XML and XPath](lectures/lecture15) |  [Sample XML Code](lectures/lecture15/code), [Intro to XML/XML Reference](http://www.w3schools.com/xml/xml_whatis.asp)<br>[XMLSchema Reference](https://www.w3schools.com/xml/schema_intro.asp)<br>[XML Validator](https://www.freeformatter.com/xml-validator-xsd.html), [Test XPath](http://cosc304.ok.ubc.ca/rlawrenc/tomcat/xml/xmlquery.html) |
| Nov. 18 (R) | [JSON and NoSQL Databases](lectures/lecture16) | |
| Nov. 23 (T) | [Normalization and Design Verification](lectures/lecture17) | |
| Nov. 25 (R) | [Database hosting and data cleansing/wrangling](lectures/lecture18) | [Sample D3 Code](lectures/lecture18/code) |
| Nov. 30 (T) | [Data warehousing and Data Mining<br>Preview of COSC 404 - Database System Implementation<br>Course Summary](lectures/lecture19) | [10 Rules for Data Storage](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/refs/rulesfordatastorage.pdf) |
| December 2 (R) | **Final Exam Review** | |

## Labs

|  Lab  |  Date  |  Topic  |
|----|------|-------|
|  | September 7 – 11 |	**No Lab during First Week of Class** |
| [1](labs/lab1) | September 21 – 27 | Lab 1: Querying using Relational Algebra |
| [2](labs/lab2) | September 28 – Oct. 4 | Lab 2: Creating tables using SQL and MySQL |
| [3](labs/lab3) | October 5 - 11 | Lab 3: Writing SQL queries on a MySQL database |
| [4](labs/lab4) | October 12 – 18 | Lab 4: Database Design using UML Modeling |
| [5](labs/lab5) | October 19 – 25 |Lab 5: Converting UML Diagrams into the Relational Model |
| [6](labs/lab6) | October 26 – Nov. 1 | Lab 6: Programming with Java/Python using MySQL and SQL Server |
| [7](labs/lab7) | November 2 - 7 | Lab 7: Building a Database-enabled Web Site using JSP/PHP |
| [*](No Labs) | November 8 - 12 | Semester Break |
| [8](labs/lab8) | November 15 – 22 | Lab 8: Images, Security, and Transactions |
| [9](labs/lab9) | November 23 – 29 | Lab 9: XML, JSON, Views, and Triggers |
| [10](labs/lab10) | November 30 – Dec. 7 | Lab 10: Project Completion |
|*|Lab 6, 7 8, and  10 — are parts of the project and must be delivered in the group of 5||

## Final Examinations
The examination period for December 11-22, 2021.  Except in the case of examination clashes and hardships (three or more formal examinations scheduled within a 24-hour period) or unforeseen events, students will be permitted to apply for out-of-time final examinations only if they are representing the University, the province, or the country in a competition or performance; serving in the Canadian military; observing a religious rite; working to support themselves or their family; or caring for a family member.  Unforeseen events include (but may not be limited to) the following: ill health or other personal challenges that arise during a term and changes in the requirements of an ongoing job.  
Further information on Academic Concession can be found under Policies and Regulation in the Okanagan Academic Calendar http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,48,0,0

## Missing an Exam
Only students who miss the final exam for a reason that corresponds to the University of British Columbia Okanagan's policy on excused absences from examinations will be permitted to take the final exam at a later time. A make-up exam may have a question format different from the regular exam. There will be no make-up midterm exams.  If the reason for absence is satisfactory, the student’s final exam will be worth more of the final grade.  Further information on Academic Concession is in the Academic Calendar http://www.calendar.ubc.ca/okanagan/index.cfm?tree=3,48,0,0.

## Copyright Disclaimer   
Diagrams and figures included in lecture presentations adhere to Copyright Guidelines for UBC Faculty, Staff and Students http://copyright.ubc.ca/requirements/copyright-guidelines/ and UBC Fair Dealing Requirements for Faculty and Staff http://copyright.ubc.ca/requirements/fair-dealing/.  Some of these figures and images are subject to copyright and will not be posted to Canvas.   All material uploaded to Canvas that contain diagrams and figures are used with permission of the publisher; are in the public domain; are licensed by Creative Commons; meet the permitted terms of use of UBC’s library license agreements for electronic items; and/or adhere to the UBC Fair Dealing Requirements for Faculty and Staff. Access to the Canvas course site is limited to students currently registered in this course. Under no circumstance are students permitted to provide any other person with means to access this material. Anyone violating these restrictions may be subject to legal action. Permission to electronically record any course materials must be granted by the instructor. Distribution of this material to a third party is forbidden.


## Grievances and Complaints Procedures
A student who has a complaint related to this course should follow the procedures summarized below:<br>
- The student should attempt to resolve the matter with the instructor first. Students may talk first to someone other than the instructor if they do not feel, for whatever reason, that they can directly approach the instructor. 
If the complaint is not resolved to the student's satisfaction, the student should e-mail the Associate Head, Dr. Yves Lucet at yves.lucet@ubc.ca  or the Department Head pro tem, Dr. Andrew Jirasek at andrew.jirasek@ubc.ca.

 
## Your Responsibilities
Your responsibilities to this class and to your education as a whole include attendance and participation. You have a
responsibility to help create a classroom environment where all may learn. At the most basic level, this means you will
respect the other members of the class and the instructor and treat them with the courtesy you hope to receive in return.
Inappropriate classroom behavior may include: disruption of the classroom atmosphere, engaging in non-class activities,
talking on a cell-phone, inappropriate use of profanity in classroom discussion, use of abusive or disrespectful language
toward the instructor, a student in the class, or about other individuals or groups.

## Academic Integrity
The academic enterprise is founded on honesty, civility, and integrity.  As members of this enterprise, all students are expected to know, understand, and follow the codes of conduct regarding academic integrity.  At the most basic level, this means submitting only original work done by you and acknowledging all sources of information or ideas and attributing them to others as required.  This also means you should not cheat, copy, or mislead others about what is your work.  Violations of academic integrity (i.e., misconduct) lead to the breakdown of the academic enterprise, and therefore serious consequences arise and harsh sanctions are imposed.  For example, incidences of plagiarism or cheating may result in a mark of zero on the assignment or exam and more serious consequences may apply if the matter is referred to the President’s Advisory Committee on Student Discipline.  Careful records are kept in order to monitor and prevent recurrences. 
A more detailed description of academic integrity, including the University’s policies and procedures, may be found in the Academic Calendar at:  http://okanagan.students.ubc.ca/calendar/index.cfm?tree=3,54,111,0.
  If you have any questions about how academic integrity applies to this course, please consult with your professor.


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

### Disability Assistance
The Disability Resource Centre ensures educational equity for students with disabilities, injuries or illness. If you are disabled, have an injury or illness and require academic accommodations to meet the course objectives, e-mail us or visit our website for more information.
Web:   http://students.ok.ubc.ca/drc/welcome.html	E-mail DRC at:  drc.questions@ubc.ca


### Equity, Human Rights, Discrimination and Harassment
UBC Okanagan is a place where every student, staff and faculty member should be able to study and work in an environment that is free from human rights-based discrimination and harassment.  If you require assistance related to an issue of equity, discrimination or harassment, please contact the Equity Office, your administrative head of unit, and/or your unit’s equity representative.      UBC Okanagan Equity Advisor:   ph. 250-807-9291
Web:  https://equity.ok.ubc.ca/ 				E-mail:  equity.ubco@ubc.ca   


### Health & Wellness
At UBC Okanagan health services to students are provided by Health and Wellness.  Nurses, physicians and counsellors provide health care and counselling related to physical health, emotional/mental health and sexual/reproductive health concerns. As well, health promotion, education and research activities are provided to the campus community.  If you require assistance with your health, please contact Health and Wellness for more information or to book an appointment.  
Web: www.students.ok.ubc.ca/health-wellness 		Email: healthwellness.okanagan@ubc.ca  


### Sexual Violence Prevention and Response Office (SVPRO)
A safe and confidential place for UBC students, staff and faculty who have experienced sexual   violence regardless of when or where it took place. Just want to talk? We are here to listen and help you explore your options. We can help you find a safe place to stay, explain your reporting options (UBC or police), accompany you to the hospital, or support you with academic accommodations. You have the right to choose what happens next. We support your decision, whatever you decide.    Visit svpro.ok.ubc.ca or call us at 250-807-9640
 
### Independent Investigations Office (IIO)
If you or someone you know has experienced sexual assault or some other form of sexual misconduct by a UBC community member and you want the Independent Investigations Office (IIO) at UBC to investigate, please contact the IIO. Investigations are conducted in a trauma informed, confidential and respectful manner in accordance with the principles of procedural fairness. You can report your experience directly to the IIO by calling 604-827-2060.  
Web:  https://investigationsoffice.ubc.ca/  		E-mail:  director.of.investigations@ubc.ca

### The Hub
The Student Learning Hub (LIB 237) is your go-to resource for free math, science, writing, and language learning support. The Hub welcomes undergraduate students from all disciplines and year levels to access a range of supports that include tutoring in math, sciences, languages, and writing, as well as help with study skills and learning strategies.  Web: (https://students.ok.ubc.ca/student-learning-hub/)  Ph: 250-807-9185.

### SAFEWALK
Don't want to walk alone at night?  Not too sure how to get somewhere on campus?  Call Safewalk at 250-807-8076.
For more information:  https://security.ok.ubc.ca/safewalk/  or download the UBC SAFE – Okanagan app.


## Reference Material
* [SQL for Web Nerds](http://philip.greenspun.com/sql/index.html)
* [SQL Tutorial by Software Carpentry](http://swcarpentry.github.io/sql-novice-survey/) - uses SQLite and demonstrates using databases with Python/R
* [Codecademy SQL course](https://www.codecademy.com/learn/learn-sql)
* [Amazon Database Blog](https://aws.amazon.com/blogs/database/)
* [Using MySQL](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/mysql.html)
* [Using SQL Server](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/sqlserver.html)
* [Using FileZilla](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/filezilla/filezilla.html)
* [Using Eclipse/JavaEE/Tomcat for Web Development](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/JavaEE/setup.html)
* [astah Web Site](http://astah.net/editions/uml-new)
* [Best Prior Year Projects](https://people.ok.ubc.ca/rlawrenc/teaching/304/Project/index.html)
* Sample databases WorksOn (SQL Notes): [WorksOn](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/WorksOn.accdb), [WorksOn DDL](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/MySQL_WorksOn_DDL.sql)



