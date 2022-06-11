# COSC 304 - Introduction to Database Systems<br>Assignment 7 - Building a Database-enabled Web Site using APEX (40 pts)

**General Note:** To get points for your submissions, each new page and project must have your group number, your team member names, and the following text: **COSC 304, Summer T1 2022, Lab 7 Assignment, Unit \<number\>, HOL \<number\>**.

	
## Unit 5: Developing Reports (10 points)
	
	This exercise includes three hands-on labs.
### HOL 5-1 Creating a Classic Report: In this hands-on lab, you create a classic report region on the Dashboard page of the Demo Projects application (2.5 points).

In the Demo Projects application, you create a report that allows each Team Member to see their outstanding tasks.

1.	View the Dashboard page in the page designer. If you are on the Dashboard page, click Edit Page <n> in the Developer Toolbar.
2.	In the Rendering tree, right-click Content Body and select Create Region.
3.	In the property editor, under Identification, enter My Outstanding Tasks for Title—select Classic Report for Type.
4.	In the property editor, select SQL Query for Type under Source. Then, copy and paste the following code for SQL Query.
	
	```
	select p.name project
	, t.name task
	, t.end_date
	from demo_proj_tasks t
	, demo_projects p
	, demo_proj_milestones m
	, demo_proj_team_members tm
	where p.id = t.project_id
	and m.id = t.milestone_id (+)
	and tm.id = t.assignee and nvl(t.is_complete_yn, 'N') = 'N'
	and upper(tm.username) = upper(:APP_USER)
	order by t.end_date
	```

	**Note:** The where the username condition = :APP_USER restricts the records to those assigned to the person running the application.


5.	In the Property Editor, locate Appearance > Template Options and click Use Template Defaults, Scroll - Default.
6.	For General, enable Remove Body Padding, and for Body Height, select 480px. Click OK.
7.	Locate the Rendering tree. Under the My Outstanding Tasks region, click Attributes.
8.	In the Property Editor, under Attributes, locate Appearance > Template Options and click Use Template Defaults, Enable, Enable.
9.	For General, enable Stretch Report, and for Report Border, select No Outer Borders. Click OK.

	**Note:** Region Template Options (such as Body Height, Header, Style and so on) alter the overall presentation of a region. However, Attribute Template Options (such as Stretch Report, Row Highlighting and so on) alter the way the records within a region *display*.

10.	Run the application to see how the Home page looks now. Click Save and Run Page. 
11.	Your Dashboard (see the MS Word document). 
12.	In the Developer Toolbar, click Home.

### HOL 5-2 Creating an Interactive Report: In this hands-on lab, you create a new database application and then, using the Create Page wizard, add an interactive report page (2.5 points).

In this lab, you create an interactive report on the HARDWARE table. You created this table in HOL 2-2. First, you create a database application and then the interactive report page.

1.	Create a database application. Perform the following steps:

	a) Navigate to App Builder. Click Create.

	b) Click New Application.

	c) Enter Hardware for Name, accept the remaining defaults and click Create Application.

2.	Now, create an interactive report on the HARDWARE table. On the application home page, click Create Page.
3.	For Page Type, select Report.
4.	Next, select Interactive Report.
5.	For Page Attributes:

	•	Page Name: Enter Hardware Interactive Report

	•	Breadcrumb: Select Breadcrumb

	•	Parent Entry: Home(Page1)

	•	Entry Name: Enter Hardware Interactive Report

      Click Next.

6.	For Navigation Menu:

	•	Navigation Preference: Select Create a new navigation menu entry

	•	Parent Navigation Menu Entry: Home

      Click Next.
7.	For Report Source > Table / View Name, select HARDWARE(table) and click Create.
8.	Click Save and Run Page. 

	Enter your Workspace username and password. Click Sign In. 
9.	In the Developer Toolbar, click Home.

### HOL 5-3 Creating an Interactive Grid: In this hands-on lab, you use the Create Page wizard and add an interactive grid page in the Budget App application (2.5 points).

In this lab, you create an interactive grid on the PROJECT_BUDGET table. You already created the Budget App application in HOL 3-2. Now, you create an interactive grid in the Budget App application.

1.	Navigate to App Builder. Select Budget App. If you are in the View Report mode, select Budget App under Name.
2.	Click Create Page.
3.	Select Report and on the next page, select Interactive Grid.
4.	For Page Attributes, Enter Project Budget Interactive Grid for Page Name and click Next.
5.	For Navigation Menu:

	•	Navigation Preference: Select Create a new navigation menu entry

	•	New Navigation Menu Entry: Enter Interactive Grid

	Click Next.

6.	In the Report Source dialogue, note that you can set the Editing Enabled to either enabled or not. In this lab, you accept the default, which is not enabled.

	Select Project_Budget for Table / View Name and click Create.

7.	Click Save and Run Page.  Log in using the Workspace username and password. 

	The interactive grid displays.

8.	In the Developer Toolbar, click Home.

### HOL 5-4 Creating a Faceted Search Page (doesn't work, but use interactive report (default in APEX V19.1), as we discussed during the lectures): In this hands-on lab, you create and use an interactive report (but not Faceted Search Page) (2.5 points).

In this lab, you create an application by loading the sample EMP / DEPT data. The application includes an interactive report search page. You review this report and perform some filtering of the data. Later, you edit the page and modify the facet properties.


1.	Navigate to your Workspace home page. Navigate to SQL Workshop > Utilities > Sample Datasets.
2.	Click Install for EMP / DEPT. This installs the generic EMP and DEPT tables.
3.	Click Next.
4.	Click Install Dataset.
5.	Click Create Application.
6.	Enter "Employees Search App COSC 304 Summer T1 2022 Youry Group Number <your team members names>" for Name.

	Click Create Application.

7.	The application is now successfully created. Click Run Application.
8.	Login using your Workspace username and password.
9.	In the Action drop-down menu choose Filter. In Filter select in Column Ename, Operator contains. 
10.	Add King in Expression: Mgr. The Employees Interactive Report search page is displayed (three Enames: Blake, Clark, Jones).
11.	Click the filter check box with "Mgr contains 'King'" to  Clear to remove the filter.
12.	Now, do the same for Job, select CLERK. Then, add a new filter Salary in the Actions and choose Column Sal, Operator between, Expression between  950 – 1300. Notice that the report is filtered and refreshed (you will see Adams, James, Miller).
13.	Click Clear for both Salary and Job.
14. That's it. Please skip all other tasks related to the Faceted Search. 
