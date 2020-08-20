# COSC 304 - Introduction to Database Systems<br>Assignment 2 - Creating tables using SQL and MySQL

This assignment practices creating tables with SQL DDL. We will see later how to determine the relational table structure including fields and attributes. For this assignment, you will be given what the table should look like, and you need to write the SQL DDL.

## Question 1 (10 marks)

Write the SQL DDL to create the following 5 tables for an App store: Publisher, Category, App, AppVersion, AppVersionReview:

<ol>

<li>A <tt>Publisher</tt> table where each publisher is identified by an integer <tt>id</tt> and has a name (up to 40 characters). (1 mark)</li>

<li>A <tt>Category</tt> table where each ingredient has an id (integer), a name (up to 50 characters), and a parentId to identify its parent category. The parentId should be a foreign key to the Category table. (1.5 marks)</li>

<li>An <tt>App</tt> table storing each phone app that is identified by a field called <tt>id</tt> that is an integer.  Other attributes include name (string up to 40 characters), publisherId (integer), categoryId (integer), and description (string up to 255 characters).  <b><i>Make all foreign keys set to null on delete and no action (generate error) on update.</i></b> (2 marks)</li>

<li>A <tt>AppVersion</tt> table that stores each version of the app. The primary key is the appId and version (exactly 10 characters). Each release has a releaseDate (<tt>DATETIME</tt>), an integer rating, a price (up to 10 digits with 2 decimals), and a description (up to 500 characters). <b><i>Make all foreign keys set to perform cascade on delete and cascade on update.</i></b> (2 marks)</li>

<li>A <tt>AppVersionReview</tt> table that stores ratings for each application version. The primary key is the appId, version, and reviewer (exactly 20 characters). There is also a reviewDate (DATETIME), ratiing (int), and review (up to 1000 characters). <b><i>Make all foreign keys set to cascade on both update and delete.</i></b> (2 marks)</li>
</ol>

## Question 2 (10 marks)

Write the SQL DDL to perform the following modifications to the database created in Question 1.

### Insert (6 marks)

<p>Insert the following records into the appropriate tables.</p>

<ol>
<li>**Publisher -** <tt>(1,'Microsoft')</tt>  ; <tt>(2,'Zynga')</tt></li>
<li><b>Ingredient -</b> <tt>('BUTTR','Butter')</tt> ; <tt>('FLOUR','Flour')</tt> ; <tt>('MILK','Milk')</tt> ; <tt>('EGGS','Eggs')</tt> ; <tt>('SUGAR','Sugar')</tt></li>
<li><b>Recipe -</b> <tt>(100,'Cookies',1,'Mix butter, flour, milk, eggs, and sugar.  Then hope for the best.')</tt><br>
<tt>(200,'Bread',2,'Knead flour with milk and eggs.  Bake at 450F or until brown.')</tt>
</li>
<li><b>Requires - </b> You figure it out based on both recipes (choose your own amount).</li>
<li><b>Cook - </b> Recipe for bread was made on July 1st, 2015 (no comment).  Recipe for cookies was made on September 23rd, 2015 at 1:35:45 p.m.  Comment: 'It actually worked!'</li>
</ol>


<h3>Delete (2 marks)</h3>

<p>Delete all recipes written by <tt>'Fred Funk'</tt>. <strong>How many rows are deleted when this statement is run? (1 mark)</strong> Note: In addition to testing when the foreign key is ON CASCADE, also recommend you try the DELETE when the foreign key on Recipe is either SET NULL or NO ACTION to see the difference.</p>

<h3>Update (2 marks)</h3>

<p>Change the name of the ingredient with id <tt>'MILK'</tt> to <tt>'Skim Milk'</tt>.</p>
