# COSC 304 - Introduction to Database Systems<br>Assignment 7 - Building a Database-enabled Web Site using APEX (40 pts)

**General Note:** To get points for your submissions, each new page and project must have your group number, your team member names, and the following text: **COSC 304, Summer T1 2022, Lab 7 Assignment, Unit \<number\>, HOL \<number\>**.

## Unit 3: Creating a Database Application (10 points)

### HOL 3-1 Creating a Database Application from Scratch: In this hands-on lab, you will create a database Web application, Demo Projects. You will extend and improve this application later (5 points)

In this lab, you create the initial application using the Create Application wizard to define multiple pages. Now that you have created the underlying tables, you are ready to create a desktop application. You add reports and forms for the tables you created.


Generally, when developing an application, you will not know all of the pages required at the beginning. Therefore, you will only generate a select number of pages initially, and then use the wizard to add additional pages as required. However, for this exercise, you will generate most of the pages required for the application upfront.


1.	Using the Create Application Wizard, create the Demo Projects application. 
Navigate to App Builder and then click Create.
2.	You want to create a new application. Click New Application.
3. For Name, enter Demo Projects. For Appearance, click the Set Appearance icon.
4. In the Appearance dialogue, perform the following steps:

	a)	For Theme Style, select Vita – Red.
	
	b)	For Application Icon, click Choose New Icon. Click any coloured circle at the top and choose an application icon. Then click Set Application Icon. 
	
	c)	Click Save Changes.
5.	Next, add Report and Form page types for the following tables:
	
	•	DEMO_PROJ_TEAM_MEMBERS

	•	DEMO_PROJECTS

	•	DEMO_PROJ_MILESTONES

	•	DEMO_PROJ_TASKS

      Click Add Page.

6.	In the Add Page dialogue, click Interactive Report.
7. In the Add Report Page dialogue, select / enter the following and then, click Add Page.

	•	Page Name: DEMO_PROJ_TEAM_MEMBERS.

	•	Table or View: DEMO_PROJ_TEAM_MEMBERS.

	•	Include Form checkbox

8.	Add Report and Form page type for the DEMO_PROJECTS table.

	Click Add Page.

9.	In the Add Page dialogue, click Interactive Report.
10.	In the Add Report Page dialogue, select / enter the following and then, click Add Page.

	•	Page Name: DEMO_PROJECTS.

	•	Table or View: DEMO_PROJECTS

	•	Include Form checkbox

11.	Add Report and Form page type for the DEMO_PROJ_MILESTONES table.

	Click Add Page.

12.	In the Add Page dialogue, click Interactive Report.
13.	In the Add Report Page dialogue, select / enter the following and then, click Add Page.

	•	Page Name: DEMO_PROJ_MILESTONES

	•	Table or View: DEMO_PROJ_MILESTONES

	•	Include Form checkbox


14.	Add Report and Form page type for the DEMO_PROJ_TASKS table.

	Click Add Page.


15.	In the Add Page dialogue, click Interactive Report.


16.	In the Add Report Page dialogue, select / enter the following and then, click Add Page.

	•	Page Name: DEMO_PROJ_TASKS

	•	Table or View: DEMO_PROJ_TASKS

	•	Include Form checkbox


17.	Click Check All next to Features.

19.	Enter / select the following in advanced settings and then click Save Changes.

	•	Short Description - Maintain project details.

	•	Description - This application is used to maintain project details for the team. Projects include milestones, where you can define due dates. Tasks can be defined against a milestone or directly against the project.

	•	Add "Built with APEX" to Footer: Yes

20.	Click Create Application. Notice the application creation progress.
21.	The Demo Projects application is now created. Click Run Application.
22.	Login using your Workspace username and password. Click Sign In.
23.	Your screen should look like the following:



### HOL 3-2 Creating a Database Application loading data using SQL DDL and DML scripts (not a spreadsheet, because it's blocked by Oracle in the Cloud): In this hands-on lab, you will use a spreadsheet to create a database Web application, Budget App. You do not extend this application but will use it in a later exercise (5 points).

In this lab, you use SQL DDL and DML scripts to create a database application.

1.	Navigate to SWL Workshop and click SQL Scripts.
2.	Select From a File [budget_app_tablesYK](budget_app_tablesYK.sql) and press upload button. 
3.	In the SQL Scripts window find just the uploaded script and run it. 
4.	Enter Project_Budget for Table Name. 

	Click in the Error Table Name field. Notice that the error table name is automatically populated.

5.	Click Configure. 

	You now see Columns to Load. Verify the data types for each of the columns. For example, make sure that START_DATE and END_DATE columns have DATE Data Type. 

	You do not have any changes to save. Click X to close the Configure dialogue.

6.	Now, click Load Data.

7.	The PROJECT_BUDGET table is created with 73 rows. Now, click Create Application.
8.	For Name, enter Budget App.

	Notice that the Home, Dashboard, Faceted Search, Interactive Report with Form, and Calendar pages are created by default.

9.	For Features, click Check All. 
10.	Now, click Create Application.
11.	Click Run Application.
12.	Enter your Workspace Username and Password. Click Sign In.
13.	Your application should look like the screenshot below:
14.	Review the Budget App application that you just created. Check out all the pages that were created by default.