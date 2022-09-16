# COSC 304 - Introduction to Database Systems<br>Assignment 3 - SQL

This assignment practices writing queries in SQL. **Before starting the assignment, complete the [database setup using Docker](../)**.

## Question 1 (20 marks)

Given the following relational schema, write queries in **SQL** to answer the English questions. **There is a shipment database on MySQL.** [DDL is available](ShipmentMySQL.sql). **You must only submit the SQL for your answers but you can include the query output as well to help the TA with marking.**

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

2. Return the customer id, name, shipment date, and state for all customers in `'BC'` or `'IA'` that have had a shipment in `2022`. Note you can use [YEAR() function](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_year) to get the year form the shipment date or use date comparisons. Order by `shipdate` descending.

#### Output:
```
+-----------+-------------------------+
| sumAmount | distinctProductsShipped |
+-----------+-------------------------+
|       121 |                       4 |
+-----------+-------------------------+
```

3. For all customers in Iowa (`'IA'`) or New Jersey (`'NJ'`) list the customer name, product name, and amount for all shipments.

#### Output:
```
+-------+-----------------+-----------------+--------+
| state | cname           | pname           | amount |
+-------+-----------------+-----------------+--------+
| IA    | Joe Smithsonian | Swiss Chocolate |     20 |
| IA    | Joe Smithsonian | Wooden Chair    |     32 |
| IA    | Joe Smithsonian | Wooden Chair    |      2 |
| NJ    | Robert Dean     | Teddy Bear      |      1 |
| NJ    | Robert Dean     | Chocolate Bar   |     10 |
+-------+-----------------+-----------------+--------+
```

4. Return the number of shipments to customers with `street` in their address.

#### Output:
```
+-----+-----------------+--------------+
| cid | cname           | numShipments |
+-----+-----------------+--------------+
|   2 | Joe Smithsonian |            3 |
+-----+-----------------+--------------+
```

5. For each state, return the number of customers in that state and the number of shipments for customers in that state. Hint: COUNT(DISTINCT *field*) may be useful.

#### Output:
```
+-------+--------------+--------------+
| state | numCustomers | numShipments |
+-------+--------------+--------------+
| CA    |            2 |            7 |
| IA    |            1 |            3 |
| IL    |            1 |            1 |
| NJ    |            1 |            1 |
+-------+--------------+--------------+
```

6. Return a list of cities and the total value of all shipments to customers in that city. Only show cities whose total value is greater than $1000.

#### Output:
```
+-----------+--------------------+
| city      | totalShipmentValue |
+-----------+--------------------+
| Hollywood |            1057.68 |
| Iowa City |            2427.80 |
+-----------+--------------------+
```

7. Return a list of products (id and name) along with the number of times it has been shipped, the total amount of all shipments, and the total value of all shipments. Only consider shipments after March 10th, 2014, and only show products if they have been shipped at least twice.

#### Output:
```
+-----+-----------------+----------------------+--------------------+-------------------+
| pid | pname           | numberOfTimesShipped | totalAmountShipped | totalValueShipped |
+-----+-----------------+----------------------+--------------------+-------------------+
|   1 | Swiss Chocolate |                    2 |                  8 |            263.92 |
|   2 | Wooden Chair    |                    3 |                 50 |           2600.00 |
|   4 | Chocolate Bar   |                    2 |                 35 |            138.25 |
+-----+-----------------+----------------------+--------------------+-------------------+
```

8. Return pairs of products (only show a pair once) that appear together in the same shipment. Return the number of times the products appear together in a shipment ('numTogether'). 

#### Output:
```
+-----------------+--------------+-------------+
| pname           | pname        | numTogether |
+-----------------+--------------+-------------+
| Chocolate Bar   | Teddy Bear   |           1 |
| Swiss Chocolate | Wooden Chair |           1 |
+-----------------+--------------+-------------+
```

9. Return the products (name) whose name contains 's' with an inventory more than the average inventory.

#### Output:
```
+-------------------------+-----------+
| pname                   | inventory |
+-------------------------+-----------+
| Desk                    |       100 |
| Deluxe Sweet Collection |        83 |
+-------------------------+-----------+
```

10. Return the products (`pid`, `pname`) that are shipped less (in terms of amount) than the average amount products are shipped. Provide the number of shipments the product is in, the total shipped amount, and the average shipped amount. Order by total shipped amount descending.

#### Output:
```
+-----+-----------------+--------------+--------------------+------------------+
| pid | pname           | numShipments | totalShippedAmount | avgShippedAmount |
+-----+-----------------+--------------+--------------------+------------------+
|   1 | Swiss Chocolate |            4 |                 32 |           8.0000 |
|   3 | Teddy Bear      |            1 |                  1 |           1.0000 |
+-----+-----------------+--------------+--------------------+------------------+
```
