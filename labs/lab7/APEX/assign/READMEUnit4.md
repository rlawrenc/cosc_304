# COSC 304 - Introduction to Database Systems<br>Assignment 7 - Building a Database-enabled Web Site using APEX (40 pts)

**General Note:** To get points for your submissions, each new page and project must have your group number, your team member names, and the following text: **COSC 304, Summer T1 2022, Lab 7 Assignment, Unit \<number\>, HOL \<number\>**.


## Unit 4: Managing Pages in Page Designer (10 points)

In this lab, you create a dashboard by adding a new component to the Home page of the Demo Projects application. You open the home page in page designer, navigate through and review the page designer panes, add a chart region and edit the chart attributes.

1.	In the App Builder, run the Demo Projects Application. You are now in the application runtime environment.

	In the Developer Toolbar, click Edit Page 1.

	**Note:** If you are not on the Home page then the Developer Toolbar will show the current page number, and clicking on Edit Page xx will navigate to that page, instead of Page 1.

2.	The Page Designer is displayed for Page 1. There are three main panes within Page Designer: Left Pane, Central Pane, and Right Pane.

	You can change the size of each pane by selecting the dividers and sliding them left or right.

	Change the size of the Grid Layout and Gallery by sliding the divider between them up and down.

3.	In the Page Designer, you can invoke help on any attribute by clicking the Help icon (shown as a question mark) on the toolbar. Select a component and then select an attribute in the Property Editor to display help on that attribute. 

	For Example, in this screenshot below, you select Demo Projects under Rendering and then select Sequence > Layout. The help text for Sequence is displayed. 

4.	Add a Dashboard page and include a bar chart that shows projects with the number of tasks. In the page designer, click Create (the + icon) and select Page.
5.	In the Create a Page dialogue, click Dashboard.
6.	Enter Dashboard for Page Name, and click Next.
7.	For Navigation Preference, select Create a new navigation menu entry.

	Click Next.

8. Click Create.
9. Click Layout in the Central Pane.
10.	In the Gallery (directly below the Grid Layout), click Regions, and locate Chart.
11.	Click and hold Chart and drag it to the Content Body region. It should appear as a darkened tile before you drop it into place.

	Note: When you drag the region up, and hover over the small yellow section, below Content Body, the yellow section will expand. A darker yellow section will indicate where the region will be placed.
12.	Now you modify the properties for a region, such as a Title and Template Options. When you first create a region, it is created with default properties, such as a Title of New. Use the Property Editor to edit attributes for the currently selected component.

	In the Property Editor, under Identification, for Title - enter Project Tasks.

	**Note:** The region name in the Rendering tree (left pane) and the Grid Layout (central pane) are updated to reflect the new title, as soon as you navigate out of the Title attribute in the Property Editor.

13.	In the Property Editor, under Appearance, locate Template Options and click Use Template Defaults, Scroll - Default.

14.	In the Template Options dialog, select 480px for Body Height.

	Click OK.

15.	For certain region types, such as Charts, there are also Attribute properties. The region properties determine how the region is displayed, whereas, the Attributes for a region (where available) are used to define the characteristics of the region, and how the contents of the region are displayed.

	Locate the Rendering tree. Under the Project Tasks region, click Attributes.

16.	In the Property Editor:

	•	Chart: Type - select Bar

	•	Appearance: Orientation - select Horizontal

	•	Appearance: Stack - select Yes

	•	Layout: Height - enter 480

17.	Under Rendering > Project Tasks region, navigate to Axes and select y.

	In the property editor, enter Tasks for Title.

18.	The DEMO_PROJ_TASKS table includes a column called IS_COMPLETE_YN. This column is populated by users to indicate that a task is complete. Next, enter chart series details for completed and incomplete tasks within a project.

	In the Rendering tree, nested under the Project Tasks region, click Series X New.

19.	In the property editor, under Identification > Name, enter Tasks.

	Under Source, for Type, select SQL Query.

	Then click the Code Editor icon.

20.	For SQL Query, copy and paste the following code, click the validate icon and then click OK.

	```
	select p.id
	, p.name as label
	, (select count('x') from demo_proj_tasks t 
	where p.id = t.project_id 
	and nvl(t.is_complete_yn,'N') = 'Y'
	) value
	, 'Completed Tasks' series
	, p.created
	from demo_projects p
	UNION ALL
	select p.id
	, p.name as label
	, (select count('x') from demo_proj_tasks t 
	where p.id = t.project_id 
	and nvl(t.is_complete_yn,'N') = 'N'
	) value
	, 'Incomplete Tasks' series
	, p.created
	from demo_projects p
	order by 5
	```

21.	Under Column Mapping, select:
	- Series Name: SERIES
	- Label: LABEL
	- Value: VALUE

	Click Save and Run Page.
	
22.	You might have to log in using Workspace username and password. 