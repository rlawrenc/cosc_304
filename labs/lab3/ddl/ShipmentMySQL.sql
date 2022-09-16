CREATE DATABASE IF NOT EXISTS shipment;

USE shipment;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS shipment;
DROP TABLE IF EXISTS shippedproduct;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE customer (
	cid integer,
	cname varchar(30),
	address varchar(50),
	city varchar(30),
	state varchar(2),
	primary key (cid) 
	) ENGINE=InnoDB;

CREATE TABLE product (
	pid integer,
	pname varchar(30),
	price decimal(9,2),
	inventory integer,
	primary key (pid) 
	) ENGINE=InnoDB;	

CREATE TABLE shipment (
	sid integer,
	cid integer,
	shipdate datetime,	
	primary key (sid),
	foreign key (cid) REFERENCES customer(cid)
	) ENGINE=InnoDB;
	
CREATE TABLE shippedproduct (
	sid integer,
	pid integer,
	amount integer,	
	primary key (sid, pid),
	foreign key (sid) REFERENCES shipment(sid),
	foreign key (pid) REFERENCES product(pid)
	) ENGINE=InnoDB;	


INSERT INTO customer VALUES (1,'Fred Smith','101 Evergreen Terrace','Springfield','IL');
INSERT INTO customer VALUES (2,'Joe Smithsonian','245 Straight Street','Iowa City','IA');
INSERT INTO customer VALUES (3,'Steve Stevenson','24 Michigan Ave.','Chicago','IL');
INSERT INTO customer VALUES (4,'Russell Johnson','1 Hollywood Drive','Hollywood','CA');
INSERT INTO customer VALUES (5,'John Doe','34 Dead End Lane','Detroit','MI');
INSERT INTO customer VALUES (6,'Scott Charles','748 Mayflower','Huntington Beach','CA');
INSERT INTO customer VALUES (7,'Robert Dean','234 Greenwood Drive','Morristown','NJ');
INSERT INTO customer VALUES (8,'Shannon Rose',null,'Wyandotte','MI');
INSERT INTO customer VALUES (9,'Beth Rosebud','1 First Street','Muscatine','IA');
INSERT INTO customer VALUES (10,'Suzanne May','2 Second Street','Iowa City','IA');
INSERT INTO customer VALUES (11,'Aiden Adams','324 2A Street','Kelowna','BC');
INSERT INTO customer VALUES (12,'Betty Bains',null,'Kelowna','BC');
INSERT INTO customer VALUES (13,'Cindy Champion','1 1st Street','Calgary','AB');
INSERT INTO customer VALUES (14,'David Denter','23456 Main Street','Vernon','BC');
INSERT INTO customer VALUES (15,'Elish Elias','3445 Hwy 97 North','Lake Country','BC');

INSERT INTO product VALUES (1,'Swiss Chocolate',32.99,40);
INSERT INTO product VALUES (2,'Wooden Chair',99.99,12);
INSERT INTO product VALUES (3,'Teddy Bear',12.99,12);
INSERT INTO product VALUES (4,'Chocolate Bar',5.95,40);
INSERT INTO product VALUES (5,'Desk',250.99,100);
INSERT INTO product VALUES (6,'Table',500,44);
INSERT INTO product VALUES (7,'Deluxe Sweet Collection',32.65,83);
INSERT INTO product VALUES (8,'Table',2.99,156);
INSERT INTO product VALUES (9,'Sports Car',123500,0);
INSERT INTO product VALUES (10,'Textbook',250,23);

