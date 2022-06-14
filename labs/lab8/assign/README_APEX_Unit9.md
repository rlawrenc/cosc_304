# COSC 304 - Introduction to Database Systems<br>Lab 8 (APEX): 

### Unit 9: Creating Application Page Controls. For more information see[hol09CreatingApplPageControls.docx](https://canvas.ubc.ca/courses/95492/modules/items/4509675) (4 points)

**General Note:** To get points for your submissions, each new page and project must have your group number, team member names, and the following text: COSC 304, Summer T1 2022, Lab 8 Assignment, Unit \<number\>, HOL \<number>\.


#### HOL 9-1 Updating the Team Members Pages: In this hands-on lab, you update the page items on the form and create a new collapsible sub-region to include the audit details (3 points).In this lab, you update the page items on the form page. You create an Audit Details collapsible sub-region on the form page. You make the form page visually appealing. This lab also covers updating the button properties and adjusting the button display on the interactive report.

1.	Navigate to App Builder and run the Demo Projects application.
In the navigation menu, click Demo_ Proj_ Team_ Members.

	In the Developer Toolbar, click Edit Page 2.

2.	By default, buttons are positioned in the associated region. Move the Create button at the top of the page to the Breadcrumbs region. In the Rendering tree, locate the CREATE button under Content Body. Click and hold the CREATE button and drag it into the Breadcrumbs region.

3.	The CREATE button will appear as a child in its Region Buttons folder.

4.	In the Property Editor:
	- Identification: Label - enter Add Team Member.
	- Layout: Button Position - select Create.
	- Appearance: Make sure Hot is enabled.

	Click Save and Run Page.

5.	Navigate back to page designer. You want to view Page 3 now. In the toolbar, click the Navigate to the next page arrow.

6.	The generated page includes a page item for every column in the Demo_Proj_Team_Members tables. You must alter the Photo Blob field to support file upload to a table.

	In the Rendering tree, click the P3_PHOTO_BLOB item. For Label, enter Photo.

7.	The earlier tables include audit columns for storing when and who created and last updated each record. End users should never be allowed to enter data into these columns. Furthermore, these columns should not display when the user creates a new record.

	Given that audit information is only reviewed occasionally, it is preferable to add these columns into a separate, collapsible region, so they can be reviewed when necessary but do not take up excessive screen real estate most of the time.
Reconfigure the audit columns to display only and place them in a conditional sub-region.

	In the Rendering tree, right-click PROJ_TEAM_MEMBER and select Create Sub Region.

8.	In the Property Editor, for the New region: Identification: Title - enter Audit Details.
For Appearance>Template, select Collapsible.
Click Use Template Defaults, Expanded, Scroll-Default.

9.	In the Template Options dialogue, select Collapsed for Default State.
	
	Select Remove UI Decoration for Style, and click OK.

10.	In the property editor, navigate to Server-side Condition. For Type, select Item is NOT NULL—select P3_ID from the Item list.

11.	Move the audit columns into the new region. 
Hold the Ctrl key from the Rendering tree or Grid Layout and click these items to select them: P3_CREATED, P3_CREATED_BY, P3_UPDATED, and P3_UPDATED_BY.
In the property editor, for Identification > Type, select Display Only.

	For Layout > Region, select ..Audit Details.
Click Save.

12.	Page 3 is a dialogue, so you cannot run it directly. Navigate to the application runtime environment. In the navigation menu, click Demo_Proj_Team_Members.

	Notice the Add Team Member button.

	Select a team member’s record in the report to view the improved modal dialogue.
#### HOL 9-2 Updating the Projects Pages: In this hands-on lab, you update the page items on the form and create a new collapsible sub-region by copying it from another page in the application. You will also create and use a dynamic list of values (skipped because the `List of Values` feature is unavailable in this version).#### HOL 9-3 Updating the Milestones Pages: This hands-on lab covers updating item properties and creating and using a dynamic and static list of values (skipped because the `List of Values` feature is unavailable in this version).

#### HOL 9-4 Updating the Tasks Pages: In this hands-on lab, you create a new page item, update existing items on the form, and create a collapsible sub-region. You will also use the list of values created as shared components (skipped because the `List of Values` feature is unavailable in this version).



**Submission requirements:** Please submit an MS Word or PDF file with your screenshots. 