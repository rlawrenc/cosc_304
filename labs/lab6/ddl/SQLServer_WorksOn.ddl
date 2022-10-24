CREATE DATABASE workson;
go

USE workson;
go

-- Drop all tables ignoring foreign key constraints
exec sp_MSforeachtable "declare @name nvarchar(max); set @name = parsename('?', 1); exec sp_MSdropconstraints @name";
exec sp_MSforeachtable "drop table ?";

-- DROP TABLE IF EXISTS Emp;
-- DROP TABLE IF EXISTS Dept;
-- DROP TABLE IF EXISTS Proj;
-- DROP TABLE IF EXISTS WorksOn;

CREATE TABLE Emp (
 eno CHAR(5) NOT NULL,
 ename VARCHAR(30),
 bdate DATETIME,
 title CHAR(2),			
 salary DECIMAL(9,2),
 supereno CHAR(5),
 dno CHAR(5),
 PRIMARY KEY (eno),
);


CREATE TABLE Dept (
 dno CHAR(5) NOT NULL,
 dname VARCHAR(40),
 mgreno CHAR(5),
 PRIMARY KEY (dno),
 CONSTRAINT FK_Dept_Emp FOREIGN KEY (mgreno) REFERENCES Emp (eno));

ALTER TABLE Emp ADD CONSTRAINT FK_Emp_Dept FOREIGN KEY (dno) REFERENCES Dept(dno); 
 
CREATE TABLE Proj (
 pno CHAR(5) NOT NULL,
 pname VARCHAR(40),
 budget DECIMAL(9,2),
 dno  CHAR(5), 
 PRIMARY KEY (pno),
 CONSTRAINT FK_Proj_Dept FOREIGN KEY (dno) REFERENCES Dept(dno));
 
CREATE TABLE WorksOn (
 eno  CHAR(5) NOT NULL,
 pno  CHAR(5) NOT NULL,
 resp    VARCHAR(20),
 hours   SMALLINT,
 CONSTRAINT PK_WorksOn PRIMARY KEY (eno,pno),
 CONSTRAINT FK_WorksOn_Emp FOREIGN KEY (eno) REFERENCES Emp (eno),
 CONSTRAINT FK_WorksOn_Proj FOREIGN KEY (pno) REFERENCES Proj (pno));
 

INSERT INTO Dept VALUES ('D1','Management',NULL);
INSERT INTO Dept VALUES ('D2','Consulting',NULL);
INSERT INTO Dept VALUES ('D3','Accounting',NULL);
INSERT INTO Dept VALUES ('D4','Development',NULL);



INSERT INTO Proj VALUES ('P1','Instruments',150000,'D1');
INSERT INTO Proj VALUES ('P2','DB Develop',135000,'D2');
INSERT INTO Proj VALUES ('P3','Budget',250000,'D3');
INSERT INTO Proj VALUES ('P4','Maintenance',310000,'D2');
INSERT INTO Proj VALUES ('P5','CAD/CAM',500000,'D2');

INSERT INTO Emp VALUES ('E1','J. Doe','1975-01-05','EE',30000,null,null);
INSERT INTO Emp VALUES ('E2','M. Smith','1966-06-04','SA',50000,null,'D3');
INSERT INTO Emp VALUES ('E3','A. Lee','1966-07-05','ME',40000,null,'D2');
INSERT INTO Emp VALUES ('E4','J. Miller','1950-09-01','PR',20000,null,'D3');
INSERT INTO Emp VALUES ('E5','B. Casey','1971-12-25','SA',50000,null,'D3');
INSERT INTO Emp VALUES ('E6','L. Chu','1965-11-30','EE',30000,null,'D2');
INSERT INTO Emp VALUES ('E7','R. Davis','1977-09-08','ME',40000,null,'D1');
INSERT INTO Emp VALUES ('E8','J. Jones','1972-10-11','SA',50000,null,'D1');

UPDATE Emp SET supereno = 'E2' WHERE eno = 'E1';
UPDATE Emp SET supereno = 'E5' WHERE eno = 'E2';
UPDATE Emp SET supereno = 'E7' WHERE eno = 'E3';
UPDATE Emp SET supereno = 'E6' WHERE eno = 'E4';
UPDATE Emp SET supereno = 'E8' WHERE eno = 'E5';
UPDATE Emp SET supereno = 'E7' WHERE eno = 'E6';
UPDATE Emp SET supereno = 'E8' WHERE eno = 'E7';

Update Dept SET mgreno = 'E8' WHERE dno = 'D1';
Update Dept SET mgreno = 'E7' WHERE dno = 'D2';
Update Dept SET mgreno = 'E5' WHERE dno = 'D3';

INSERT INTO WorksOn VALUES ('E1','P1','Manager',12);
INSERT INTO WorksOn VALUES ('E2','P1','Analyst',24);
INSERT INTO WorksOn VALUES ('E2','P2','Analyst',6);
INSERT INTO WorksOn VALUES ('E3','P3','Consultant',10);
INSERT INTO WorksOn VALUES ('E3','P4','Engineer',48);
INSERT INTO WorksOn VALUES ('E4','P2','Programmer',18);
INSERT INTO WorksOn VALUES ('E5','P2','Manager',24);
INSERT INTO WorksOn VALUES ('E6','P4','Manager',48);
INSERT INTO WorksOn VALUES ('E7','P3','Engineer',36);
