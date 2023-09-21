# COSC 304 - Introduction to Database Systems<br>Assignment 2 - Creating tables using SQL and MySQL

This assignment practices SQL DDL. These are the same questions as on PrairieLearn but allow you to test them on your own database on your computer.

## Question 1 (10 marks)

Write the SQL DDL to create the following 5 tables describing airports, airplanes, passengers, and flights:

- An `Airplane` table where each airplane is identified by a field called `id` that is a string of up to 10 characters. Other attributes include `model` (string up to 20 characters), and a `manufactureDate`. (1 mark)

- An `Airport` table where each airport has an `id` of exactly 5 characters, a `name` (up to 30 characters), and is located in a `city` (up to 40 characters), a `province` (up to 20 characters), and a `country` (up to 20 characters). (1.5 marks)

- A `Flight` table where each flight is identified by **both** a `number` (exactly 5 characters) and `departDateTime` (DATETIME). Note that the flight number does not by itself identify a flight as airlines reuse flight numbers. A flight departs from one airport (`departAirport`) and arrives at another (`arriveAirport`). Besides the departure date/time, there is an expected `arrivalDateTime`, and `actualDepartDateTime` and `actualArrivalDateTime`. Each flight record also stores the airplane `id` of the plane. ***Make all foreign keys set to null on delete and cascade on update.*** (3 marks)

- A `Passenger` table where each passenger is identified by an integer `id`. Also store a `firstname` and `lastname` (both up to 30 characters) and a `birthdate`. Other attributes include `street` (50 chars), `city` (40 chars), `province` (20 chars), and `country` (20 chars). (1.5 marks)

- An `OnFlight` table that stores information about passengers on flights. Each record stores the `passengerId`, `flightNumber`, `flightDepartDateTime`, and a `seatNum` (exactly 4 characters). ***Make all foreign keys set to perform no action (generate error) on delete and cascade on update.*** (3 marks)


## Question 2 (10 marks)

Write the SQL DDL to perform the following modifications to the database created in Question 1.

### Insert (5 marks)

Insert the following records into the appropriate tables.

#### Airplane
```
('AC911','Boeing 747', '2001-01-25')
('WJ455', 'Airbus A380', '2008-11-15')
```

#### Airport 
```
('YLW','Kelowna Airport','Kelowna','British Columbia', 'Canada')
('YWG','Winnipeg Airport','Winnipeg','Manitoba', 'Canada')
```

#### Flight 
```
('AC35', 'YLW', 'YWG', 'AC911', '2022-09-14 07:00:00', '2022-09-14 15:00:00', '2022-09-14 07:05:00', '2022-09-14 15:30:00')
('WJ111', 'YWG', 'YLW', 'WJ455', '2022-09-15 10:00:00', '2022-09-15 12:00:00', '2022-09-15 09:55:00', '2022-09-14 11:49:55')
```

#### Passenger
```
(1, 'Joe', 'Smith', '1970-12-15', '1350 Springfield Road', 'Kelowna', 'British Columbia', 'Canada')
(2, 'Fred', 'Brothers', '1950-01-02', '22 Pembina Highway', 'Winnipeg', 'Manitoba', 'Canada')
```

#### OnFlight 
```
(1, 'AC35', '2022-09-14 07:00:00', '1A')
(1, 'WJ111', '2022-09-15 10:00:00', '10C')
(2, 'AC35', '2022-09-14 07:00:00', '2A')
(2, 'WJ111', '2022-09-15 10:00:00', '10D')
```

### Update (2 marks)

1. Update passenger id `1` on flight `'AC35'` on the `7 a.m.` flight on `'2022-09-14'` to be seat `'2B'` rather than the current `'1A'`.

2. Delay all flights that depart Kelowna airport by 1 hour. (advance actual departure time) Note: To add an hour to a date use the syntax `DATE_ADD(your date field, INTERVAL 1 HOUR)`.

### Delete (3 marks)

1. The Kelowna airport is destroyed! Remove it from the `Airport` table. Note the changes to the flight table due to `SET NULL` foreign key action.

2. Remove the unruly passenger `1` from flight `'WJ111'` on the `10 a.m.` flight on `'2022-09-15'`.

3. Delete all on flight records for `'Fred Brothers'`. Note: You do not have to use a subquery for this question but try if you can!

## Submission

Submission is done on Canvas.
