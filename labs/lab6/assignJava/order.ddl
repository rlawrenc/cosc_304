DROP TABLE IF EXISTS OrderedProduct;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
   EmployeeId    char(5)        NOT NULL,
   EmployeeName  varchar(50),
   Salary        decimal (9,2),
   SupervisorId  char(5),
   PRIMARY KEY (EmployeeId),
   FOREIGN KEY (SupervisorId) REFERENCES Employee (EmployeeId)
) ENGINE = InnoDB;

CREATE TABLE Customer (
   CustomerId    char(5)        NOT NULL,
   CustomerName  varchar(50),
   PRIMARY KEY (CustomerId)
) ENGINE = InnoDB;

CREATE TABLE Product (
   ProductId     char(5)        NOT NULL,
   ProductName   varchar(50),
   ListPrice     decimal (9,2),
   PRIMARY KEY (ProductId)
) ENGINE = InnoDB;

CREATE TABLE Orders (
   OrderId       char(5)        NOT NULL,
   OrderDate     datetime,
   CustomerId    char(5),
   EmployeeId    char(5),
   Total         decimal (9,2),
   PRIMARY KEY (OrderId),
   FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId)
) ENGINE = InnoDB;

CREATE TABLE OrderedProduct (
   OrderId       char(5)        NOT NULL,
   ProductId     char(5) 	NOT NULL,
   Quantity      integer,
   Price         decimal (9,2),
   PRIMARY KEY (OrderId, ProductId),
   FOREIGN KEY (OrderId) REFERENCES Orders (OrderId) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (ProductId) REFERENCES Product (ProductId)
) ENGINE = InnoDB;

INSERT INTO Customer VALUES ( '00000', 'A. Anderson' );
INSERT INTO Customer VALUES ( '00001', 'B. Brown' );
INSERT INTO Customer VALUES ( '00002', 'C. Cole' );
INSERT INTO Customer VALUES ( '00003', 'D. Doe' );
INSERT INTO Customer VALUES ( '00004', 'E. Elliott' );
INSERT INTO Customer VALUES ( '00005', 'F. Ford' );
INSERT INTO Customer VALUES ( '00006', 'G. Grimmer' );
INSERT INTO Customer VALUES ( '00007', 'H. Hoover' );
INSERT INTO Customer VALUES ( '00008', 'I. Irving' );
INSERT INTO Customer VALUES ( '00009', 'J. Jordan' );
INSERT INTO Customer VALUES ( '00010', 'K. Kurtz' );
INSERT INTO Customer VALUES ( '00011', 'L. Lamb' );
INSERT INTO Customer VALUES ( '00012', 'M. Miller' );
INSERT INTO Customer VALUES ( '00013', 'N. Norris' );
INSERT INTO Customer VALUES ( '00014', 'O. Olsen' );
INSERT INTO Customer VALUES ( '00015', 'P. Pitt' );
INSERT INTO Customer VALUES ( '00016', 'Q. Quirrel' );
INSERT INTO Customer VALUES ( '00017', 'Steve Raet' );
INSERT INTO Customer VALUES ( '00018', 'Fred Smith' );
INSERT INTO Customer VALUES ( '00019', 'T. Thomas' );
INSERT INTO Customer VALUES ( '00020', 'U. Underwood' );
INSERT INTO Customer VALUES ( '00021', 'V. Voss' );
INSERT INTO Customer VALUES ( '00022', 'W. Williams' );
INSERT INTO Customer VALUES ( '00023', 'X. Xu' );
INSERT INTO Customer VALUES ( '00024', 'Y. Yoder' );
INSERT INTO Customer VALUES ( '00025', 'Z. Zimmerman' );

