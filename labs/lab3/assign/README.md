# COSC 304 - Introduction to Database Systems<br>Assignment 3 - SQL

This assignment is on writing queries in SQL. These questions can be completed either on PrairieLearn or locally on your computer using Docker and MySQL. **Before starting the assignment, complete the [database setup using Docker](../setup)**.

## Question 1 (20 marks)

Given the following relational schema, write queries in **SQL** to answer the English questions. **There is a shipment database on MySQL.** [DDL is available](../ddl/ShipmentMySQL.sql). **You must only submit the SQL for your answers but you can include the query output as well to help the TA with marking.**

```
customer(cid: integer, cname: string, address: string, city: string, state: string)
product(pid: integer, pname: string, price: currency, inventory: integer)
shipment(sid: integer, cid: integer, shipdate: DateTime)
shippedproduct(sid: integer, pid: integer, amount: integer)
```

1. Return the product names, price, inventory, and inventory value of each product (`price*inventory`) (rename as `inventoryValue`) for products with price greater than `$20`. Order by product name ascending.

**Output:**
```
+-------------------------+-----------+-----------+----------------+
| pname                   | price     | inventory | inventoryValue |
+-------------------------+-----------+-----------+----------------+
| Deluxe Sweet Collection |     32.65 |        83 |        2709.95 |
| Desk                    |    250.99 |       100 |       25099.00 |
| Sports Car              | 123500.00 |         0 |           0.00 |
| Swiss Chocolate         |     32.99 |        40 |        1319.60 |
| Table                   |    500.00 |        44 |       22000.00 |
| Textbook                |    250.00 |        23 |        5750.00 |
| Wooden Chair            |     99.99 |        12 |        1199.88 |
+-------------------------+-----------+-----------+----------------+
```

2. Return the customer id, name, state, and shipment date for all customers in `'BC'` or `'IA'` that have had a shipment in `2022`. Note you can use [YEAR() function](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_year) to get the year form the shipment date or use date comparisons. Order by `shipdate` descending.

#### Output:
```
+-----+--------------+-------+---------------------+
| cid | cname        | state | shipdate            |
+-----+--------------+-------+---------------------+
|  11 | Aiden Adams  | BC    | 2022-09-24 00:00:00 |
|  10 | Suzanne May  | IA    | 2022-08-26 00:00:00 |
|   9 | Beth Rosebud | IA    | 2022-08-24 00:00:00 |
|  12 | Betty Bains  | BC    | 2022-08-24 00:00:00 |
|  15 | Elish Elias  | BC    | 2022-08-24 00:00:00 |
+-----+--------------+-------+---------------------+
```

3. Find all customers that either have the word `'street'` in their address or have no address. 

#### Output:
```
+-----+-----------------+---------------------+-----------+-------+
| cid | cname           | address             | city      | state |
+-----+-----------------+---------------------+-----------+-------+
|   2 | Joe Smithsonian | 245 Straight Street | Iowa City | IA    |
|   8 | Shannon Rose    | NULL                | Wyandotte | MI    |
|   9 | Beth Rosebud    | 1 First Street      | Muscatine | IA    |
|  10 | Suzanne May     | 2 Second Street     | Iowa City | IA    |
|  11 | Aiden Adams     | 324 2A Street       | Kelowna   | BC    |
|  12 | Betty Bains     | NULL                | Kelowna   | BC    |
|  13 | Cindy Champion  | 1 1st Street        | Calgary   | AB    |
|  14 | David Denter    | 23456 Main Street   | Vernon    | BC    |
+-----+-----------------+---------------------+-----------+-------+
```

4. Return a list of the distinct city and states of customers. Order output by `state` descending.

#### Output:
```
+------------------+-------+
| city             | state |
+------------------+-------+
| Morristown       | NJ    |
| Detroit          | MI    |
| Wyandotte        | MI    |
| Chicago          | IL    |
| Springfield      | IL    |
| Iowa City        | IA    |
| Muscatine        | IA    |
| Hollywood        | CA    |
| Huntington Beach | CA    |
| Kelowna          | BC    |
| Lake Country     | BC    |
| Vernon           | BC    |
| Calgary          | AB    |
+------------------+-------+
```

5. For each city, return the number of customers in that city and the number of shipments for customers in that city. **Hint: COUNT(DISTINCT *field*) may be useful.** Only show cities with at least 2 shipments. Order by number of shipments descending.

#### Output:
```
+------------------+--------------+--------------+
| city             | numCustomers | numShipments |
+------------------+--------------+--------------+
| Hollywood        |            1 |            4 |
| Iowa City        |            2 |            4 |
| Kelowna          |            2 |            4 |
| Lake Country     |            1 |            3 |
| Calgary          |            1 |            2 |
| Huntington Beach |            1 |            2 |
+------------------+--------------+--------------+
```

