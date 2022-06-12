# COSC 304 - Introduction to Database Systems<br>Lab 8 (APEX): Unit 7-10: CreatingUsingForms, CreatingApplPageControls, AddingComputProcessValidations

**General Note:** To get points for your submissions, each new page and project must have your group number, team member names, and the following text: COSC 304, Summer T1 2022, Lab 8 Assignment, Unit <number>, HOL <number>.

## Project Requirements (25 marks):


### Unit 8: Creating and Using Forms (6 points)

#### HOL 8-1 Updating the Form Pages in the Demo Projects Application: In this hands-on lab, you update the default form pages in the Demo Projects application (3 points).
In the Demo Projects application, you create a report that allows each Team Member to see their outstanding tasks.

1.	Navigate to App Builder and run the Demo Projects application.

2.	In the navigation menu, click Demo Proj Team Members.
Then, click the Edit icon (pencil) next to a team member's name to view the modal form page for the person you selected.

3.	On the Developer Toolbar at the bottom of the page, click Edit Page 3 to jump to the modal page in Page Designer.

4.	In the property editor > Page > Identification, enter Maintain Team Member for both Name and Title.

5.	Under Rendering, select the Proj_Team_Member region. In the property editor, navigate to Appearance > Template Options. Click Use Template Defaults.

6.	In the Template Options dialogue, under Advanced, for Item Width, select Stretch Form Fields and click OK.

	Save your changes. Click Save.

7.	Now, modify the default Project form page to be more visually appealing and consistent with how the Maintain Team Member page was improved. Navigate to the application runtime environment. In the navigation menu, click Demo Projects.

8.	Click one of the Project names to open a modal dialogue.

9.	In the runtime environment, after selecting a project, in the Developer Toolbar, click Edit Page 5.

10.	In the Property Editor:
	- Identification: Name - enter Maintain Project
	- Identification: Title - enter Maintain Project

11.	Scroll down to Navigation and select the First item on the page for Cursor Focus. Then, click Save.

12.	Modify the default Milestone form page to be more visually appealing. In the Demo Projects runtime environment, navigate to the Demo Proj Milestones page and open one of the records by clicking the edit icon (pencil).
13.	In the Developer Toolbar, click Edit Page 7.

14.	In the Property Editor:
•	Identification: Name - enter Maintain Milestone
•	Identification: Title - enter Maintain Milestone

15.	Scroll down to Navigation and select the First item on the page for Cursor Focus. Then, click Save.

16.	Modify the default Task form page to be more visually appealing. In the Demo Projects runtime environment, navigate to the Demo Proj Tasks page and open one of the records by clicking the edit icon (pencil).

17.	In the Developer Toolbar, click Edit Page 9.

18.	In the Property Editor:
	- Identification: Name - enter Maintain Task
	- Identification: Title - enter Maintain Task

19.	Scroll down to Navigation and select the First item on the page for Cursor Focus.
Then, click Save.
	#### HOL 8-2 Creating a Form on a Table and Linking a Report: In this hands-on lab, you create a form on the PROJECT_BUDGET table. Then, you create a classic report on the PROJECT_BUDGET table and link this report to the form. This lab utilizes the Budget App application (3 points).

You first create a classic report on the PROJECT_BUDGET table in this lab. Then, you create a form on the PROJECT_BUDGET table. Finally, you link the classic report to the form.

1.	Navigate to App Builder and run the Budget App application.

2.	Click Application XXXX in the Developer toolbar; it will navigate you to the Application homepage. Now, create a Classic Report on the PROJECT_BUDGET table. Click Create Page and then perform the following steps:

	a) Select Report.

	b) Select Classic Report.

	c) Enter Project Budget Classic Report for Page Name and click Next

	d) For Navigation, select Create a new navigation menu entry and click Next

	e) Accept the defaults for Data Source and Source Type. 
    
    Select PROJECT_BUDGET for Table / View Name and click Create.

3.	The report page is created successfully. Now, create a form on the PROJECT_BUDGET table. Perform the following steps:

	a)	In the page designer toolbar, click Create and select Page.

	b)	Select Form.

	c)	Select Form again.

	d)	Enter Project Budget Classic Details for Name, select Modal Dialog for Page Mode and click Next.

	e)	Click Next.

	f)	Select PROJECT_BUDGET for Table / View Name and click Next.

	g)	For Primary Key Type, make sure Select Primary Key Column(s) is selected, and select the ID for Primary Key Column.

	h)	Click Create.

	The form page is created successfully.

4.	The form you just created is a dialogue page, so you cannot run it directly. If you click the Save and Run Page, you see this message:

5.	You want to navigate to the Project Budget Report page in the page designer. In the toolbar, click the Navigate to previous page arrow (down arrow).

6.	Under Rendering > Regions, select Report 1. In the property editor, replace the existing title with Project Budget Report.

7.	Under Rendering, expand Columns and select ID.

8.	In the property editor, under Identification, select Link for Type. 
Scroll down and locate Link > Target. Click No Link Defined.

9.	In the Link Builder – Target dialogue, select the following:
	- Target > Page: Select the form page, Project Budget Classic Details
	- Set Items > Name: P9_ID
	- Set Items > Value: #ID#
	Click OK.

10.	In the property editor, navigate to Link. For Link Text, click the Quick Pick and select apex-edit-pencil.png.

11.	Click Save and Run Page.

12.	The Project Budget Classic Report page is displayed.
Note: You might have to log in to the application using your username and password. Then, in the navigation menu, click Project Budget Report.

	Click the Edit icon (pencil) for any row, and the form dialogue page is displayed.





**Submission requirements:** Please submit an MS Word or PDF file with your screenshots. 