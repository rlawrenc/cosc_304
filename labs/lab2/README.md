# COSC 304 - Introduction to Database Systems<br>Lab 2: SQL DDL: CREATE, INSERT, UPDATE, and DELETE

This lab practices SQL DDL.

<!--
Practice questions are available on [PrairieLearn]() and [GitHub](practice).
-->
Practice questions are [available](practice).

<!-- The assignment is completed on [PrairieLearn]() or [for testing on your own database](assign). -->
The [assignment](assign) is completed using MySQL on Docker and **requires computer setup by following these [setup instructions](../setup).**

<!--
The questions on PrairieLearn are running on [SQLite](https://www.sqlite.org/index.html). You are not required to setup MySQL on Docker for this assignment, but it is encouraged to learn these skills.
-->

Note: MySQL does not follow the standard for delimited identifiers using double-quotes ("). It uses backticks (\`) instead. To force it to use double-quotes, run this command when you start a session: `set session sql_mode = 'ANSI';` It is also possible to set this globally using  `set global sql_mode = 'ANSI';` **Avoid using delimited identifiers for lab 2.**
