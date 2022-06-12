Rem  Copyright � 2020 Oracle and/or its affiliates.  All rights reserved.
Rem  Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl. 

drop table "PROJECT_BUDGET" cascade constraints;
drop table  "AUDIT_DETAILS" cascade constraints;
drop table  "APEX_ACCESS_SETUP" cascade constraints;
drop table  "APEX_ACCESS_CONTROL"  cascade constraints;

drop SEQUENCE PROJECT_BUDGET_SEQ;
drop SEQUENCE AUDIT_DETAILS_SEQ;
drop SEQUENCE  "APEX_ACCESS_CONTROL_SEQ";

CREATE SEQUENCE PROJECT_BUDGET_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 NOORDER  NOCYCLE;


CREATE TABLE  "PROJECT_BUDGET" 
   (	"ID" NUMBER, 
	"PROJECT" VARCHAR2(30), 
	"TASK_NAME" VARCHAR2(255), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"STATUS" VARCHAR2(30), 
	"ASSIGNED_TO" VARCHAR2(30), 
	"COST" NUMBER, 
	"BUDGET" NUMBER, 
	 CONSTRAINT "PROJECT_BUDGET_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE OR REPLACE TRIGGER  "bi_PROJECT_BUDGET" 
  before insert on "PROJECT_BUDGET"              
  for each row 
begin  
  if :new."ID" is null then
    select "PROJECT_BUDGET_SEQ".nextval into :new."ID" from sys.dual;
  end if;
end;

/
ALTER TRIGGER  "bi_PROJECT_BUDGET" ENABLE
/
CREATE SEQUENCE AUDIT_DETAILS_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 NOORDER  NOCYCLE;
/


CREATE TABLE  "AUDIT_DETAILS" 
   (	"ID" NUMBER, 
	"CREATED_BY" VARCHAR2(60), 
	"CREATED_ON" DATE, 
	 CONSTRAINT "AUDIT_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE OR REPLACE TRIGGER  "bi_AUDIT_DETAILS" 
  before insert on "AUDIT_DETAILS"              
  for each row 
begin  
  if :new."ID" is null then
    select "AUDIT_DETAILS_SEQ".nextval into :new."ID" from sys.dual;
  end if;
end;

/
ALTER TRIGGER  "bi_AUDIT_DETAILS" ENABLE
/
CREATE SEQUENCE   "APEX_ACCESS_CONTROL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOPARTITION
/


CREATE TABLE  "APEX_ACCESS_SETUP" 
   (	"ID" NUMBER, 
	"APPLICATION_MODE" VARCHAR2(255), 
	"APPLICATION_ID" NUMBER, 
	 CONSTRAINT "APEX_ACCESS_SETUP_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "APEX_ACCESS_SETUP_UK" UNIQUE ("APPLICATION_ID")
  USING INDEX  ENABLE
   )
/

CREATE OR REPLACE TRIGGER  "BI_APEX_ACCESS_SETUP" 
before insert or update on apex_access_setup 
for each row
begin
if inserting and :new.id is null then
select apex_access_control_seq.nextval into :new.id from sys.dual;
end if;
if :new.application_id is null then
:new.application_id := v('APP_ID');
end if;
end;

/
ALTER TRIGGER  "BI_APEX_ACCESS_SETUP" ENABLE
/


CREATE TABLE  "APEX_ACCESS_CONTROL" 
   (	"ID" NUMBER, 
	"ADMIN_USERNAME" VARCHAR2(255), 
	"ADMIN_PRIVILEGES" VARCHAR2(255), 
	"SETUP_ID" NUMBER, 
	"CREATED_BY" VARCHAR2(255), 
	"CREATED_ON" DATE, 
	"UPDATED_ON" DATE, 
	"UPDATED_BY" VARCHAR2(255), 
	 CONSTRAINT "APEX_ACCESS_CONTROL_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "APEX_ACCESS_CONTROL_UK" UNIQUE ("ADMIN_USERNAME", "SETUP_ID")
  USING INDEX  ENABLE
   )
/
ALTER TABLE  "APEX_ACCESS_CONTROL" ADD CONSTRAINT "APEX_ACCESS_CONTROL_FK" FOREIGN KEY ("SETUP_ID")
	  REFERENCES  "APEX_ACCESS_SETUP" ("ID") ENABLE
/

CREATE INDEX  "APEX_ACCESS_CONTROL_FK_IDX" ON  "APEX_ACCESS_CONTROL" ("SETUP_ID")
/

CREATE OR REPLACE TRIGGER "BI_APEX_ACCESS_CONTROL" 
  before insert or update on apex_access_control
  for each row
begin
    if inserting and :new.id is null then
        select apex_access_control_seq.nextval into :new.id from sys.dual;
    end if;
    if inserting then
        :new.created_by := v('USER');
        :new.created_on := sysdate;
    end if;
    if updating then
        :new.updated_by := v('USER');
        :new.updated_on := sysdate;
    end if;
end; 

/
ALTER TRIGGER  "BI_APEX_ACCESS_CONTROL" ENABLE
/


