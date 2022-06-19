# COSC 304 - Introduction to Database Systems<br>Lab 10: Project Completion

## Unit 15: Creating and Using Dynamic Actions and Plug-ins

This exercise includes nine hands-on-labs. HOL 15-1 through 15-8 use the Demo Projects   application.

### HOL 15-1 Creating and Using a Dynamic Action on the Maintain Project Page: 
In this lab, you add a dynamic action on the Maintain Project page to show or hide the Completed Date based on the value of Status.

### HOL 15-2 Creating and Using a Dynamic Action on the Maintain Task Page: 
In this lab, you add a dynamic action on the Maintain Task page to populate the Due Date whenever the Milestone is changed.

### HOL 15-3 Creating and Using Dynamic Actions on the Project Tree Page: 
This lab covers creating two buttons that you use to expand and contract the project tree nodes. You create a dynamic action on each of these buttons. Then, for each of the button, you set the action as defined by the dynamic action.

### HOL 15-4 Creating and Using a Plug-in: 
In this hands-on lab, you create a copy of the Badge List Plug-in from the Sample Charts packaged app. Then, on the Reports page, you create a badge list region. On this region, you display three different badges: Open Projects, Upcoming Milestones, and Open Tasks.

### HOL 15-5 Adding Additional Reports: 
In this lab, you clean up the Dashboard page by moving two regions as separate pages. Later, you add in new regions to the Dashboard page.

### HOL 15-6 Updating the Reports Page: 
In this lab, you add new components to the Reports page of the Demo Projects application.

### HOL 15-7 Updating the Dashboard Page: 
In this lab, you update the Dashboard page of the Demo Projects application. The Dashboard should display the Project Status chart, Upcoming Milestones report and Incomplete Tasks.

### HOL 15-8 Updating the Home Page: 
In this lab, you update the navigation menu of the Demo Projects application and also update the List region on the Home page.

### HOL 15-9 Making the Music Video Report Searchable: 
In this lab, you use the APEX and REST application that you created in HOL 11-2. You expand the music video report and make it dynamically searchable.

+++++++++++++

### HOL 15-1: Creating and Using a Dynamic Action on the Maintain Project Page

On the Maintain Project page, the Completed Date field is displayed irrespective of the value of
Status. In this lab, you add a dynamic action on the page to show or hide the Completed Date based on the value of Status.

1.	Navigate to App Builder and click the `Demo Projects` application.

2.	In the Demo Projects application home page, click `Shared Components`.


3.	You want to create a dynamic LOV for Status. Under Other Components, click `List of Values`.

4.	Click `Create`.

5.	Accept the default for Source and click Next.

6.	For Name, enter `Status`, and click `Next`.

7.	In List of Values Source, for Source Type select SQL Query, and for Query, copy and paste the following SQL:

	```
select description d, cd r
from demo_proj_status
order by display_order
   ```   

	Click `Next`.

8.	In Column Mappings, Select R for Return Column and click Create.

	In the Application Express toolbar, click `Run Page <n>`.

9.	In the Demo Projects application runtime environment, click Projects in the navigation menu.

      Then, in the interactive report, select a project name with status as IN-PROGRESS or 
      ASSIGNED.

      In the dialog page, for Status, select each of the values Assigned, Completed, and In-Progress. 

      Notice that the Completed Date field is displayed irrespective of the status.

      You want to create a dynamic action that will allow the display of the Completed Date field only if the status is *Completed*.

  In the Developer toolbar, click `Edit Page 5`.

10.	In the page designer, expand `Regions > Project > Items`.

	Right-click the `P5_STATUS_CD` item and select `Create Dynamic Action`.

11.	In the property editor:

	- Identification > Name: Enter `Show Completed Date`
	- Client-side Condition > Type: Select `Item = Value`
	- Client-side Condition > Value: Enter `COMPLETED`

	**Note:** The capitalization and spelling of the value must match the data entry value exactly in order for the dynamic action to fire.

12.	In the Rendering tree, under the Show Completed Date dynamic action, expand the `True` node and select `Show`.

In the Property Editor, for Item(s) select `P5_COMPLETED_DATE`.

13.	Right-click `Show` and select `Create Opposite Action`.

14.	Notice that the opposite action is created now. The Completed Date field will be hidden if the Status includes a value other than COMPLETED.

	Click `Save`.

