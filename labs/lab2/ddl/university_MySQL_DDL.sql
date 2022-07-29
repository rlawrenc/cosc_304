CREATE DATABASE IF NOT EXISTS university;

USE university;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS enrolled;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE student(
	snum integer,
	sname varchar(30),
	major varchar(25),
	standing varchar(2),
	age integer,
        primary key (snum)
) ENGINE=InnoDB;


CREATE TABLE faculty(
	fid integer,
	fname varchar(30),
	deptid integer,
	primary key (fid)
) ENGINE=InnoDB;

CREATE TABLE course(
	cname varchar(40),
	meets_at varchar(20),
	room varchar(10),
	fid integer,
	primary key (cname),
	foreign key (fid) references faculty(fid)
) ENGINE=InnoDB;

CREATE TABLE enrolled(
	snum integer,
	cname varchar(40),
	primary key (snum,cname),
	foreign key (snum) references student(snum),
	foreign key (cname) references course(cname)
) ENGINE=InnoDB;

INSERT INTO student VALUES( 051135593,'Maria White','English','SR',21);
INSERT INTO student VALUES( 060839453,'Charles Harris','Architecture','SR',22);
INSERT INTO student VALUES( 099354543,'Susan Martin','Law','JR',20);
INSERT INTO student VALUES( 112348546,'Joseph Thompson','Computer Science','SO',19);
INSERT INTO student VALUES( 115987938,'Christopher Garcia','Computer Science','JR',20);
INSERT INTO student VALUES( 132977562,'Angela Martinez','History','SR',20);
INSERT INTO student VALUES( 269734834,'Thomas Robinson','Psychology','SO',18);
INSERT INTO student VALUES( 280158572,'Margaret Clark','Animal Science','FR',18);
INSERT INTO student VALUES( 301221823,'Juan Rodriguez','Psychology','JR',20);
INSERT INTO student VALUES( 318548912,'Dorthy Lewis','Finance','FR',18);
INSERT INTO student VALUES( 320874981,'Daniel Lee','Electrical Engineering','FR',17);
INSERT INTO student VALUES( 322654189,'Lisa Walker','Computer Science','SO',17);
INSERT INTO student VALUES( 348121549,'Paul Hall','Computer Science','JR',18);
INSERT INTO student VALUES( 351565322,'Nancy Allen','Accounting','JR',19);
INSERT INTO student VALUES( 451519864,'Mark Young','Finance','FR',18);
INSERT INTO student VALUES( 455798411,'Luis Hernandez','Electrical Engineering','FR',17);
INSERT INTO student VALUES( 462156489,'Donald King','Mechanical Engineering','SO',19);
INSERT INTO student VALUES( 550156548,'George Wright','Education','SR',21);
INSERT INTO student VALUES( 552455318,'Ana Lopez','Computer Engineering','SR',19);
INSERT INTO student VALUES( 556784565,'Kenneth Hill','Civil Engineering','SR',21);
INSERT INTO student VALUES( 567354612,'Karen Scott','Computer Engineering','FR',18);
INSERT INTO student VALUES( 573284895,'Steven Green','Kinesiology','SO',19);
INSERT INTO student VALUES( 574489456,'Betty Adams','Economics','JR',20);
INSERT INTO student VALUES( 578875478,'Edward Baker','Veterinary Medicine','SR',21);

INSERT INTO faculty VALUES( 142519864,'Ivana Teach',20);
INSERT INTO faculty VALUES( 242518965,'James Smith',68);
INSERT INTO faculty VALUES( 141582651,'Mary Johnson',20);
INSERT INTO faculty VALUES( 011564812,'John Williams',68);
INSERT INTO faculty VALUES( 254099823,'Patricia Jones',68);
INSERT INTO faculty VALUES( 356187925,'Robert Brown',12);
INSERT INTO faculty VALUES( 489456522,'Linda Davis',20);
INSERT INTO faculty VALUES( 287321212,'Michael Miller',12);
INSERT INTO faculty VALUES( 248965255,'Barbara Wilson',12);
INSERT INTO faculty VALUES( 159542516,'William Moore',33);
INSERT INTO faculty VALUES( 090873519,'Elizabeth Taylor',11);
INSERT INTO faculty VALUES( 486512566,'David Anderson',20);
INSERT INTO faculty VALUES( 619023588,'Jennifer Thomas',11);
INSERT INTO faculty VALUES( 489221823,'Richard Jackson',33);
INSERT INTO faculty VALUES( 548977562,'Ulysses Teach',20);

