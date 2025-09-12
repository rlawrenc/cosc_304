# COSC 304 - Introduction to Database Systems<br>Lab 2: SQL DDL: CREATE, INSERT, UPDATE, and DELETE

This lab practices SQL DDL. 

**Note: You can do the lab and practice questions on PrairieLearn without setting up a MySQL database using Docker. However, it is recommended to setup your environment as you will need it for future labs.**

**PrairieLearn marking may be a little picky. You can also complete the lab by putting all SQL statements in a text file and submitting on Canvas or showing the TA. The questions on PrairieLearn are running on [SQLite](https://www.sqlite.org/index.html).**

Practice questions are available on [PrairieLearn](https://plcanary.ok.ubc.ca/pl/course_instance/11/assessment/247) and [GitHub](practice).

The lab is completed on [PrairieLearn](https://plcanary.ok.ubc.ca/pl/course_instance/11/assessment/246) or is completed using MySQL on Docker and **requires computer setup by following these [setup instructions](../setup).**

Note: MySQL does not follow the standard for delimited identifiers using double-quotes ("). It uses backticks (\`) instead. To force it to use double-quotes, run this command when you start a session: `set session sql_mode = 'ANSI';` It is also possible to set this globally using  `set global sql_mode = 'ANSI';` **Avoid using delimited identifiers for lab 2.**
