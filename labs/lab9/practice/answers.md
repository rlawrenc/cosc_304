# COSC 304 - Introduction to Database Systems<br>Lab 9 - Practice Answers

## Question 1 - XPath

1) ```//Dept[budget<400000]```

2) ```//Dept[name="Management"]/Emp[name > "K"]```

3) ```data(//Dept[name="Consulting"]/Emp[2]/@eno)```

### Question 2 - Views

```
-- 1
CREATE VIEW deptSummary AS
SELECT D.dno, dname, COUNT(eno) as totalEmp, SUM(salary) as totalSalary
FROM dept D INNER JOIN emp E on D.dno=E.dno
GROUP BY D.dno, dname

-- 2
CREATE VIEW empSummary AS
SELECT E.eno, ename, salary, bdate, dno, COUNT(pno) as totalProj, SUM(hours) as totalHours
FROM workson W RIGHT JOIN emp E on W.eno=E.eno
WHERE dno in ('D1','D2','D3') and bdate > '1966-06-08'
GROUP BY E.eno, ename, salary, bdate, dno
```

## Question 3 - Triggers

```
-- 1
CREATE TRIGGER increaseBudget
	AFTER INSERT ON workson
	FOR EACH ROW
	BEGIN
    	  UPDATE proj SET budget=budget+1000 WHERE pno = NEW.pno;        
    END;
	 
	 
Test code:
select * from workson;
insert into workson (eno, pno, hours) VALUES ('E8', 'P2', 50);
select * from proj;
delete from workson WHERE eno = 'E8' and pno = 'P2';
update proj set budget = 135000 where pno = 'P2';
drop trigger increaseBudget;
   
-- 2
CREATE TRIGGER updateLowSalary
	BEFORE INSERT ON emp
	FOR EACH ROW
	BEGIN
     IF NEW.salary < 50000 THEN
       SET NEW.salary = (SELECT AVG(salary) FROM emp E2 WHERE E2.title = NEW.title)+5000;
     END IF;
   END;
   
Test code:
insert into emp (eno, ename, title, salary) VALUES ('E10', 'P. Person', 'ME', 35000);
select * from  emp;
delete from emp where eno = 'E10';
drop trigger updateLowSalary;
```

## Question 4 - JSON

```
{"proj":[
	{"pno":"P1", "pname":"Instruments"	, "budget":"150000", "dno":"D1"},
	{"pno":"P2", "pname":"DB Develop"	, "budget":"135000", "dno":"D2"},
	{"pno":"P3", "pname":"Budget"		, "budget":"250000", "dno":"D3"},
	{"pno":"P4", "pname":"Maintenance"	, "budget":"310000", "dno":"D2"},
	{"pno":"P5", "pname":"CAD/CAM"		, "budget":"500000", "dno":"D2"}
],
"dept":[
	{"dno":"D1", "dname":"Management", "mgreno":"E8"},
	{"dno":"D2", "dname":"Consulting", "mgreno":"E7"},
	{"dno":"D3", "dname":"Accounting", "mgreno":"E5"},
	{"dno":"D4", "dname":"Development", "mgreno":null}
]
}
```