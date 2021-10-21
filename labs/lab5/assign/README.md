# COSC 304 - Introduction to Database Systems<br>Assignment 5 - Converting ER/UML diagrams into the relational model

## Note: Students may use AutoER or Astah.

## Question 1 (15 marks)

## Original Question (not AutoER)

**Draw the ER diagram for tracking football statistics for quarterbacks and runningbacks in college football and then
convert it into the relational schema. Underline primary keys and note foreign keys.** The league will have multiple teams, each with a unique team name. For each game played, there is a home team, an away team, home points, away points, and a date. All teams play multiple home and away games per season. The teams all have players that are identified by team name and jersey number. Also store a player name. The team name and number will be unique for each player, while their name may not be unique. Each player **ISA Runningback or ISA Quarterback (Add ISA constraints)**. Each running back has a type {fullback or halfback}.  Each quarterback has a status {starter, backup}. Statistics are compiled for each game for each player.  The Runningback statistics will include carries, yards, and fumbles. The quarterback statistics include passes, yards, and interceptions. In addition, each team is represented by a single coach.  A coach can coach only one team. Keep track of each coach's name and salary.

## Modified Question (for AutoER)

### AutoER Link: https://autoed.ok.ubc.ca/questions/5

### Note: In addition to AutoER diagram, submit a document containing the mapping to the relational model. SQL CREATE TABLE statements are not required. Just provide relation names, attributres, keys and foreign keys.

### Question Text 

**Draw the ER diagram for tracking football statistics for quarterbacks and runningbacks in college football and then
convert it into the relational schema. Underline primary keys and note foreign keys.** The league will have multiple teams, each with a unique team name. For each game played, there is a home team, an away team, home points, away points, and a date. A game is identified by the home team, away team, and the date. All teams play multiple home and away games per season. The teams have quarterbacks and runningbacks that are identified by team name and jersey number. Also store a player name. The team name and number will be unique for each player, while their name may not be unique. Each running back has a type {fullback or halfback}.  Each quarterback has a status {starter, backup}. Statistics are compiled for each game for each player.  The Runningback statistics will include carries, yards, and fumbles. The quarterback statistics include passes, yards, and interceptions. In addition, each team is represented by a single coach.  A coach can coach only one team. Keep track of each coach's name and salary.



## Question 2 (35 marks) - Project Deliverable

The project will build an online store like Amazon.com selling whatever products you want. The first step is to develop a database design and convert that design into SQL DDL. 

### Note: Database design can be done using AutoER: https://autoed.ok.ubc.ca/questions/7

Description:

- A <strong>Customer</strong> is identified by an auto-increment id. Other attributes include first name, last name, email, phone number, street address, city, province/state, postal code, and country. A <strong>Customer</strong> also has a user id (unique) and password.

- A customer may have one or more payment methods. A <strong>Payment Method</strong> has an auto-increment id for a key, a payment method type (PayPal, Visa, etc.), payment number, and payment expiry date.

- An <strong>Order</strong> is placed by one customer. A customer may have multiple orders. An <strong>Order</strong> has an auto-increment id, order date, and total order amount (e.g. $55.75). Also store the shipment address, city, state, country, and postal code. Use <strong>OrderSummary</strong> as entity/table name as <strong>Order</strong> is a keyword in SQL.

- The store sells products. A <strong>Product</strong> has an auto-increment id, name, price, image URL (string), image (BLOB), and description.

- A product has a category. A category has one or more Products. A <strong>Category</strong> has an auto-increment id and name.

- Products are part of an order. An order may have one or more products. For each product in an order track the quantity and price.

- An order is shipped with a shipment. A <strong>Shipment</strong> has an auto-increment id, a shipment date, and a description. A shipment contains only one order.

- A <strong>Warehouse</strong> contains products. A product may be stored at multiple warehouses with different inventory values. A shipment will be sent from only one warehouse. A <strong>Warehouse</strong> has an auto-increment id and a name.

- For each customer, track their shopping cart which will contain one or more products each with a quantity and price.

- A product may have reviews by customers. A <strong>Review</strong> by a customer on a product has an auto-increment id, rating (1 to 5), comment, and review date. A customer does not have to buy a product in order to provide a review. A customer may review a product more than once.

### Deliverables

**1. Draw the ER/UML diagram for this database. (21 marks)** AutoER Link: https://autoed.ok.ubc.ca/questions/7

**2. Convert the UML diagram into SQL DDL. Make sure to define primary keys and foreign keys. Your SQL DDL must run on either MySQL or Microsoft SQL Server. (11 marks)**

**3. Determine what you are going to sell in your store. Write a mission statement (1 mark) and executive summary paragraph (2 marks) describing your idea.**

**Items to submit: your UML diagram (image preferred rather than astah file), a text file containing your SQL DDL, a document with your mission statement and executive summary.**

[Best Prior Year Projects](https://people.ok.ubc.ca/rlawrenc/teaching/304/Project/index.html)