INSERT INTO Employee VALUES ( 'E0000', 'G. Gates', '90000', 'E0000' );
INSERT INTO Employee VALUES ( 'E0001', 'B. Bogart', '70000', 'E0000' );
INSERT INTO Employee VALUES ( 'E0002', 'E. Edwards', '60000', 'E0001' );
INSERT INTO Employee VALUES ( 'E0003', 'A. Allen', '40000', 'E0001' );
INSERT INTO Employee VALUES ( 'E0004', 'H. Hill', '30000', 'E0002' );
INSERT INTO Employee VALUES ( 'E0005', 'M. Clark', '20000', 'E0002' );
INSERT INTO Employee VALUES ( 'E0006', 'D. Davis', '50000', 'E0001' );
INSERT INTO Employee VALUES ( 'E0008', 'F. Fox', '70000', NULL );
INSERT INTO Employee VALUES ( 'E0007', 'I. Irvin', '40000', 'E0008' );
INSERT INTO Employee VALUES ( 'E0009', 'J. Jackson', '60000', NULL );

INSERT INTO Product VALUES ( 'P0000', 'Apple', '1.00' );
INSERT INTO Product VALUES ( 'P0001', 'Banana', '1.25' );
INSERT INTO Product VALUES ( 'P0002', 'Corn', '0.50' );
INSERT INTO Product VALUES ( 'P0003', 'Dice', '2.50' );
INSERT INTO Product VALUES ( 'P0004', 'Eggs', '0.86' );
INSERT INTO Product VALUES ( 'P0005', 'Fudge', '3.10' );
INSERT INTO Product VALUES ( 'P0006', 'Grapes', '1.90' );
INSERT INTO Product VALUES ( 'P0007', 'Honey', '2.37' );
INSERT INTO Product VALUES ( 'P0008', 'Ice Cream', '2.50' );
INSERT INTO Product VALUES ( 'P0009', 'Jelly', '1.60' );
INSERT INTO Product VALUES ( 'P0010', 'Kiwi', '0.99' );
INSERT INTO Product VALUES ( 'P0011', 'Lamb', '7.99' );
INSERT INTO Product VALUES ( 'P0012', 'M&M''s', '1.97' );
INSERT INTO Product VALUES ( 'P0013', 'Nilla Wafers', '2.29' );
INSERT INTO Product VALUES ( 'P0014', 'Oreos', '2.01' );
INSERT INTO Product VALUES ( 'P0015', 'Peaches', '1.99' );
INSERT INTO Product VALUES ( 'P0016', 'Tivo', '449.99' );
INSERT INTO Product VALUES ( 'P0017', 'Television', '424.99' );
INSERT INTO Product VALUES ( 'P0018', 'Microwave', '99.99' );
INSERT INTO Product VALUES ( 'P0019', 'Treadmill', '1099.99' );
INSERT INTO Product VALUES ( 'P0020', 'Laptop', '1599.99' );

