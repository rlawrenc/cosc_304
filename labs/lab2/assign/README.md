# COSC 304 - Introduction to Database Systems<br>Assignment 2 - Creating tables using SQL and MySQL

This assignment practices creating tables with SQL DDL. We will see later how to determine the relational table structure including fields and attributes. For this assignment, you will be given what the table should look like, and you need to write the SQL DDL.

## Question 1 (10 marks)

Write the SQL DDL to create the following 5 tables for an App store: `Publisher`, `Category`, `App`, `AppVersion`, `AppVersionReview`:

1. A `Publisher` table where each publisher is identified by an integer `id` and has a `name` (up to 40 characters). (1 mark)

2. A <tt>Category</tt> table where each ingredient has an `id` (integer), a `name` (up to 50 characters), and a `parentId` to identify its parent category. The `parentId` should be a foreign key to the `Category` table. (1.5 marks)

3. An <tt>App</tt> table storing each app that is identified by a field called <tt>id</tt> that is an integer.  Other attributes include `name` (string up to 40 characters), `publisherId` (integer), `categoryId` (integer), and `description` (string up to 255 characters).  <b><i>Make all foreign keys set to null on delete and no action (generate error) on update.</i></b> (2 marks)

4. A <tt>AppVersion</tt> table that stores each version of the app. The primary key is the `appId` and `version` (exactly 10 characters). Each release has a `releaseDate` (<tt>DATETIME</tt>), an integer `rating`, a `price` (up to 10 digits with 2 decimals), and a `description` (up to 500 characters). <b><i>Make all foreign keys set to perform cascade on delete and cascade on update.</i></b> (2 marks)

5. A <tt>AppVersionReview</tt> table that stores ratings for each application version. The primary key is the `appId`, `version`, and `reviewer` (exactly 20 characters). There is also a `reviewDate` (`DATETIME`), `rating` (int), and `review` (up to 1000 characters). <b><i>Make all foreign keys set to cascade on both update and delete. A value for the reviewDate field is always required.</i></b> (2 marks)

## Question 2 (10 marks)

Write the SQL DDL to perform the following modifications to the database created in Question 1.

### Insert (4 marks)

Insert the following records into the appropriate tables.

<ol>
  <li><b>Publisher -</b> <tt>(1,'Microsoft')</tt>  <br> <tt>(2,'Zynga')</tt></li>
<li><b>Category -</b> <tt>(1,'Office Productivity',null)</tt> <br> <tt>(2,'Spreadsheets and Calculation Programs',1)</tt> <br> <tt>(3,'Games',null)</tt> <br> <tt>(4,'Strategy Games',3)</tt></li>
<li><b>App -</b> <tt>(100, 'Microsoft Excel', 1, 2, 'Spreadsheet')</tt><br>
<tt>(200, 'Words with Friends 2', 2, 3, 'Show what you know about words!')</tt>
</li>
  <li><b>AppVersion - </b> <tt>(100, '1.0', '2008-09-11', 1, 3.99, 'First version')</tt><br> 
    <tt>(100, '2.0', '2020-01-01', 5, 15.99, 'Best version for more money')</tt><br> 
    <tt>(200, '5.0', '2018-05-23', 3, 1.99, null)</tt><br> 
    <tt>(200, '6.1', '2020-07-11', 5, 0.99, 'Have fun!')</tt></li>
  <li><b>AppVersionReview - </b> <tt>(100, '1.0', 'Joe', '2008-09-11 08:00:00', 1, 'First review. It sucks!')</tt><br> 
    <tt>(100, '1.0', 'Steve', '2008-09-11 08:05:00', 5, 'It is awesome!')</tt><br>
    <tt>(100, '2.0', 'Padhu', '2020-02-03 11:23:45', 3, 'Decent')</tt><br>
    <tt>(100, '2.0', 'Chen', '2020-05-19 18:25:00', 4, 'Much improved');</tt><br>
    <tt>(200, '5.0', 'Amy', '2018-09-17 09:00:00', 3, 'Okay')</tt><br>
    <tt>(200, '6.1', 'Astra', '2020-11-22 10:03:00', 5, 'Addictive!')</tt></li>
</ol>


### Delete (3 marks)

1. Delete any `AppVersionReview` where the `rating` is less than or equal to `3`. (1 mark)

2. Delete all apps published by <tt>'Microsoft'</tt>. (1 mark) <strong>How many rows are deleted when this statement is run? (1 mark)</strong> Note: In addition to testing when the foreign key is ON CASCADE, also recommend you try the DELETE when the foreign key on Recipe is either SET NULL or NO ACTION to see the difference.


### Update (3 marks)

1. Update the `AppVersion` table so the `price` of every version of `appId 200` is `2.99`.

2. Update `App` with `id 100` to have an `id` of `300`.

3. Change the `app id 200 version '6.1'` to have `version='6.2'` and `releaseDate` of `August 12, 2020 at noon`.

## Submission

Submit on Canvas a complete DDL file with all commands.
