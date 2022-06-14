# COSC 304 - Introduction to Database Systems<br>Lab 8 (APEX): 
### Unit 10: Adding Computations, Processes, and Validations. For more information see[hol10AddingComputProcessValidations.docx](https://canvas.ubc.ca/courses/95492/modules/items/4509668) (9 points)

**General Note:** To get points for your submissions, each new page and project must have your group number, team member names, and the following text: COSC 304, Summer T1 2022, Lab 8 Assignment, Unit \<number\>, HOL \<number>\.



#### HOL 10-1 Implementing Validations on the Maintain Project Page: You create and use validations on the Maintain Project page (3 points) in this lab.

In this lab, you add validations to the Maintain Projects page so that when a user changes the status to Completed, they add the Completed Date, which is not forward-dated.

1.	Navigate to App Builder and run the Demo Projects application.

	a) In the navigation menu, click DEMO_PROJECTS. In the Developer Toolbar, click Edit 
    Page 4.

	b) Under Rendering, expand Columns, and select STATUS_CD.

	c) In the property editor, replace the Heading with Status.

	d) Click Save and Run Page.

	e) In the interactive report, click a project name.

	f) In the Developer Toolbar, click Edit Page 5.

2.	In the page designer, click the Processing tab.
Right-click Validating and select Create Validation.

	In the central pane, click the Help tab.
	
	Note: The help text displays the selected attribute in the Property Editor (right pane). For example, clicking on the Validation Type attribute label (not the select list) displays a list of all the available options, together with a description of when each option will pass (not display the error message) or fail (displays the error message).

3.	In the property editor:
	- Identification: Name - enter Completed Date is Not Null
	- Validation: Type - select Item is NOT NULL
	- Validation: Item - select P5_COMPLETED_DATE
	- Error: Error Message - select the Error Message attribute label (not the data entry area), at which point the Help pane will display the help text for Error Message. On the Help pane under Examples, copy and paste #LABEL# must have some value. into the Property Editor attribute
	- Server-side Condition: Type - select Item = Value
	- Server-side Condition: Item - select P5_STATUS_CD
	- Server-side Condition: Value - enter COMPLETED

	Note: This condition ensures that the validation only fires when the Status item is COMPLETED.

	Note: The #LABEL# text within the Error Message will be substituted with the Label of the associated item. If the item label is updated, the error message will also reflect the updated value. This improves consistency and prevents messages from having an out-of-date label reference.

4.	In the Processing pane, right-click Validating and select Create Validation.

5.	In the property editor:
	- Identification: Name - enter Completed Date is not Forward Dated
	- Validation: PL/SQL Expression - enter :P5_COMPLETED_DATE <= sysdate
	- Error: Error Message - enter #LABEL# cannot be forward dated
	- Error: Associated Item - select P5_COMPLETED_DATE
	- Server-side Condition: Type - select Item is NOT NULL
	- Server-side Condition: Item - select P5_COMPLETED_DATE

	Click Save.

6.	Now that you created the two validations, you want to verify if they work as expected. Navigate to the Demo Projects application runtime environment.

	In the navigation menu, click DEMO_PROJECTS. Then, select a project name.

7.	Try out these functions to see how the page responds:

	a)	Save a record with a Status of COMPLETED and no Completion Date - An error message should be displayed.

	b)	Save a record with a Completion Date in the future - An error message should be displayed.
#### HOL 10-2 Creating and Using a Computation: In this lab, you create a computation that changes the value of a field entered using the form to uppercase after the page is submitted (2 points).In this lab, you create a computation that changes the Assigned To value entered using the form to uppercase after the page is submitted.

1.	Navigate to App Builder and run the Budget App application.

2.	In the navigation menu, click Project Budget Report. This is the interactive report created when you created the application using a spreadsheet in HOL 3-2.

3.	Create an After Submit PL/SQL Expression computation on the P5_ASSIGNED_TO item. The PL/SQL expression should be upper(:P5_ASSIGNED_TO). Test the page to see that the Assigned To is stored as uppercase. 

	Perform the following steps:

	a) In the PROJECT_BUDGET interactive report, click the Edit icon (pencil) for any record.
    
    Then, in the Developer Toolbar, click Edit Page 5.

	b) In the page designer, click Processing.
   
	Right-click After Submit and select Create Computation.

	c) In the property editor:
	- Identification > Item Name: Select P5_ASSIGNED_TO
	- Computation > Type: Select PL/SQL Expression
	- Computation > PL/SQL Expression: Enter upper(:P5_ASSIGNED_TO)

	Click Save.

	d) This is a dialogue page, and so you cannot run this directly. You need first to run the interactive report page.

     Navigate to the application runtime environment, click Project Budget Report in the navigation menu, and then click the edit icon for a record.

	e) Click Apply Changes. The data is submitted now.

	f) In the report, notice that the value for Assigned To is stored in uppercase.

#### HOL 10-3 Creating and Using a Process: This lab covers creating an After Submit process on the Project Budget form page (2 points).In this lab, you create a process to insert a record into a table called AUDIT_DETAILS every time a project is added.

