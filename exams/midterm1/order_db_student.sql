DROP TABLE OrderProduct;
DROP TABLE Orders;
DROP TABLE Product;
DROP TABLE Customer;
DROP TABLE Employee;

CREATE TABLE Customer (
   custId 		int PRIMARY KEY,
   custName		VARCHAR(20)
);

CREATE TABLE Employee (
   empId 		int PRIMARY KEY,
   empName		VARCHAR(20),
   salary		DECIMAL(10,2),
   supervisorId 	int,
   FOREIGN KEY (supervisorId) REFERENCES Employee(empId)
);

CREATE TABLE Product (
   prodId		int PRIMARY KEY,
   prodName		VARCHAR(50),
   listPrice	DECIMAL(10,2)   
);

-- TODO: As part of the exam
CREATE TABLE Orders (
   
);

CREATE TABLE OrderProduct (
   ordId       	int	NOT NULL,
   prodId     	int	NOT NULL,
   quantity     int,
   price        DECIMAL(10,2),
   PRIMARY KEY (ordId, prodId),
   FOREIGN KEY (ordId) REFERENCES Orders(ordId) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (prodId) REFERENCES Product(prodId) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Customer VALUES (1, 'Steve');
INSERT INTO Customer VALUES (2, 'Jennifer');
INSERT INTO Customer VALUES (3, 'Megan');
INSERT INTO Customer VALUES (4, 'Leah');
INSERT INTO Customer VALUES (5, 'Frank');

INSERT INTO Product VALUES(1, 'Book', 15.00);
INSERT INTO Product VALUES(2, 'Chair', 125.00);
INSERT INTO Product VALUES(3, 'Table', 500.00);
INSERT INTO Product VALUES(4, 'Lamp', 35.99);
INSERT INTO Product VALUES(5, 'Mini-Fridge', 99.99);

INSERT INTO Employee VALUES (20, 'Leah', 75000, null);
INSERT INTO Employee VALUES (10, 'Fred', 35000, 20);
INSERT INTO Employee VALUES (30, 'Ronald', 40000, 20);
INSERT INTO Employee VALUES (40, 'Sarah', 50000, 30);

INSERT INTO Orders VALUES(100, '2000-10-10', 1, 10, 750.00);
INSERT INTO Orders VALUES(200, '2005-01-08', 2, 20, 50.99);
INSERT INTO Orders VALUES(300, '2009-10-22', 2, 20, 99.99);
INSERT INTO Orders VALUES(400, '2019-10-10', 2, 30, 150.00);
INSERT INTO Orders VALUES(500, '2019-10-12', 1, 10, 35.99);
INSERT INTO Orders VALUES(600, '2020-10-12', 3, 30, 250.00);
INSERT INTO Orders VALUES(700, '2020-10-14', 4, 20, 99.99);

INSERT INTO OrderProduct VALUES(100, 2, 2, 125.00);
INSERT INTO OrderProduct VALUES(100, 3, 1, 500.00);
INSERT INTO OrderProduct VALUES(200, 1, 1, 15.00);
INSERT INTO OrderProduct VALUES(200, 4, 1, 35.99);
INSERT INTO OrderProduct VALUES(300, 5, 1, 99.99);
INSERT INTO OrderProduct VALUES(400, 1, 10, 15.00);
INSERT INTO OrderProduct VALUES(500, 4, 1, 35.99);
INSERT INTO OrderProduct VALUES(600, 2, 2, 125.00);
INSERT INTO OrderProduct VALUES(700, 5, 1, 99.99);

