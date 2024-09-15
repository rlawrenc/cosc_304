# COSC 304 - Introduction to Database Systems<br>Assignment 2 - Creating tables using SQL and MySQL

This assignment practices SQL DDL. These are the same questions as on PrairieLearn but allow you to test them on your own database on your computer.

## Question 1 (10 marks)

Write the SQL DDL to create the following 5 tables describing cooking: recipe, ingredient, author, cook, requires:

- An `Author` table where each author is identified by an integer `id` and has a `name` (up to 30 characters).
  
- An `Ingredient` table where each ingredient has an `id` of exactly 5 characters and a `name` (up to 30 characters).
  
- A `Recipe` table where each recipe is identified by a field called `id` that is an integer. Other attributes include `name` (string up to 40 characters), `author id` (integer), and `directions` (string up to 255 characters). Make all foreign keys set to null on delete and no action (generate error) on update.
  
- A `Cook` table where each time a recipe is made it is identified by a date/time (DATETIME). The table also has a `recipe id` and a `comment` (string up to 255 characters). Make all foreign keys set to perform cascade on delete and cascade on update.
  
- A `Requires` table that stores what ingredients are needed in a recipe. This table has a `recipe id`, `ingredient id`, and `amount` (floating point number). Make all foreign keys set to cascade on both update and delete.

## Question 2 (10 marks)

Write the SQL DDL to perform the following modifications to the database created in Question 1.

### Insert (5 marks)

Insert the following records into the appropriate tables.

#### Author

```
(1,'Joe Smith')
(2,'Fred Funk')
```

#### Ingredient
```
('BUTTR','Butter')
('FLOUR','Flour')
('MILK','Milk')
('EGGS','Eggs')
('SUGAR','Sugar')
```

#### Recipe
(100,'Cookies',1,'Mix butter, flour, milk, eggs, and sugar. Then hope for the best.')
(200,'Bread',2,'Knead flour with milk and eggs. Bake at 450F or until brown.')

#### Requires
You figure it out based on both recipes (choose your own amount).

#### Cook
Recipe for bread was made on July 1st, 2015 (no comment). 
Recipe for cookies was made on September 23rd, 2015 at 1:35:45 p.m. Comment: 'It actually worked!'

### Update (2 marks)

1. Change the name of the ingredient with id 'MILK' to 'Skim Milk'.

1. Update passenger id `1` on flight `'AC35'` on the `7 a.m.` flight on `'2022-09-14'` to be seat `'2B'` rather than the current `'1A'`.

2. Delay all flights that depart Kelowna airport by 1 hour. (advance actual departure time) Note: To add an hour to a date use the syntax `DATE_ADD(your date field, INTERVAL 1 HOUR)`.

### Delete (3 marks)

1. Delete all recipes written by 'Fred Funk'. How many rows are deleted when this statement is run? (1 mark) Note: In addition to testing when the foreign key is ON CASCADE, also recommend you try the DELETE when the foreign key on Recipe is either SET NULL or NO ACTION to see the difference.

2. TODO

## Submission

Submission is done on Canvas.
