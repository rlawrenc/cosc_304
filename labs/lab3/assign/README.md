# COSC 304 - Introduction to Database Systems<br>Assignment 3 - SQL

This assignment is on writing queries in SQL. These questions can be completed either on [PrairieLearn](https://plcanary.ok.ubc.ca/pl/course_instance/6/assessment/143) or locally on your computer using Docker and MySQL. **Before starting the assignment, complete the [database setup using Docker](../setup)**. **Submit the lab answers on Canvas as a text file or document that contains all of your SQL commands or show a TA your SQL commands in a help session.**

## Question 1 (20 marks)

Given the following relational schema, write queries in **SQL** to answer the English questions. **There is a shipment database on MySQL.** [DDL is available](../ddl/ShipmentMySQL.sql). **You must only submit the SQL for your answers but you can include the query output as well to help the TA with marking.**

```
customer(cid: integer, cname: string, address: string, city: string, state: string)
product(pid: integer, pname: string, price: currency, inventory: integer)
shipment(sid: integer, cid: integer, shipdate: DateTime)
shippedproduct(sid: integer, pid: integer, amount: integer)
```

1. Return the customer name and address as one field called `fullAddress` that consists of the address, city, state. Only show customers in `'IA'` or `'BC'` that have a valid address. Order by customer name ascending. Hint: You will need the [`concat` function](https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_concat) in MySQL or the concatenate operator (`||`) if using PrairieLearn.

**Output:**
```
+-----------------+-------------------------------------+
| cname           | fullAddress                         |
+-----------------+-------------------------------------+
| Aiden Adams     | 324 2A Street, Kelowna, BC          |
| Beth Rosebud    | 1 First Street, Muscatine, IA       |
| David Denter    | 23456 Main Street, Vernon, BC       |
| Elish Elias     | 3445 Hwy 97 North, Lake Country, BC |
| Joe Smithsonian | 245 Straight Street, Iowa City, IA  |
| Suzanne May     | 2 Second Street, Iowa City, IA      |
+-----------------+-------------------------------------+
```

2. Return the shipment id, shipment date, product id, and amount for all shipments in `2022` where there was a product shipped with an amount greater than `8`. Only show a shipment once and order by shipment date descending and amount descending. Note: <strong>PrairieLearn uses SQLite</strong>. To extract year from DATETIME see the following link: <a href="https://database.guide/how-to-extract-the-day-month-and-year-from-a-date-in-sqlite/">Extract Year in SQLite</a>. When using MySQL you can use <a href="https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_year">YEAR()</a> function to get the year from the shipment date or use date comparisons.

#### Output:
```
+-----+---------------------+-----+--------+
| sid | shipdate            | pid | amount |
+-----+---------------------+-----+--------+
|  15 | 2022-08-24 00:00:00 |   8 |     25 |
|  19 | 2022-08-24 00:00:00 |   8 |     12 |
|   5 | 2022-07-17 00:00:00 |   2 |     13 |
|  12 | 2022-07-05 00:00:00 |   4 |     10 |
+-----+---------------------+-----+--------+
```

3. Find all customers that have an `'R'` or `'T'` in their name and have a state of `'MI'` or `'IA'`. Order by customer name descending. 

#### Output:
```
  +-----+-----------------+---------------------+-----------+-------+
  | cid | cname           | address             | city      | state |
  +-----+-----------------+---------------------+-----------+-------+
  |   8 | Shannon Rose    | NULL                | Wyandotte | MI    |
  |   2 | Joe Smithsonian | 245 Straight Street | Iowa City | IA    |
  |   9 | Beth Rosebud    | 1 First Street      | Muscatine | IA    |
  +-----+-----------------+---------------------+-----------+-------+
```

4. Return a list of the unique product id and names that have shipped before with an amount less than `5`. Order by product id descending.

#### Output:
```
+-----+-------------------------+
| pid | pname                   |
+-----+-------------------------+
|  10 | Textbook                |
|   9 | Sports Car              |
|   8 | Table                   |
|   7 | Deluxe Sweet Collection |
|   4 | Chocolate Bar           |
|   3 | Teddy Bear              |
|   2 | Wooden Chair            |
|   1 | Swiss Chocolate         |
+-----+-------------------------+
```

5. For each state, return the number of customers in that state and the number of shipments for customers in that state. **Hint: `COUNT(DISTINCT *field*)` may be useful.** Only show states with at least 2 shipments. Order by number of shipments descending. Note: Count customers in a state even if they do not have any shipments.

#### Output:
```
+-------+--------------+--------------+
| state | numCustomers | numShipments |
+-------+--------------+--------------+
| BC    |            4 |            7 |
| CA    |            2 |            6 |
| IA    |            3 |            5 |
| AB    |            1 |            2 |
+-------+--------------+--------------+
```

6. Return the top 3 products for state `'AB'` based on shipment revenue (`amount*price`) for the year `2022`. 

#### Output:
```
+-------+------+--------------+-----------+
| state | year | pname        | revenue   |
+-------+------+--------------+-----------+
| AB    | 2022 | Sports Car   | 123500.00 |
| AB    | 2022 | Textbook     |    750.00 |
| AB    | 2022 | Wooden Chair |    499.95 |
+-------+------+--------------+-----------+
```

7. Return a list of products (id and name) along with the number of times it has been shipped, the total amount of all shipments, and the total value of all shipments. Only consider shipments after `September 1st, 2021`, and only show products if they have been shipped at least three times and have a `totalValueShipped > $110`. Order by `totalAmountShipped` ascending.

#### Output:
```
+-----+-----------------+----------------------+--------------------+-------------------+
| pid | pname           | numberOfTimesShipped | totalAmountShipped | totalValueShipped |
+-----+-----------------+----------------------+--------------------+-------------------+
|  10 | Textbook        |                    3 |                  6 |           1500.00 |
|   2 | Wooden Chair    |                    6 |                 38 |           3799.62 |
|   8 | Table           |                    3 |                 38 |            113.62 |
|   1 | Swiss Chocolate |                    7 |                 44 |           1451.56 |
+-----+-----------------+----------------------+--------------------+-------------------+
```

8. Return pairs of customers (only show a pair once) that have been shipped the same product. Return the number of times the pair of customers have been shipped the same product (`numShippedProducts`). Order by `numShippedProducts` descending, then first customer name ascending, and second customer name ascending. Note: If product 1 is in two shipments for customer 4 and two shipments for customer 15, that counts as 4 (2 x 2). We are not eliminating any duplicates when counting in this question. Show customer pairs that have 5 or more times that they have been shipped the same product.

#### Output:
```
+-----+-----------------+-----+-----------------+----------------+
| cid | cname           | cid | cname           | numSameShipped |
+-----+-----------------+-----+-----------------+----------------+
|   4 | Russell Johnson |  15 | Elish Elias     |              7 |
|   4 | Russell Johnson |   6 | Scott Charles   |              7 |
|   2 | Joe Smithsonian |   4 | Russell Johnson |              6 |
|   2 | Joe Smithsonian |   6 | Scott Charles   |              5 |
|   6 | Scott Charles   |  15 | Elish Elias     |              5 |
+-----+-----------------+-----+-----------------+----------------+
```

9. Return a complete list of all customers (`cid`, `cname`), the total number of shipments, and total shipped value (`amount*price`) that they have been shipped. Return the bottom five customers by total shipped value.

#### Output:
```
+-----+-----------------+--------------+-------------------+
| cid | cname           | numShipments | totalShippedValue |
+-----+-----------------+--------------+-------------------+
|   1 | Fred Smith      |            0 |              NULL |
|   5 | John Doe        |            0 |              NULL |
|  14 | David Denter    |            0 |              NULL |
|   7 | Robert Dean     |            1 |             72.49 |
|   3 | Steve Stevenson |            1 |            164.95 |
+-----+-----------------+--------------+-------------------+
```

10. Return the products that are shipped more often than the average number of times a product is shipped. Order by number of shipments descending and product id ascending. **Note: Hard question. May need more than one subquery including using subquery in FROM and HAVING clause.**

#### Output:
```
+-----+-----------------+--------------+
| pid | pname           | numShipments |
+-----+-----------------+--------------+
|   1 | Swiss Chocolate |            8 |
|   2 | Wooden Chair    |            8 |
|   4 | Chocolate Bar   |            6 |
|  10 | Textbook        |            5 |
+-----+-----------------+--------------+
```