6. Return the top 5 products for state `'BC'` based on shipment revenue (`amount*price`) for the year `2021`. 

#### Output:
```
+-------+------+-------------------------+-----------+
| state | year | pname                   | revenue   |
+-------+------+-------------------------+-----------+
| BC    | 2021 | Sports Car              | 247000.00 |
| BC    | 2021 | Table                   |   6500.00 |
| BC    | 2021 | Textbook                |    500.00 |
| BC    | 2021 | Deluxe Sweet Collection |    326.50 |
| BC    | 2021 | Teddy Bear              |    103.92 |
+-------+------+-------------------------+-----------+
```

7. Return a list of products (id and name) along with the number of times it has been shipped, the total amount of all shipments, and the total value of all shipments. Only consider shipments after `March 10th, 2022`, and only show products if they have been shipped at least twice. Order by `totalValueShipped` descending.

#### Output:
```
+-----+-----------------+----------------------+--------------------+-------------------+
| pid | pname           | numberOfTimesShipped | totalAmountShipped | totalValueShipped |
+-----+-----------------+----------------------+--------------------+-------------------+
|   9 | Sports Car      |                    2 |                  2 |         247000.00 |
|   2 | Wooden Chair    |                    6 |                 38 |           3799.62 |
|  10 | Textbook        |                    2 |                  5 |           1250.00 |
|   1 | Swiss Chocolate |                    5 |                 21 |            692.79 |
|   8 | Table           |                    3 |                 38 |            113.62 |
|   4 | Chocolate Bar   |                    3 |                 17 |            101.15 |
|   3 | Teddy Bear      |                    2 |                  5 |             64.95 |
+-----+-----------------+----------------------+--------------------+-------------------+
```

8. Return pairs of products (only show a pair once) that appear together in the same shipment and have at least an `amount` of 2 in that shipment. Return the number of times the products appear together in a shipment ('numTogether'). Order by `numTogether` descending, then first product name ascending, and second product name ascending.

#### Output:
```
+-------------------------+-------------------------+-------------+
| pname                   | pname                   | numTogether |
+-------------------------+-------------------------+-------------+
| Swiss Chocolate         | Wooden Chair            |           2 |
| Chocolate Bar           | Deluxe Sweet Collection |           1 |
| Chocolate Bar           | Desk                    |           1 |
| Chocolate Bar           | Sports Car              |           1 |
| Chocolate Bar           | Table                   |           1 |
| Deluxe Sweet Collection | Sports Car              |           1 |
| Swiss Chocolate         | Chocolate Bar           |           1 |
| Swiss Chocolate         | Teddy Bear              |           1 |
| Swiss Chocolate         | Textbook                |           1 |
| Table                   | Table                   |           1 |
| Teddy Bear              | Chocolate Bar           |           1 |
| Teddy Bear              | Desk                    |           1 |
| Wooden Chair            | Chocolate Bar           |           1 |
| Wooden Chair            | Textbook                |           1 |
+-------------------------+-------------------------+-------------+
```

9. Return a complete list of  products (`pid`, `pname`), the total number of shipments, and total shipped amount that they have been shipped to customers in `'IA'`. 
**Hint: Start by writing a query to determine total shipments and amount for all products. Not all products will appear. To get all products, need a special join using a subquery that you just produced.**

#### Output:
```
+-----+-------------------------+--------------+--------------------+
| pid | pname                   | numShipments | totalShippedAmount |
+-----+-------------------------+--------------+--------------------+
|   1 | Swiss Chocolate         |            2 |                 24 |
|   2 | Wooden Chair            |            2 |                 34 |
|   3 | Teddy Bear              |         NULL |               NULL |
|   4 | Chocolate Bar           |         NULL |               NULL |
|   5 | Desk                    |         NULL |               NULL |
|   6 | Table                   |            1 |                  5 |
|   7 | Deluxe Sweet Collection |         NULL |               NULL |
|   8 | Table                   |            1 |                 25 |
|   9 | Sports Car              |         NULL |               NULL |
|  10 | Textbook                |            1 |                  2 |
+-----+-------------------------+--------------+--------------------+
```

10. Return the customers who have more shipments than the average number of shipments per customer. **Note: Hard question. May need more than one subquery including using subquery in FROM and HAVING clause.***

#### Output:
```
+-----+-----------------+--------------+
| cid | cname           | numShipments |
+-----+-----------------+--------------+
|   2 | Joe Smithsonian |            3 |
|   4 | Russell Johnson |            4 |
|   6 | Scott Charles   |            2 |
|  12 | Betty Bains     |            3 |
|  13 | Cindy Champion  |            2 |
|  15 | Elish Elias     |            3 |
+-----+-----------------+--------------+
```


