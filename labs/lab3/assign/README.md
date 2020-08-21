# COSC 304 - Introduction to Database Systems<br>Assignment 3 - SQL

This assignment practices writing queries in SQL.

## Question 1 (20 marks)

Given the following relational schema, write queries in **SQL** to answer the English questions. **There is a shipment database on the MySQL server.** You can also use the [DDL for MySQL](ShipmentMySQL.sql) for use in your own database. **You must only submit the SQL for your answers but you can include the query output as well to help the TA with marking.**

<pre>
Customer(<i>cid:</i> integer, <i>cname:</i> string, <i>address:</i> string, <i>city:</i> string, <i>state:</i> string)
Product(<i>pid:</i> integer, <i>pname:</i> string, <i>price:</i> currency, <i>inventory:</i> integer)
Shipment(<i>sid:</i> integer, <i>cid:</i> integer, <i>shipdate:</i> Date/Time)
ShippedProduct(<i>sid:</i> integer, <i>pid:</i> integer, <i>amount:</i> integer)
</pre>

1. Return the customer name and city/state combined into one field called `cityState`. Use the [CONCAT](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_concat) function is MySQL. Order by `cityState` descending.

1. Test
1. Test

#### Output:
```
+-----------------+-----------------+
| cname           | cityState       |
+-----------------+-----------------+
| Shannon Rose    | Wyandotte, MI   |
| Fred Smith      | Springfield, IL |
| Beth Rosebud    | Muscatine, IA   |
| Robert Dean     | Morristown, NJ  |
| Joe Smithsonian | Iowa City, IA   |
| Suzanne May     | Iowa City, IA   |
+-----------------+-----------------+
```

1. Return the total amount of all products shipped and the distinct different items shipped (`pid`).

1. Test
1. Test

#### Output:
```
+-----------+-------------------------+
| sumAmount | distinctProductsShipped |
+-----------+-------------------------+
|       121 |                       4 |
+-----------+-------------------------+
```

1. For all customers in Iowa (`'IA'`) or New Jersey (`'NJ'`) list the customer name, product name, and amount for all shipments.

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

1. Return the number of shipments to customers with `street` in their address.

#### Output:
```
+-----+-----------------+--------------+
| cid | cname           | numShipments |
+-----+-----------------+--------------+
|   2 | Joe Smithsonian |            3 |
+-----+-----------------+--------------+
```

1. For each state, return the number of customers in that state and the number of shipments for customers in that state. Hint: COUNT(DISTINCT *field*) may be useful.

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

1. Return a list of cities and the total value of all shipments to customers in that city. Only show cities whose total value is greater than $1000.

#### Output:
```
+-----------+--------------------+
| city      | totalShipmentValue |
+-----------+--------------------+
| Hollywood |            1057.68 |
| Iowa City |            2427.80 |
+-----------+--------------------+
```

1. Return a list of products (id and name) along with the number of times it has been shipped, the total amount of all shipments, and the total value of all shipments. Only consider shipments after March 10th, 2014, and only show products if they have been shipped at least twice.

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

 1. Return pairs of products (only show a pair once) that appear together in the same shipment. Return the number of times the products appear together in a shipment ('numTogether'). 

#### Output:
```
+-----------------+--------------+-------------+
| pname           | pname        | numTogether |
+-----------------+--------------+-------------+
| Chocolate Bar   | Teddy Bear   |           1 |
| Swiss Chocolate | Wooden Chair |           1 |
+-----------------+--------------+-------------+
```

1. Return the products (name) whose name contains 's' with an inventory more than the average inventory.

#### Output:
```
+-------------------------+-----------+
| pname                   | inventory |
+-------------------------+-----------+
| Desk                    |       100 |
| Deluxe Sweet Collection |        83 |
+-------------------------+-----------+
```

1. Return the products (`pid`, `pname`) that are shipped less (in terms of amount) than the average amount products are shipped. Provide the number of shipments the product is in, the total shipped amount, and the average shipped amount. Order by total shipped amount descending.

#### Output:
```
+-----+-----------------+--------------+--------------------+------------------+
| pid | pname           | numShipments | totalShippedAmount | avgShippedAmount |
+-----+-----------------+--------------+--------------------+------------------+
|   1 | Swiss Chocolate |            4 |                 32 |           8.0000 |
|   3 | Teddy Bear      |            1 |                  1 |           1.0000 |
+-----+-----------------+--------------+--------------------+------------------+
```