15.	Now, you can verify to see if the dynamic action works as expected.

	Navigate to the Demo Projects application runtime environment. If the Maintain Project dialogue is open, click `Cancel`.

	In the navigation menu, click `Projects` and then in the report, click any project name with the Status COMPLETED.

	Notice that the Completed Date field is displayed.

16.	In the Maintain Project dialogue, for Status, select either Assigned or In-Progress.

	Notice that this time, the Completed Date field is hidden.

	Click the `Cancel` button.

### HOL 15-2: Creating and Using a Dynamic Action on the Maintain Task Page

In this hands-on lab, you add a dynamic action on the Maintain Task page to populate the Due Date whenever the Milestone is changed.

1.	In the Demo Projects application runtime environment, click `Tasks` in the navigation menu.

2.	In the interactive report, click the Edit icon for a task name.

3.	In the Developer Toolbar, click `Edit Page 9`.

	On this page, you want to populate the Due Date whenever the Milestone is changed. In order to achieve this, you will use a Dynamic Action with an action of Set Value, which can execute an AJAX call to retrieve data from the database.

4.	Under Rendering > Regions > Maintain Task, expand items.

	Right-click `P9_MILESTONE_ID` and select `Create Dynamic Action`.

5.	For the new Dynamic Action, in the Property Editor, for Name enter Get Due Date.

6.	In the Rendering tree, under the P9_MILESTONE_ID item, select the Action under the True node (currently labeled X Show).

	In the Property Editor:
	- Identification: Action - select Set Value
	- Settings: Set Type - select SQL Statement
	- Settings: SQL Statement - copy and paste the following code:

	```
select due_date
from demo_proj_milestones
where id = :P9_MILESTONE_ID
	```

	- Settings: Items to Submit - select `P9_MILESTONE_ID`

	Click `Save`.

7.	Navigate to Demo Projects application runtime environment.

	In the navigation menu, click `Tasks`.

	In the interactive report, click the Edit icon for a task with milestones.


8.	Try selecting different values for Milestone to see how the Due Date is updated based on the selection.

### HOL 15-3: Creating and Using Dynamic Actions on the Project Tree Page

In this lab, you update the Project Tree page that you created in HOL 14-6. You add two buttons: Collapse All and Expand All. You use them to expand and contract the project tree nodes. You also create a dynamic action on each of these buttons. Then, for each of the buttons, you set the action as defined by the dynamic action.

1.	Navigate to Demo Projects application runtime environment. In the navigation menu, under Reports, click `Project Tree`.

	In the Developer Toolbar, click `Edit Page <n>`.

2.	Now, to expand and collapse the project tree nodes, you want to create Expand All and Collapse All buttons on the Project Tree button. These buttons’ actions are defined by dynamic actions.

	Under Rendering, expand `Regions > Breadcrumb`.

	Right-click `Breadcrumb` and select `Create Button`.

3.	In the Property Editor:

	- Identification > Button Name: Enter `CONTRACT_ALL`
	- Identification > Label: Enter `Collapse All`
	- Layout > Button Position: `Select Edit`

4.	In the Property Editor, for Behavior > Action: Select `Defined by Dynamic Action`.
Under Appearance, click `Template Options` button.

5.	Deselect the `Use Template Defaults` check box and click `OK`.

6.	Now, right-click the `CONTRACT_ALL` button and select `Duplicate`.

7.	In the Property Editor:

	- Identification > Button Name: Enter EXPAND_ALL
	- Identification > Label: Enter `Expand All`
	- Layout > Button Position: Select `Edit`
	- Behavior > Action: Select `Defined by Dynamic Action`

	Under Appearance, click `Template Options` button. Make sure the `Use Template Defaults` check box is deselected and click `OK`.

8.	Now you want to create a dynamic action for each of these two buttons.

	Under Rendering, expand Regions > Breadcrumb > Region Buttons.

	Right-click the `CONTRACT_ALL` button and select `Create Dynamic Action`.

9.	In the property editor, for Identification > Name, enter `CONTRACT_ALL`.

10.	Under Rendering, navigate to the `CONTRACT_ALL` region button and expand Dynamic Actions. Select `Show`.

	In the property editor, for Identification > Action, select `Collapse Tree`.

	For Affected Elements > Selection Type, select `Region`.

	For Affected Elements > Region, select `Project Tree`.

