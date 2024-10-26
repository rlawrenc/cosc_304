use mydb;
CREATE TABLE Customer(
                         customerId  INTEGER NOT NULL AUTO_INCREMENT,
                         firstName   VARCHAR(30),
                         lastName    VARCHAR(30),
                         email       VARCHAR(50),
                         phoneNum    VARCHAR(10),
                         address     VARCHAR(200),
                         city        VARCHAR(50),
                         state       VARCHAR(50),
                         postalCode  VARCHAR(20),
                         country     VARCHAR(30),
                         userId      VARCHAR(20) UNIQUE NOT NULL,
                         password    VARCHAR(50) NOT NULL,
                         PRIMARY KEY(customerId)
);

CREATE TABLE PaymentMethod(
                              paymentMethodId     INTEGER NOT NULL AUTO_INCREMENT,
                              paymentType         VARCHAR(15),
                              paymentNumber       VARCHAR(50),
                              paymentExpiryDate   DATE,
                              customerId          INTEGER,
                              PRIMARY KEY(paymentMethodId),
                              FOREIGN KEY (customerId) REFERENCES Customer(customerId)
                                                        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Category(
                         categoryId          INTEGER NOT NULL AUTO_INCREMENT,
                         categoryName        VARCHAR(20),
                         PRIMARY KEY(categoryId)
);

CREATE TABLE Warehouse(
                          warehouseId         INTEGER NOT NULL AUTO_INCREMENT,
                          warehouseName       VARCHAR(20),
                          PRIMARY KEY(warehouseId)
);

CREATE TABLE Product(
                        productId       INTEGER NOT NULL AUTO_INCREMENT,
                        productName     VARCHAR(50),
                        productPrice    DECIMAL(9, 2),
                        productImageURL VARCHAR(200),
                        productImage    VARCHAR(50),
                        productDesc     VARCHAR(200),
                        categoryId      INTEGER,
                        PRIMARY KEY(productId),
                        FOREIGN KEY (categoryId) REFERENCES Category(categoryId)
                                               ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Shipment(
                         shipmentId      INTEGER NOT NULL AUTO_INCREMENT,
                         shipmentDATE    DATE,
                         shipmentDesc    VARCHAR(200),
                         warehouseId     INTEGER,
                         PRIMARY KEY(shipmentId),
                         FOREIGN KEY (warehouseId) REFERENCES Warehouse(warehouseId)
                                            ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE OrderSummary(
                             orderId             INTEGER NOT NULL AUTO_INCREMENT,
                             orderDate           DATE,
                             totalAmount         DECIMAL(9, 2),
                             shipToAddress       VARCHAR(200),
                             shipToCity          VARCHAR(50),
                             shipToState         VARCHAR(50),
                             shipToCountry       VARCHAR(30),
                             shipToPostalCode    VARCHAR(20),
                             shipmentId          INTEGER UNIQUE,
                             customerId          INTEGER,
                             PRIMARY KEY(orderId),
                             FOREIGN KEY (customerId) REFERENCES Customer(customerId)
                                            ON DELETE CASCADE ON UPDATE CASCADE,
                             FOREIGN KEY (shipmentId) REFERENCES Shipment(shipmentId)
                                            ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE Review(
                       reviewId        INTEGER NOT NULL AUTO_INCREMENT,
                       reviewRating    DECIMAL(3, 2),
                       reviewComment   VARCHAR(500),
                       reviewDate      DATE,
                       customerId      INTEGER,
                       productId       INTEGER,
                       PRIMARY KEY(reviewId),
                       FOREIGN KEY (customerId) REFERENCES Customer(customerId)
                                            ON DELETE SET NULL ON UPDATE CASCADE,
                       FOREIGN KEY (productId) REFERENCES Product(productId)
                                            ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE InCart(
                       inCartQuantity      INTEGER,
                       inCartPrice         DECIMAL(9, 2),
                       customerId          INTEGER,
                       productId           INTEGER,
                       PRIMARY KEY (customerId, productId),
                       FOREIGN KEY (customerId) REFERENCES Customer(customerId)
                                            ON DELETE CASCADE ON UPDATE CASCADE,
                       FOREIGN KEY (productId) REFERENCES Product(productId)
                                            ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrderProduct(
                             orderProductQuantity    INTEGER,
                             orderProductPrice       DECIMAL(9, 2),
                             productId               INTEGER,
                             orderId                 INTEGER,
                             PRIMARY KEY (productId, orderId),
                             FOREIGN KEY (productId) REFERENCES Product(productId)
                                                ON DELETE CASCADE ON UPDATE CASCADE,
                             FOREIGN KEY (orderId) REFERENCES OrderSummary(orderId)
                                                ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ProductInventory(
                                 inventoryQuantity       INTEGER,
                                 productId               INTEGER,
                                 warehouseId             INTEGER,
                                 PRIMARY KEY (productId, warehouseId),
                                 FOREIGN KEY (productId) REFERENCES Product(productId)
                                                ON DELETE CASCADE ON UPDATE CASCADE,
                                 FOREIGN KEY (warehouseId) REFERENCES Warehouse(warehouseId)
                                                ON DELETE CASCADE ON UPDATE CASCADE
);