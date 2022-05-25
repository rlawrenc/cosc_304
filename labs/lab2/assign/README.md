# COSC 304 - Introduction to Database Systems<br>Assignment 2 - Creating tables using SQL and MySQL

This assignment practices creating tables with SQL DDL. We will see later how to determine the relational table structure including fields and attributes. For this assignment, you will be given what the table should look like, and you need to write the SQL DDL.

## Question 1 (10 marks)

Write the SQL DDL to create the following 5 tables for an App store: `Publisher`, `Category`, `App`, `AppVersion`, `AppVersionReview`:

1. A `Publisher` table where each publisher is identified by an integer `id` and has a `name` (up to 60 characters). (1 mark)

2. A <tt>Category</tt> table where each category has an `id` (integer), a `name` (up to 60 characters), and a `parentId` to identify its parent category. The `parentId` should be a foreign key to the `Category` table. (1.5 marks)

3. An <tt>App</tt> table storing each app that is identified by a field called <tt>id</tt> that is an integer.  Other attributes include `name` (string up to 60 characters), `publisherId` (integer), `categoryId` (integer), and `description` (string up to 255 characters).  <b><i>Make all foreign keys set to null on delete and no action (generate error) on update.</i></b> (2 marks)

4. A <tt>AppVersion</tt> table that stores each version of the app. The primary key is the `appId` and `version` (exactly 10 characters). Each release has a `releaseDate` (<tt>DATETIME</tt> in MySQL or <tt>DATE</tt> in Oracle (APEX)), an integer `rating`, a `price` (up to 10 digits with 2 decimals), and a `description` (up to 500 characters). <b><i>Make all foreign keys set to perform cascade on delete.</i></b> In Oracle please use TO_DATE function with appropriate Date format. Examples: TO_DATE('2008-09-11','yyyy-mm-dd') or TO_DATE('2008-09-11 08:00:00','yyyy-mm-dd hh24:mi:ss').(2 marks)

5. A <tt>AppVersionReview</tt> table that stores ratings for each application version. The primary key is the `appId`, `version`, and `reviewer` (exactly 20 characters). There is also a `reviewDate` (`DATETIME`), `rating` (int), and `review` (up to 1000 characters). <b><i>Make all foreign keys set to cascade on delete. A value for the reviewDate field is always required.</i></b> (2 marks)

## Question 2 (10 marks)

Write the SQL statement to insert records in the following the tables created in Question 1.

### Insert (4 marks)

Insert the following records into the appropriate tables.

<ol>
  <li><b>Publisher -</b> <tt>(1,'Adobe')</tt>  <br> <tt>(2,'Ubisoft')</tt></li>
<li><b>Category -</b> <tt>(1,'Photo and Video',null)</tt> <br> <tt>(2,'Editing photos and videos',1)</tt> <br> <tt>(3,'Games',null)</tt> <br> <tt>(4,'Strategy Games',3)</tt></li>
<li><b>App -</b> <tt>(100, 'Photoshop', 1, 2, 'Bring your pictures to life')</tt><br>
<tt>(200, 'Hungry Shark World', 2, 3, 'Endless hunt, eat to survive!')</tt>
</li>
  <li><b>AppVersion - </b> <tt>(100, '1.0', '2008-09-11', 1, 4.99, 'First version')</tt><br> 
    <tt>(100, '2.0', '2020-01-01', 5, 19.99, 'Premium version for more money')</tt><br> 
    <tt>(200, '5.0', '2018-05-23', 3, 1.99, null)</tt><br> 
    <tt>(200, '6.1', '2020-07-11', 5, 0.99, 'Have fun!')</tt></li>
  <li><b>AppVersionReview - </b> <tt>(100, '1.0', 'Joe', '2008-09-11 08:00:00', 1, 'First review. Horrible!')</tt><br> 
    <tt>(100, '1.0', 'Steve', '2008-09-11 08:05:00', 2, 'Not worht it')</tt><br>
    <tt>(100, '2.0', 'Padhu', '2020-02-03 11:23:45', 3, 'Average')</tt><br>
    <tt>(100, '2.0', 'Chen', '2020-05-19 18:25:00', 4, 'Better than previous version');</tt><br>
    <tt>(200, '5.0', 'Amy', '2018-09-17 09:00:00', 3, 'not bad')</tt><br>
    <tt>(200, '6.1', 'Astra', '2020-11-22 10:03:00', 5, 'Brilliant!')</tt></li>
</ol>


### Delete (3 marks)

1. Delete any `AppVersionReview` where the `rating` is less than or equal to `3`. (1 mark)

2. Delete all apps published by <tt>'Adobe'</tt>. (1 mark) 

3. <strong>How many rows are deleted when the previous DELETE statement is run? (1 mark)</strong> Note: In addition to testing when the foreign key is ON CASCADE, also recommend you try the DELETE when the foreign key on is either SET NULL or NO ACTION to see the difference.


### Update (3 marks, 1.5 each)

1. Update the `AppVersion` table so the `price` of every version of `appId 200` is `2.99`.

2. Update `App` with `id 100` to have an `id` of `700`. (-- Removed this task, because Oracle dosen't ON UPDATE CASCADE)

## Submission

Submit on Canvas a complete DDL file with all commands.
