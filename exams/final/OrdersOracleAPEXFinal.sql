drop table Orders cascade constraints;
drop table OrderedProduct cascade constraints;

CREATE TABLE Orders (
  orderId  integer,
  orderDate DATE,
  PRIMARY KEY (orderId)
);

INSERT INTO Orders VALUES (1, to_date('2016-10-10','yyyy-mm-dd'));
INSERT INTO Orders VALUES (2, to_date('2017-09-23','yyyy-mm-dd'));
INSERT INTO Orders VALUES (3, to_date('2018-11-22','yyyy-mm-dd'));
INSERT INTO Orders VALUES (4, to_date('2019-12-02','yyyy-mm-dd'));
INSERT INTO Orders VALUES (5, to_date('2019-12-03','yyyy-mm-dd'));

CREATE TABLE OrderedProduct (
  orderId  integer,
  productId integer,
  quantity integer,
  pricePerItem  decimal(10,2),  
  PRIMARY KEY (orderId, productId),
  FOREIGN KEY (orderId) REFERENCES Orders (orderId) 
);
  
INSERT INTO OrderedProduct VALUES (1, 55, 5, 200);
INSERT INTO OrderedProduct VALUES (1, 3, 4, 600);
INSERT INTO OrderedProduct VALUES (2, 1, 10, 400);
INSERT INTO OrderedProduct VALUES (2, 55, 3, 500);
INSERT INTO OrderedProduct VALUES (3, 32, 23, 100);
INSERT INTO OrderedProduct VALUES (3, 19, 10, 80);
INSERT INTO OrderedProduct VALUES (4, 46, 5, 400);
INSERT INTO OrderedProduct VALUES (4, 55, 4, 250);
INSERT INTO OrderedProduct VALUES (4, 20, 2, 300);
INSERT INTO OrderedProduct VALUES (5, 19, 5, 50);