INSERT INTO shipment VALUES (1,15,'2021-07-05 00:00:00');
INSERT INTO shipment VALUES (2,15,'2021-07-12 00:00:00');
INSERT INTO shipment VALUES (3,2,'2021-09-05 00:00:00');
INSERT INTO shipment VALUES (4,3,'2022-07-13 00:00:00');
INSERT INTO shipment VALUES (5,4,'2022-07-17 00:00:00');
INSERT INTO shipment VALUES (6,4,'2022-08-02 00:00:00');
INSERT INTO shipment VALUES (7,4,'2021-09-04 00:00:00');
INSERT INTO shipment VALUES (8,4,'2021-08-19 00:00:00');
INSERT INTO shipment VALUES (9,2,'2021-07-07 00:00:00');
INSERT INTO shipment VALUES (10,2,'2021-08-09 00:00:00');
INSERT INTO shipment VALUES (11,6,'2022-09-04 00:00:00');
INSERT INTO shipment VALUES (12,7,'2022-07-05 00:00:00');
INSERT INTO shipment VALUES (13,6,'2022-08-24 00:00:00');
INSERT INTO shipment VALUES (14,8,'2021-09-22 00:00:00');
INSERT INTO shipment VALUES (15,9,'2022-08-24 00:00:00');
INSERT INTO shipment VALUES (16,10,'2022-08-26 00:00:00');
INSERT INTO shipment VALUES (17,11,'2022-09-24 00:00:00');
INSERT INTO shipment VALUES (18,12,'2021-08-28 00:00:00');
INSERT INTO shipment VALUES (19,13,'2022-08-24 00:00:00');
INSERT INTO shipment VALUES (20,13,'2022-09-12 00:00:00');
INSERT INTO shipment VALUES (21,15,'2022-08-24 00:00:00');
INSERT INTO shipment VALUES (22,12,'2021-08-13 00:00:00');
INSERT INTO shipment VALUES (23,12,'2022-08-24 00:00:00');

INSERT INTO shippedproduct VALUES (1,10,1);
INSERT INTO shippedproduct VALUES (1,9,2);
INSERT INTO shippedproduct VALUES (1,7,5);
INSERT INTO shippedproduct VALUES (1,4,6);
INSERT INTO shippedproduct VALUES (2,1,3);
INSERT INTO shippedproduct VALUES (2,3,8);
INSERT INTO shippedproduct VALUES (2,10,1);
INSERT INTO shippedproduct VALUES (3,1,20);
INSERT INTO shippedproduct VALUES (4,1,5);
INSERT INTO shippedproduct VALUES (5,2,13);
INSERT INTO shippedproduct VALUES (6,1,4);
INSERT INTO shippedproduct VALUES (6,2,1);
INSERT INTO shippedproduct VALUES (7,1,3);
INSERT INTO shippedproduct VALUES (8,4,25);
INSERT INTO shippedproduct VALUES (9,2,32);
INSERT INTO shippedproduct VALUES (10,2,2);
INSERT INTO shippedproduct VALUES (11,2,5);
INSERT INTO shippedproduct VALUES (12,3,1);
INSERT INTO shippedproduct VALUES (12,4,10);
INSERT INTO shippedproduct VALUES (13,1,5);
INSERT INTO shippedproduct VALUES (13,4,2);
INSERT INTO shippedproduct VALUES (13,2,7);
INSERT INTO shippedproduct VALUES (14,10,1);
INSERT INTO shippedproduct VALUES (14,3,2);
INSERT INTO shippedproduct VALUES (15,6,5);
INSERT INTO shippedproduct VALUES (15,8,25);
INSERT INTO shippedproduct VALUES (16,1,4);
INSERT INTO shippedproduct VALUES (16,10,2);
INSERT INTO shippedproduct VALUES (17,3,4);
INSERT INTO shippedproduct VALUES (17,4,5);
INSERT INTO shippedproduct VALUES (17,5,6);
INSERT INTO shippedproduct VALUES (18,7,5);
INSERT INTO shippedproduct VALUES (19,8,12);
INSERT INTO shippedproduct VALUES (20,9,1);
INSERT INTO shippedproduct VALUES (20,10,3);
INSERT INTO shippedproduct VALUES (20,2,5);
INSERT INTO shippedproduct VALUES (21,1,3);
INSERT INTO shippedproduct VALUES (21,2,7);
INSERT INTO shippedproduct VALUES (22,4,11);
INSERT INTO shippedproduct VALUES (22,6,13);
INSERT INTO shippedproduct VALUES (23,7,1);
INSERT INTO shippedproduct VALUES (23,8,1);
INSERT INTO shippedproduct VALUES (23,9,1);