INSERT INTO Orders VALUES ( '01000', '2023-11-08', '00000', 'E0005', '15.57' );
INSERT INTO Orders VALUES ( '01001', '2023-11-08', '00001', 'E0000', '1610.59' );
INSERT INTO Orders VALUES ( '01002', '2023-11-10', '00003', 'E0003', '2.50' );
INSERT INTO Orders VALUES ( '01003', '2023-11-11', '00005', 'E0003', '3.36' );
INSERT INTO Orders VALUES ( '01004', '2023-11-12', '00002', 'E0002', '14.95' );
INSERT INTO Orders VALUES ( '01005', '2023-11-13', '00004', 'E0007', '1119.49' );
INSERT INTO Orders VALUES ( '01006', '2023-11-14', '00006', 'E0006', '31.25' );
INSERT INTO Orders VALUES ( '01007', '2023-11-15', '00007', 'E0001', '4.87' );
INSERT INTO Orders VALUES ( '01008', '2023-11-16', '00009', 'E0003', '6.46' );
INSERT INTO Orders VALUES ( '01009', '2023-11-18', '00008', 'E0003', '2.50' );
INSERT INTO Orders VALUES ( '01010', '2023-11-20', '00010', 'E0002', '2.50' );
INSERT INTO Orders VALUES ( '01011', '2023-11-21', '00011', 'E0002', '5.00' );
INSERT INTO Orders VALUES ( '01012', '2023-11-21', '00012', 'E0001', '10.00' );
INSERT INTO Orders VALUES ( '01013', '2023-11-21', '00013', 'E0006', '2.50' );
INSERT INTO Orders VALUES ( '01014', '2023-11-21', '00014', 'E0006', '12.00' );
INSERT INTO Orders VALUES ( '01015', '2023-11-22', '00015', 'E0006', '5.00' );
INSERT INTO Orders VALUES ( '01016', '2023-11-22', '00016', 'E0006', '12.50' );
INSERT INTO Orders VALUES ( '01017', '2023-11-23', '00017', 'E0005', '2.50' );
INSERT INTO Orders VALUES ( '01018', '2023-11-23', '00018', 'E0005', '2.50' );
INSERT INTO Orders VALUES ( '01019', '2023-11-23', '00019', 'E0007', '2.50' );
INSERT INTO Orders VALUES ( '01020', '2023-11-24', '00020', 'E0001', '2.50' );
INSERT INTO Orders VALUES ( '01021', '2023-11-24', '00021', 'E0001', '2.50' );
INSERT INTO Orders VALUES ( '01022', '2023-11-24', '00022', 'E0001', '2.50' );
INSERT INTO Orders VALUES ( '01023', '2023-11-24', '00023', 'E0001', '7.08' );
INSERT INTO Orders VALUES ( '01024', '2023-11-25', '00024', 'E0000', '7.50' );
INSERT INTO Orders VALUES ( '01025', '2023-11-25', '00025', 'E0000', '7.50' );
INSERT INTO Orders VALUES ( '01026', '2023-11-26', '00000', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01027', '2023-11-26', '00018', 'E0003', '6.25' );
INSERT INTO Orders VALUES ( '01028', '2023-11-26', '00017', 'E0002', '14.50' );
INSERT INTO Orders VALUES ( '01029', '2023-11-27', '00017', 'E0005', '4.27' );
INSERT INTO Orders VALUES ( '01030', '2023-11-28', '00000', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01031', '2023-11-29', '00001', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01032', '2023-11-30', '00002', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01033', '2023-11-30', '00003', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01034', '2024-01-01', '00004', 'E0006', '1599.99' );
INSERT INTO Orders VALUES ( '01035', '2024-01-02', '00001', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01036', '2024-01-03', '00002', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01037', '2024-01-04', '00003', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01038', '2024-01-05', '00004', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01039', '2024-01-06', '00001', 'E0006', '1344.97' );
INSERT INTO Orders VALUES ( '01040', '2024-01-07', '00002', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01041', '2024-01-08', '00003', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01042', '2024-01-09', '00004', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01043', '2024-01-10', '00001', 'E0006', '1099.99' );
INSERT INTO Orders VALUES ( '01044', '2024-01-11', '00002', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01045', '2024-01-12', '00003', 'E0006', '1.90' );
INSERT INTO Orders VALUES ( '01046', '2024-01-13', '00004', 'E0003', '1.90' );
INSERT INTO Orders VALUES ( '01047', '2024-01-14', '00001', 'E0003', '1.90' );
INSERT INTO Orders VALUES ( '01048', '2024-01-15', '00002', 'E0003', '1.90' );
INSERT INTO Orders VALUES ( '01049', '2024-01-16', '00003', 'E0003', '1.90' );
INSERT INTO Orders VALUES ( '01050', '2024-01-17', '00004', 'E0003', '1.90' );
INSERT INTO Orders VALUES ( '01051', '2024-01-17', '00005', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01052', '2024-01-17', '00006', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01053', '2024-01-18', '00004', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01054', '2024-01-18', '00005', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01055', '2024-01-18', '00006', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01056', '2024-01-18', '00001', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01057', '2024-01-18', '00008', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01058', '2024-01-18', '00010', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01059', '2024-01-18', '00011', 'E0003', '1.00' );
INSERT INTO Orders VALUES ( '01060', '2024-01-19', '00004', 'E0003', '2.97' );
INSERT INTO Orders VALUES ( '01061', '2024-01-19', '00012', 'E0003', '1.97' );
INSERT INTO Orders VALUES ( '01062', '2024-01-20', '00004', 'E0007', '1099.99' );

INSERT INTO OrderedProduct VALUES ( '01000', 'P0012', '2', '1.97' );
INSERT INTO OrderedProduct VALUES ( '01000', 'P0005', '1', '3.10' );
INSERT INTO OrderedProduct VALUES ( '01000', 'P0014', '3', '2.01' );
INSERT INTO OrderedProduct VALUES ( '01000', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01001', 'P0008', '3', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01001', 'P0005', '1', '3.10' );
INSERT INTO OrderedProduct VALUES ( '01001', 'P0020', '1', '1599.99' );
INSERT INTO OrderedProduct VALUES ( '01002', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01003', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01003', 'P0004', '1', '0.86' );
INSERT INTO OrderedProduct VALUES ( '01004', 'P0008', '6', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01004', 'P0015', '5', '1.99' );
INSERT INTO OrderedProduct VALUES ( '01005', 'P0008', '7', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01005', 'P0019', '1', '1099.99' );
INSERT INTO OrderedProduct VALUES ( '01005', 'P0000', '2', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01006', 'P0008', '10', '2.20' );
INSERT INTO OrderedProduct VALUES ( '01006', 'P0005', '3', '3.10' );
INSERT INTO OrderedProduct VALUES ( '01007', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01007', 'P0007', '1', '2.37' );
INSERT INTO OrderedProduct VALUES ( '01008', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01008', 'P0010', '4', '0.99' );
INSERT INTO OrderedProduct VALUES ( '01009', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01010', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01011', 'P0008', '2', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01012', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01012', 'P0001', '6', '1.25' );
INSERT INTO OrderedProduct VALUES ( '01013', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01014', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01014', 'P0011', '1', '7.99' );
INSERT INTO OrderedProduct VALUES ( '01014', 'P0009', '1', '1.60' );
INSERT INTO OrderedProduct VALUES ( '01015', 'P0008', '2', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01016', 'P0008', '5', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01017', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01018', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01019', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01020', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01021', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01022', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01023', 'P0008', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01023', 'P0013', '2', '2.29' );
INSERT INTO OrderedProduct VALUES ( '01024', 'P0008', '3', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01025', 'P0008', '3', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01026', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01027', 'P0003', '1', '2.50' );
INSERT INTO OrderedProduct VALUES ( '01027', 'P0001', '3', '1.25' );
INSERT INTO OrderedProduct VALUES ( '01028', 'P0011', '2', '7.25' );
INSERT INTO OrderedProduct VALUES ( '01029', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01029', 'P0007', '1', '2.37' );
INSERT INTO OrderedProduct VALUES ( '01030', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01031', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01032', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01033', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01034', 'P0020', '1', '1599.99' );
INSERT INTO OrderedProduct VALUES ( '01035', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01036', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01037', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01038', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01039', 'P0016', '1', '449.99' );
INSERT INTO OrderedProduct VALUES ( '01039', 'P0017', '2', '424.99' );
INSERT INTO OrderedProduct VALUES ( '01040', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01041', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01042', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01043', 'P0019', '1', '1099.99' );
INSERT INTO OrderedProduct VALUES ( '01044', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01045', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01046', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01047', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01048', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01049', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01050', 'P0006', '1', '1.90' );
INSERT INTO OrderedProduct VALUES ( '01051', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01052', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01053', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01054', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01055', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01056', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01057', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01058', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01059', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01060', 'P0000', '1', '1.00' );
INSERT INTO OrderedProduct VALUES ( '01060', 'P0012', '1', '1.97' );
INSERT INTO OrderedProduct VALUES ( '01061', 'P0012', '1', '1.97' );
INSERT INTO OrderedProduct VALUES ( '01062', 'P0019', '1', '1099.99' );