1.	You want to create an After Submit process on the Budget form page. Whenever a user adds a new project by using this form, the user details are stored in the AUDIT_DETAILS table.

	Perform the following steps:     

	a)	View Page 5 in the page designer

	b)	Click the Processing tab and navigate to Processing > Processes.

	c)	Select Process form Project Budget.

	In the property editor, note that Return Primary 	Key(s) after Insert is Enabled by default.    
	Under Success Message > Success Message: Enter 	Project added successfully!    Click Save.
2.	Navigate to SQL Workshop and create the AUDIT_DETAILS table.
	a) Click SQL Workshop and select SQL Commands.

	b) Copy the following SQL, paste it in the SQL Commands area, and click Run.

	```
	CREATE table "AUDIT_DETAILS" (
    "ID"         NUMBER,
    "CREATED_BY" VARCHAR2(60),
    "CREATED_ON" DATE,
    constraint  "AUDIT_DETAILS_PK" primary key ("ID")
)
	```

	**Note:** In my case the table was already created. You don't need to recreate it now. 

	c) The table is created. Now, navigate to the window or tab of the Budget App application runtime  
    environment.
    
    In the navigation menu, click Project Budget Report.
    
    Click the Edit icon for a record, and then in the Developer Toolbar, click Edit Page 5.

3.	Click the Processing tab.
Navigate to Processing, right-click Processes and select Create Process.

4.	In the property editor:
	- Identification > Name: Enter Audit Details
	- Source > PL/SQL Code: Copy and paste the following code:
	- 
	```
      INSERT INTO audit_details VALUES(:P5_ID,:APP_USER,
      sysdate);
	```
	**Note** Please use the correct variable for the page. In my case I had Page 5, but not 4. In my case I had to use VALUES(:P4_ID,:APP_USER, sysdate); — not :P5_ID
	
	- Execution Options > Sequence: Enter 40
	- Success Message > Success Message: Enter Success!
	- Error > Error Message: Enter Error!
	- Server-side Condition > When Button Pressed: Select CREATE

	Click Save.

	Note: The sequence of this process should be the one immediately after the Process Row of Process form the Project Budget process.

5.	Now, you want to verify if the processes are working. In the page designer toolbar, click the Navigate to Previous Page arrow.

6.	Click Save and Run Page, then click the Create button.

7.	In the Budget dialog, enter values for each of the fields and click Create.
	- Project: New Packaged App
	- Task Name: Prepare requirements doc
	- Start Date: 11/1/2019 (I used different format 01-Nov-19)
	- End Date: 11/25/2019 (I used different format 25-Nov-19)
	- Status: Open
	- Assigned To: Pam King
	- Cost: 500
	- Budget: 800

8.	The record is created now. In the Developer Toolbar, click Home.

9.	Click SQL Workshop. Then, click Object Browser.
Under Tables, select AUDIT_DETAILS.
	
	Click Data.
	
	Notice that the user details have been added to the table.
#### HOL 10-4 Creating and Using Validations: In this hands-on lab, you create a not null validation and a validation to ensure that the item is numeric (2 points).

In this lab, you create two validations on the Project Budget form page. The first validation you create ensures that the project field is not null. The second one ensures that the value entered for cost is only numeric.

1.	Navigate to the window or tab of the Budget App application runtime environment.

	In the navigation menu, click Project Budget Report.

	Click the Edit icon for a record, and then in the Developer Toolbar, click Edit Page 5.

2.	You want to create two validations. The first validation is to ensure that the Project field is not null.
	
	In the page designer, click the Processing tab.
Right-click Validating and select Create Validation.

3.	In the property editor:
	- Identification > Name: Enter Project is not null
	- Validation > Type: Select Item is NOT NULL
	- Validation > Item: Select P5_PROJECT (In my case I used P4_PROJECT, because it was page 4)
	- Error > Error Message: Enter Project is not null!
	- Error > Display Location: Select Inline in Notification

4.	You need to create another validation to ensure that the value entered for Cost should be only numeric.
Under Processing, right-click Validating and select Create Validation.

5.	In the property editor:
	- Identification > Name: Enter Cost should be numeric
	- Validation > Type: Select Item is numeric
	- Validation > Item: Select P5_COST
	- Error > Error Message: Enter Cost should be numeric
	- Error > Display Location: Select Inline with Field
	- Error > Associated Item: Select P5_COST
      
      Click Save.
6.	Now, you can test to verify if the validations work. Navigate to the application run time environment.

	In the navigation menu, click Project Budget Report.
	
	Then, click Create.

7.	In the Project Budget dialog, enter the following and then click the Create button.
	- Task Name: Prepare requirements doc
	- Start Date: 11/2/2019
	- End Date: 11/25/2019
	- Status: Open
	- Assigned To: Pam King
	- Cost: abcd12
	- Budget: 3000

	Notice that the errors are displayed.
Click Cancel.

8.	Navigate to Page Designer.

	Under Rendering, select P5_COST and P5_BUDGET.
	
	In the property editor, for Settings > Number Alignment, select Left.

	Click Save.

9.	Navigate to the application run time environment.

	In the navigation menu, click Project Budget Report.

	Then, click the edit icon for any project.
	
	In the Budget form, now you see that the values in the Cost and Budget fields are left-aligned.


**Submission requirements:** Please submit an MS Word or PDF file with your screenshots. 