INSERT INTO course VALUES('Data Structures','MWF 10','R128',489456522);
INSERT INTO course VALUES('Database Systems','MWF 12:30-1:45','1320 DCL',142519864);
INSERT INTO course VALUES('Operating System Design','TuTh 12-1:20','20 AVW',489456522);
INSERT INTO course VALUES('Archaeology of the Incas','MWF 3-4:15','R128',248965255);
INSERT INTO course VALUES('Aviation Accident Investigation','TuTh 1-2:50','Q3',011564812);
INSERT INTO course VALUES('Air Quality Engineering','TuTh 10:30-11:45','R15',011564812);
INSERT INTO course VALUES('Introductory Latin','MWF 3-4:15','R12',248965255);
INSERT INTO course VALUES('American Political Parties','TuTh 2-3:15','20 AVW',619023588);
INSERT INTO course VALUES('Social Cognition','Tu 6:30-8:40','R15',159542516);
INSERT INTO course VALUES('Perception','MTuWTh 3','Q3',489221823);
INSERT INTO course VALUES('Multivariate Analysis','TuTh 2-3:15','R15',090873519);
INSERT INTO course VALUES('Patent Law','F 1-2:50','R128',090873519);
INSERT INTO course VALUES('Urban Economics','MWF 11','20 AVW',489221823);
INSERT INTO course VALUES('Organic Chemistry','TuTh 12:30-1:45','R12',489221823);
INSERT INTO course VALUES('Marketing Research','MW 10-11:15','1320 DCL',489221823);
INSERT INTO course VALUES('Seminar in American Art','M 4','R15',489221823);
INSERT INTO course VALUES('Orbital Mechanics','MWF 8','1320 DCL',011564812);
INSERT INTO course VALUES('Dairy Herd Management','TuTh 12:30-1:45','R128',356187925);
INSERT INTO course VALUES('Communication Networks','MW 9:30-10:45','20 AVW',141582651);
INSERT INTO course VALUES('Optical Electronics','TuTh 12:30-1:45','R15',254099823);
INSERT INTO course VALUES('Intoduction to Math','TuTh 8-9:30','R128',489221823);

INSERT INTO enrolled VALUES( 112348546,'Database Systems');
INSERT INTO enrolled VALUES(115987938,'Database Systems');
INSERT INTO enrolled VALUES(348121549,'Database Systems');
INSERT INTO enrolled VALUES(322654189,'Database Systems');
INSERT INTO enrolled VALUES(552455318,'Database Systems');
INSERT INTO enrolled VALUES(455798411,'Operating System Design');
INSERT INTO enrolled VALUES(552455318,'Operating System Design');
INSERT INTO enrolled VALUES(567354612,'Operating System Design');
INSERT INTO enrolled VALUES(112348546,'Operating System Design');
INSERT INTO enrolled VALUES(115987938,'Operating System Design');
INSERT INTO enrolled VALUES(322654189,'Operating System Design');
INSERT INTO enrolled VALUES(567354612,'Data Structures');
INSERT INTO enrolled VALUES(552455318,'Communication Networks');
INSERT INTO enrolled VALUES(455798411,'Optical Electronics');
INSERT INTO enrolled VALUES(301221823,'Perception');
INSERT INTO enrolled VALUES(301221823,'Social Cognition');
INSERT INTO enrolled VALUES(301221823,'American Political Parties');
INSERT INTO enrolled VALUES(556784565,'Air Quality Engineering');
INSERT INTO enrolled VALUES(099354543,'Patent Law');
INSERT INTO enrolled VALUES(574489456,'Urban Economics');