11.	Under Rendering, expand Regions > Breadcrumb > Region Buttons.

	Right-click the `EXPAND_ALL` button and select `Create Dynamic Action`.

12.	In the property editor, for Identification > Name, enter `EXPAND_ALL`.

13.	Under Rendering, navigate to the EXPAND_ALL region button and expand Dynamic Actions. Select `Show`.

	In the property editor, for Identification > Action, select `Expand Tree`.

	For Affected Elements > Selection Type, select `Region`.
	
	For Affected Elements > Region, select `Project Tree`.

14.	Click `Save and Run Page`.

15.	The project tree is now displayed in collapsed mode. Click the `Expand All` button.

16.	The project tree is expanded now. Click the `Collapse All` button.

17.	In the Developer Toolbar, click `Application < n >`.


### HOL 15-4: Creating and Using a Plug-in

In this hands-on lab, you create the Badge List Plug-in as a copy of the plug-in from the Sample Charts application. On the Reports page, you create a badge list region. On this region, you display three different badges: Open Projects, Upcoming Milestones, and Open Tasks.

1.	Install the Sample Charts application so that you can subscribe to the badge list plug-in.
Navigate to App Builder and click `App Gallery > Sample Apps`.

2.	Click `Sample Charts`.

3.	Click `Install App`.

4.	Accept the default authentication and click `Next`.

5.	Click `Install App`.

6.	The Sample Charts application is now installed.

	Click ``App Builder.

7.	In the report, select `Demo Projects` application.

8.	In the application home page, click `Shared Components`.

9.	Under Other Components, click `Plug-ins`.

10.	In the Plug-ins page, click `Create`.

11.	For Create Plug-in, select `As a Copy of an Existing Plug-in` and click `Next`.

12.	For Copy From Application, select `< xxx >Sample Charts` and click `Next`.

13.	At the bottom of the page, click the `Deselect All` button.

14.	Now, for Badge List, select `Copy and Subscribe`.

	Then, click `Copy Plug-ins`.
	
15.	In the Application Express toolbar, click `Edit Page <n>`.	

16.	In the page finder, enter the `Reports` *page number* and click `Go`.

17.	Use Page Designer's drag-and-drop functionality to quickly add a Badge List from the Gallery to the Layout.

	In Page Designer, within the Gallery (directly below the Layout), click `Regions`, and locate `Badge List`.

	Click and hold `Badge List [Plug-In]` and drag it into `Content Body`. It should appear as a darkened tile before you drop it into place.

	**Note:** When you drag the region up, and hover over the small yellow section, below Content Body, the yellow section will expand. A darker yellow section, with a black box around it, will indicate where the region will be placed.

18.	In the Property Editor:

	- Identification: Title - enter `Summary`
	- Source: SQL Query - copy and paste the following:

	```
select 'Open Projects' label
, count(*) value
, 'f?p='||:APP_ID||':4:'||:APP_SESSION||':::::' link
from demo_projects 
where status_cd != 'Completed'
UNION ALL
select 'Upcoming Milestones' label
, count(*) value
, 'f?p='||:APP_ID||':4:'||:APP_SESSION||':::::' link
from demo_proj_milestones
where due_date > sysdate
UNION ALL
select 'Open Tasks' label
, count(*) value
, 'f?p='||:APP_ID||':4:'||:APP_SESSION||':::::' link 
from demo_proj_tasks
where is_complete_yn = 'N'
	```

	**Note:** This query has three sub-queries, separated by UNION ALL that will be displayed as three separate badges within the region.

19.	In the property editor, navigate to Appearance and click Template Options.

20.	In the Template Options dialog, select the `Remove Body Padding` check box.

	For Header, select `Hidden but accessible`.

	Click `OK`.

21.	In the Rendering tree, under the Summary region, click Attributes.

	In the Property Editor:
	- Settings: Top Label - select `LABEL`
	- Settings: Value - select `VALUE`

	For Link Target, click `No Link Defined`.

22.	In the Link Builder – Link Target dialog, select URL for Type. For URL, enter `&LINK`.

	Click `OK`.

	**Note:** When you enter `&LINK`. ensure you include the period.

23.	Click `Save and Run Page`.

24.	In the Developer Toolbar, click `Application < n >`.

















