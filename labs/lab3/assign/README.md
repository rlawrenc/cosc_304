# COSC 304 - Introduction to Database Systems<br>Assignment 3 - SQL

This assignment practices writing queries in SQL.

## Question 1 (20 marks)

Given the following relational schema, write queries in **SQL** to answer the English questions. **There is a shipment database on the MySQL own and Oracle APEX online servers.** Please deploy the [DDL for MySQL](ShipmentMySQL.sql) for use in your own [DDL for Oracle APEX using script](ShipmentLab3Oracle.sql) database. **You must only submit the SQL for your answers but you can include the query output as well to help the TA with marking.**

```
Customer(cid: integer, cname: string, address: string, city: string, state: string)
Product(pid: integer, pname: string, price: currency, inventory: integer)
Shipment(sid: integer, cid: integer, shipdate: DateTime)
ShippedProduct(sid: integer, pid: integer, amount: integer)
```

1. Return the customer name and city/state combined into one field called `cityState`. Use the [CONCAT](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_concat) function in MySQL and in [Oracle Concat](https://www.oracletutorial.com/oracle-string-functions/oracle-concat/). Order by `cityState` ascending. Only show cities with name greater than `'D'`.

**Output:**
```
cname            cityState           
---------------  --------------------
John Doe         Detroit, MI         
Russell Johnson  Hollywood, CA       
Scott Charles    Huntington Beach, CA
Joe Smithsonian  Iowa City, IA       
Suzanne May      Iowa City, IA       
Robert Dean      Morristown, NJ      
Beth Rosebud     Muscatine, IA       
Fred Smith       Springfield, IL     
Shannon Rose     Wyandotte, MI  
```

2. Return the total amount of all products shipped, the distinct different items shipped (`pid`) and the distinct different shipments (`sid`).

#### Output:
```
sumAmount  distinctProductsShipped  distinctShipments
---------  -----------------------  -----------------
      121                        4                 10
```

3. For all customers in Illinois (`IL`) or New Jersey (`NJ`) or California (`CA`) list the customer name, customer address, product name, and amount for all shipments.

#### Output:
```
state  cname            address              pname            amount
-----  ---------------  -------------------  ---------------  ------
IL     Steve Stevenson  24 Michigan Ave.     Swiss Chocolate       5
CA     Russell Johnson  1 Hollywood Drive    Wooden Chair         13
CA     Russell Johnson  1 Hollywood Drive    Swiss Chocolate       4
CA     Russell Johnson  1 Hollywood Drive    Wooden Chair          1
CA     Russell Johnson  1 Hollywood Drive    Swiss Chocolate       3
CA     Russell Johnson  1 Hollywood Drive    Chocolate Bar        25
CA     Scott Charles    748 Mayflower        Wooden Chair          5
NJ     Robert Dean      234 Greenwood Drive  Teddy Bear            1
NJ     Robert Dean      234 Greenwood Drive  Chocolate Bar        10
```

4. Return the number of shipments to customers with `Drive` in their address.

#### Output:
```
cid  cname            numShipments
---  ---------------  ------------
  4  Russell Johnson             4
  7  Robert Dean                 1
```

5. For each city, return the number of customers in that city and the number of shipments for customers in that city. Hint: COUNT(DISTINCT *field*) may be useful.

#### Output:
```
CITY              NUMCUSTOMERS      NUMSHIPMENTS
Huntington Beach  1                 3
Morristown        1                 1
Chicago           1                 1
Iowa City         1                 3
Hollywood         1                 4           

```

6. Return a list of states and the total value of all shipments to customers in that state. Only show states whose total value is less than or equal to $2000.

#### Output:
```
state  totalShipmentValue
-----  ------------------
CA                1317.68
IL                 164.95
NJ                  45.49
```

7. Return a list of products (id and name) along with the number of times it has been shipped, the total amount of all shipments, and the total value of all shipments. Only consider shipments after February 4th, 2013, and only show products if they have been shipped at most five times.

#### Output:
```
pid  pname            numberOfTimesShipped  totalAmountShipped  totalValueShipped
---  ---------------  --------------------  ------------------  -----------------
  1  Swiss Chocolate                     4                  32            1055.68
  2  Wooden Chair                        4                  51            2652.00
  3  Teddy Bear                          1                   1               5.99
  4  Chocolate Bar                       2                  35             138.25
```

8. Return pairs of products (only show a pair once) and their id ('pid') that appear together in the same shipment. Return the number of times the products appear together in a shipment ('numTogether'). 

#### Output:
```
+-----------------+--------------+-------------+
| pname           | pname        | numTogether |
+-----------------+--------------+-------------+
| Chocolate Bar   | Teddy Bear   |           1 |
| Swiss Chocolate | Wooden Chair |           1 |
+-----------------+--------------+-------------+
```

9. Return the products (name) whose name contains 'c' with an inventory less than the average inventory.

#### Output:
```
pname            inventory
---------------  ---------
Swiss Chocolate         10
Wooden Chair             8
Chocolate Bar           12
```

10. Return the products and price (`pid`, `pname`, `price`) that are shipped less (in terms of amount) than the average amount products are shipped. Provide the number of shipments the product is in, the total shipped amount, and the average shipped amount. Order by total shipped amount ascending.

#### Output:
```
pid  pname            price  numShipments  totalShippedAmount  avgShippedAmount
---  ---------------  -----  ------------  ------------------  ----------------
  3  Teddy Bear        5.99             1                   1            1.0000
  1  Swiss Chocolate  32.99             4                  32            8.0000
```
