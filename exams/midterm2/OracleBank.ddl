drop table Bank cascade constraints;
drop table Customer cascade constraints;
drop table Deposit cascade constraints;
drop table Loan cascade constraints;

CREATE TABLE Bank
(
	bankName             CHAR(40),
	bankCity             CHAR(50),
	totalAssets          DECIMAL(20,4),
	totalLoans           DECIMAL(20,4),
	PRIMARY KEY (bankName)
);


INSERT INTO Bank VALUES ('BankOne', 'Iowa City', 500000, 550000);
INSERT INTO Bank VALUES ('First Savings', 'Coralville', 350000, 425000);
INSERT INTO Bank VALUES ('First Union', 'Chicago', 9000000, 10000000);
INSERT INTO Bank VALUES ('New Bank', 'Detroit', 0, 0);


CREATE TABLE Customer
(
	custName             CHAR(40),
	custCity             CHAR(50),
	PRIMARY KEY (custName)
);

INSERT INTO Customer VALUES ('Frank Wright', 'Chicago');
INSERT INTO Customer VALUES ('Jim Crate', 'Coralville');
INSERT INTO Customer VALUES ('Joe Smith', 'Iowa City');
INSERT INTO Customer VALUES ('Ken Kartwright', 'Coralville');
INSERT INTO Customer VALUES ('Mark Mayer', 'Detroit');
INSERT INTO Customer VALUES ('Steve Sprock', 'New York');
INSERT INTO Customer VALUES ('Fred Funk', 'Chicago');
INSERT INTO Customer VALUES ('Wiger Toods', 'Detroit');
INSERT INTO Customer VALUES ('Brett Favre', 'Toronto');
INSERT INTO Customer VALUES ('Jimmy Johnson', 'Kelowna');

CREATE TABLE Deposit
(
     accountNum           CHAR(10),
     custName             CHAR(40),
     bankName             CHAR(40),
     balance              DECIMAL(20,4),
     PRIMARY KEY (accountNum)
);


INSERT INTO Deposit VALUES ('105555550', 'Joe Smith', 'BankOne', 500 );
INSERT INTO Deposit VALUES ('105555551', 'Joe Smith', 'BankOne', 750 );
INSERT INTO Deposit VALUES ('106666660', 'Steve Sprock', 'BankOne', 300);
INSERT INTO Deposit VALUES ('108888880', 'Mark Mayer', 'BankOne', 500);
INSERT INTO Deposit VALUES ('200000001', 'Fred Funk', 'First Savings', 1200);
INSERT INTO Deposit VALUES ('200000002', 'Wiger Toods', 'First Savings', 300);
INSERT INTO Deposit VALUES ('200000003', 'Brett Favre', 'First Savings', 700);
INSERT INTO Deposit VALUES ('300000001', 'Jimmy Johnson', 'First Union', 100);

CREATE TABLE Loan
(
     accountNum           CHAR(10),
     custName             CHAR(40),
     bankName             CHAR(40),
     amount               DECIMAL(20,4),
     PRIMARY KEY (accountNum)
);


INSERT INTO Loan VALUES ('116666660', 'Steve Sprock', 'BankOne', 250);
INSERT INTO Loan VALUES ('117777770', 'Jim Crate', 'BankOne', 1000);
INSERT INTO Loan VALUES ('118888880', 'Mark Mayer', 'BankOne', 2000);
INSERT INTO Loan VALUES ('118888881', 'Joe Smith', 'BankOne', 20000);
INSERT INTO Loan VALUES ('211111100', 'Frank Wright', 'First Savings', 100000);
INSERT INTO Loan VALUES ('211111110', 'Ken Kartwright', 'First Savings', 50000);
INSERT INTO Loan VALUES ('211111111', 'Ken Kartwright', 'First Savings', 25000);
INSERT INTO Loan VALUES ('311111111', 'Jack Manther', 'First Union', 25000);
INSERT INTO Loan VALUES ('118888882', 'Jane Doe', 'BankOne', 30000);
INSERT INTO Loan VALUES ('118888883', 'Janet Gil', 'BankOne', 42000);
INSERT INTO Loan VALUES ('118888884', 'Austin Market', 'BankOne', 51000);
INSERT INTO Loan VALUES ('211111112', 'Big Spender', 'First Savings', 125000);