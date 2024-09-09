CREATE TABLE Customer (
	cid integer,
	cname varchar(30),
	address varchar(50),
	city varchar(30),
	state varchar(2),
	primary key (cid) );

CREATE TABLE Product (
	pid integer,
	pname varchar(30),
	price money,
	inventory integer,
	primary key (pid) );	

CREATE TABLE Shipment (
	sid	integer,
	cid	integer,
	shipdate datetime,	
	primary key (sid) );
	
CREATE TABLE ShippedProduct (
	sid	integer,
	pid	integer,
	amount integer,	
	primary key (sid, pid) );	

INSERT INTO Customer VALUES (1,'Fred Smith','101 Evergreen Terrace','Springfield','IL');
INSERT INTO Customer VALUES (2,'Joe Smithsonian','245 Straight Street','Iowa City','IA');
INSERT INTO Customer VALUES (3,'Steve Stevenson','24 Michigan Ave.','Chicago','IL');
INSERT INTO Customer VALUES (4,'Russell Johnson','1 Hollywood Drive','Hollywood','CA');
INSERT INTO Customer VALUES (5,'John Doe','34 Dead End Lane','Detroit','MI');
INSERT INTO Customer VALUES (6,'Scott Charles','748 Mayflower','Huntington Beach','CA');
INSERT INTO Customer VALUES (7,'Robert Dean','234 Greenwood Drive','Morristown','NJ');
INSERT INTO Customer VALUES (8,'Shannon Rose','Rural Route','Wyandotte','MI');
INSERT INTO Customer VALUES (9,'Beth Rosebud','1 First Street','Muscatine','IA');
INSERT INTO Customer VALUES (10,'Suzanne May','2 Second Street','Iowa City','IA');

INSERT INTO Product VALUES (1,'Swiss Chocolate',32.99,10);
INSERT INTO Product VALUES (2,'Wooden Chair',52,8);
INSERT INTO Product VALUES (3,'Teddy Bear',5.99,22);
INSERT INTO Product VALUES (4,'Chocolate Bar',3.95,12);
INSERT INTO Product VALUES (5,'Desk',122.99,100);
INSERT INTO Product VALUES (6,'Table',71,44);
INSERT INTO Product VALUES (7,'Deluxe Sweet Collection',41.55,83);


INSERT INTO Shipment VALUES (3,2,'2013-03-05 00:00:00');
INSERT INTO Shipment VALUES (4,3,'2014-05-13 00:00:00');
INSERT INTO Shipment VALUES (5,4,'2014-05-17 00:00:00');
INSERT INTO Shipment VALUES (6,4,'2014-02-02 00:00:00');
INSERT INTO Shipment VALUES (7,4,'2015-09-04 00:00:00');
INSERT INTO Shipment VALUES (8,4,'2015-05-19 00:00:00');
INSERT INTO Shipment VALUES (9,2,'2015-03-07 00:00:00');
INSERT INTO Shipment VALUES (10,2,'2011-03-09 00:00:00');
INSERT INTO Shipment VALUES (11,6,'2015-04-04 00:00:00');
INSERT INTO Shipment VALUES (12,7,'2015-05-05 00:00:00');
INSERT INTO Shipment VALUES (13,6,'2014-02-24 00:00:00');
INSERT INTO Shipment VALUES (14,6,'2013-12-22 00:00:00');

INSERT INTO ShippedProduct VALUES (3,1,20);
INSERT INTO ShippedProduct VALUES (4,1,5);
INSERT INTO ShippedProduct VALUES (5,2,13);
INSERT INTO ShippedProduct VALUES (6,1,4);
INSERT INTO ShippedProduct VALUES (6,2,1);
INSERT INTO ShippedProduct VALUES (7,1,3);
INSERT INTO ShippedProduct VALUES (8,4,25);
INSERT INTO ShippedProduct VALUES (9,2,32);
INSERT INTO ShippedProduct VALUES (10,2,2);
INSERT INTO ShippedProduct VALUES (11,2,5);
INSERT INTO ShippedProduct VALUES (12,3,1);
INSERT INTO ShippedProduct VALUES (12,4,10);



