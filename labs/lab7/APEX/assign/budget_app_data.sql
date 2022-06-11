Rem  Copyright � 2020 Oracle and/or its affiliates.  All rights reserved.
Rem  Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl. 


create or replace procedure PROJECT_BUDGET_DATA
as
begin
delete from PROJECT_BUDGET;

Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (43,'New Packaged App','Prepare requirements doc',to_date('15-FEB-17','DD-MON-RR'),to_date('20-FEB-17','DD-MON-RR'),'Open','PAM KING',500,800);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (1,'ACME Web Express Configuration','Create pilot workspace',to_date('02-FEB-17','DD-MON-RR'),to_date('02-FEB-17','DD-MON-RR'),'Closed','JOHN WATSON',100,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (2,'ACME Web Express Configuration','Specify security authentication scheme(s)',to_date('02-JUL-17','DD-MON-RR'),to_date('02-JUL-17','DD-MON-RR'),'Open','John Watson',200,300);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (3,'ACME Web Express Configuration','Configure Workspace provisioning',to_date('02-AUG-17','DD-MON-RR'),to_date('02-AUG-17','DD-MON-RR'),'Open','JOHN WATSON',200,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (4,'Bug Tracker','Document quality assurance procedures',to_date('12-DEC-16','DD-MON-RR'),to_date('15-DEC-16','DD-MON-RR'),'Closed','MYRA SUTCLIFF',3000,2000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (5,'Bug Tracker','Review automated testing tools',to_date('16-DEC-16','DD-MON-RR'),to_date('18-DEC-16','DD-MON-RR'),'Closed','Myra Sutcliff',750,1500);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (6,'Bug Tracker','Implement bug tracking software',to_date('31-DEC-16','DD-MON-RR'),to_date('31-DEC-16','DD-MON-RR'),'Closed','Myra Sutcliff',100,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (7,'Bug Tracker','Train developers on tracking bugs',to_date('01-JUL-17','DD-MON-RR'),to_date('01-DEC-17','DD-MON-RR'),'On-Hold','Myra Sutcliff',1000,2000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (8,'Convert Spreadsheets','Create ACME Web Express applications from spreadsheets',to_date('02-MAY-17','DD-MON-RR'),to_date('02-SEP-17','DD-MON-RR'),'Open','Pam King',6000,10000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (9,'Convert Spreadsheets','Send links to previous spreadsheet owners',to_date('02-NOV-17','DD-MON-RR'),to_date('02-NOV-17','DD-MON-RR'),'Pending','Pam King',0,500);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (10,'Discussion Forum','Identify owners',to_date('01-JAN-17','DD-MON-RR'),to_date('01-JAN-17','DD-MON-RR'),'Closed','Hank Davis',250,300);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (11,'Discussion Forum','Install ACME Web Express application on internet server',to_date('01-JUL-17','DD-MON-RR'),to_date('01-JUL-17','DD-MON-RR'),'Closed','Hank Davis',100,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (12,'Discussion Forum','Monitor participation',to_date('02-JUN-17','DD-MON-RR'),to_date('02-JUL-17','DD-MON-RR'),'Open','Hank Davis',450,500);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (13,'Email Integration','Get RFPs for new server',to_date('02-APR-17','DD-MON-RR'),to_date('02-MAY-17','DD-MON-RR'),'Closed','Bob Nile',2000,1000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (14,'Employee Satisfaction Survey','Complete questionnaire',to_date('01-NOV-17','DD-MON-RR'),to_date('01-DEC-17','DD-MON-RR'),'Closed','Irene Jones',1200,800);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (15,'Client Server Conversion','Plan migration schedule',to_date('02-JAN-17','DD-MON-RR'),to_date('02-JAN-17','DD-MON-RR'),'Closed','Pam King',1000,1000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (16,'Client Server Conversion','Migrate Client Server applications',to_date('02-JUN-17','DD-MON-RR'),to_date('02-SEP-17','DD-MON-RR'),'Open','Pam King',300,12000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (17,'Client Server Conversion','Test migrated applications',to_date('02-NOV-17','DD-MON-RR'),to_date('02-DEC-17','DD-MON-RR'),'Pending','Russ Saunders',0,6000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (18,'Load Packaged Apps','Implement in Production',to_date('02-JAN-17','DD-MON-RR'),to_date('02-JAN-17','DD-MON-RR'),'On-Hold','John Watson',200,1500);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (19,'Load Packaged Apps','Train Administrators of Packaged Apps',to_date('02-MAR-17','DD-MON-RR'),to_date('02-MAR-17','DD-MON-RR'),'Pending','John Watson',0,1000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (20,'Maintain Support Systems','HR software upgrades',to_date('01-APR-17','DD-MON-RR'),to_date('01-JUL-17','DD-MON-RR'),'Closed','Pam King',8000,7000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (21,'Maintain Support Systems','Apply Billing System updates',to_date('01-AUG-17','DD-MON-RR'),to_date('01-OCT-17','DD-MON-RR'),'Closed','Russ Saunders',9500,7000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (22,'Maintain Support Systems','Arrange for vacation coverage',to_date('01-DEC-17','DD-MON-RR'),to_date('01-DEC-17','DD-MON-RR'),'Open','Al Bines',300,500);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (23,'Migrate Desktop Application','Post-migration review',to_date('03-OCT-17','DD-MON-RR'),to_date('03-NOV-17','DD-MON-RR'),'Pending','Bob Nile',100,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (24,'Migrate from Legacy Server','Identify integration points',to_date('03-MAR-17','DD-MON-RR'),to_date('03-APR-17','DD-MON-RR'),'Pending','Bob Nile',0,2000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (25,'Migrate from Legacy Server','Create DB Connection to new server',to_date('03-MAR-17','DD-MON-RR'),to_date('03-MAR-17','DD-MON-RR'),'Pending','Scott Spencer',0,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (26,'Migrate from Legacy Server','Import data',to_date('03-SEP-17','DD-MON-RR'),to_date('03-OCT-17','DD-MON-RR'),'Pending','John Watson',0,1000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (27,'Migrate from Legacy Server','Convert processes',to_date('03-SEP-17','DD-MON-RR'),to_date('03-NOV-17','DD-MON-RR'),'Pending','Pam King',0,3000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (28,'Public Website','Determine host server',to_date('01-NOV-17','DD-MON-RR'),to_date('01-NOV-17','DD-MON-RR'),'Closed','Tiger Scott',200,200);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (29,'Public Website','Check software licenses',to_date('01-NOV-17','DD-MON-RR'),to_date('01-NOV-17','DD-MON-RR'),'Closed','Tom Suess',100,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (30,'Public Website','Develop web pages',to_date('02-JUL-17','DD-MON-RR'),to_date('02-AUG-17','DD-MON-RR'),'Open','Tiger Scott',0,2000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (31,'Public Website','Plan rollout schedule',to_date('02-SEP-17','DD-MON-RR'),to_date('02-SEP-17','DD-MON-RR'),'Open','Tom Suess',0,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (32,'Software Project Tracking','Conduct project kickoff meeting',to_date('02-MAR-17','DD-MON-RR'),to_date('02-MAR-17','DD-MON-RR'),'Closed','Pam King',100,100);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (33,'Software Project Tracking','Customize Software Projects software',to_date('02-JUN-17','DD-MON-RR'),to_date('02-JUL-17','DD-MON-RR'),'Open','Tom Suess',600,1000);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (34,'Software Project Tracking','"Enter base data (Projects, Milestones, etc.)"',to_date('02-AUG-17','DD-MON-RR'),to_date('02-AUG-17','DD-MON-RR'),'Open','Tom Suess',200,200);
Insert into PROJECT_BUDGET (ID,PROJECT,TASK_NAME,START_DATE,END_DATE,STATUS,ASSIGNED_TO,COST,BUDGET) values (35,'Software Project Tracking','Load current tasks and enhancements',to_date('02-OCT-17','DD-MON-RR'),to_date('02-OCT-17','DD-MON-RR'),'Open','Tom Suess',400,500);

delete from AUDIT_DETAILS;

Insert into AUDIT_DETAILS (ID,CREATED_BY,CREATED_ON) values (47,'CHAITANYA',to_date('14-FEB-17','DD-MON-RR'));
Insert into AUDIT_DETAILS (ID,CREATED_BY,CREATED_ON) values (43,'CHAITANYA',to_date('14-FEB-17','DD-MON-RR'));
Insert into AUDIT_DETAILS (ID,CREATED_BY,CREATED_ON) values (45,'CHAITANYA',to_date('14-FEB-17','DD-MON-RR'));
Insert into AUDIT_DETAILS (ID,CREATED_BY,CREATED_ON) values (46,'CHAITANYA',to_date('14-FEB-17','DD-MON-RR'));

delete from APEX_ACCESS_SETUP;
Insert into APEX_ACCESS_SETUP (ID,APPLICATION_MODE,APPLICATION_ID) values (1,'ALL',103);
Insert into APEX_ACCESS_SETUP (ID,APPLICATION_MODE,APPLICATION_ID) values (21,'RESTRICTED',106);

delete from APEX_ACCESS_CONTROL;
Insert into APEX_ACCESS_CONTROL (ID,ADMIN_USERNAME,ADMIN_PRIVILEGES,SETUP_ID,CREATED_BY,CREATED_ON,UPDATED_ON,UPDATED_BY) values (22,'apex_admin','ADMIN',21,'CHAITANYA',to_date('15-FEB-17','DD-MON-RR'),null,null);
Insert into APEX_ACCESS_CONTROL (ID,ADMIN_USERNAME,ADMIN_PRIVILEGES,SETUP_ID,CREATED_BY,CREATED_ON,UPDATED_ON,UPDATED_BY) values (23,'apex_dev','EDIT',21,'CHAITANYA',to_date('15-FEB-17','DD-MON-RR'),null,null);
Insert into APEX_ACCESS_CONTROL (ID,ADMIN_USERNAME,ADMIN_PRIVILEGES,SETUP_ID,CREATED_BY,CREATED_ON,UPDATED_ON,UPDATED_BY) values (24,'apex_user','VIEW',21,'CHAITANYA',to_date('15-FEB-17','DD-MON-RR'),null,null);

end;
/
show errors
    
begin
PROJECT_BUDGET_DATA;
commit;
end;
/

