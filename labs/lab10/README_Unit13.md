# COSC 304 - Introduction to Database Systems<br>Lab 10: Project Completion

## Unit 13: Implementing Security in your Application

Application security is very important in most applications, except for "Public" applications. You must ensure users enter valid credentials, generally username and password (Authentication), and that once logged in, each user has appropriate rights within the application (Authorization).
This exercise includes three hands-on labs.

- HOL 13-1 uses the Demo Projects application.
- HOL 13-2 and 13-3 use the Budget App application.


### HOL 13-1 Creating and Using an Authorization Scheme: 
In this lab, you create an authorization scheme to ensure only people entered as Team Members can log into the Demo Projects application. You also create a user and verify if the user can access the application.

### HOL 13-2 Creating and Using an Authentication Scheme: 
In this hands-on lab, you create an Open Door Credentials authentication scheme and make it current. You test the authentication scheme and switch back to the default Application Express Authentication scheme.

### HOL 13-3 Controlling User Access by Using the Access Control Administration: 
In this hands-on lab, you create three different users Administrator, Developer and End User. You create an Access Control Administration page, set the application mode to restrict access and add these users to the Access Control list. Finally, you apply the authorization scheme to pages and verify if users are allowed or denied access.

++++++++++

### HOL 13-1: Creating and Using an Authorization Scheme

In this hands-on lab, you create an authorization scheme to ensure only people entered as Team Members can log into the Demo Projects application. You apply the authorization scheme to the application properties.

1.	Navigate to App Builder and run the Demo Projects application.
In the Developer Toolbar, click Application < n >.

2.	On the application home page, click Shared Components.

	Under Shared Components > Security, click Authorization Schemes.

3.	Click Create.

4.	For Create Authorization Scheme, select From Scratch and click Next.

5.	For Details, input the following:
	- Name - enter Team Members
	- Scheme Type - select Exists SQL Query
	- SQL Query - copy and paste the following:

	```
	select 1
	from demo_proj_team_members
	where upper(username) = upper(:APP_USER)
	```
	
	- Identify error message displayed when scheme violated - enter. You must be a team member to use this application.

	Click Create Authorization Scheme.

	**Note:** :APP\_USER is a built-in application item that returns the username of the currently logged-in user.

6.	The Team Members authorization scheme is created now.

	Rather than applying the authorization scheme to every page, apply the scheme to the application properties.
	
	Click the Shared Components breadcrumb entry.

	Alternatively, click the Shared Components button on the toolbar, which is located in the top-right and contains a triangle, circle, and square in its icon.

7.	Under Security, click Security Attributes.

8.	Click the Authorization tab.

	For Authorization Scheme, select Team Members from the list.

	Click Apply Changes.

9.	 To test the authorization scheme, creating a new user account is necessary.

 	**You must use the Administrator's account for your lab account on iacademy.oracle.com in the assignment:** `CA\A637\SQL\Snn\ADMIN`. 
	The password is the same as you have for your main student account (`See Canvas`).
 
	In the Application Express toolbar, click Administration, identified by a user icon with a spanner, then select Manage Users and Groups.

10.	Click Create User.

	To create a user, input the following:

	- Username - enter unauthorized
	- Email Address - enter unauthorized@email.com
	- Password - enter unauthorized
	- Confirm Password - enter unauthorized
	- Require Change of Password on First Use - select No

	Click Create User.

11.	Navigate to the runtime environment (tab or window). Click Sign Out in the navigation bar (top right).

12.	On the Log In page, for Username, enter unauthorized, and for Password, enter unauthorized.
Click Sign In.

13.	Verify the access denied message is displayed.
	Click OK.

14.	On the Log In page, enter your username and password credentials that you use to log into the App Builder.

	Click Log In.


### HOL 13-2: Creating and Using an Authentication Scheme

In this hands-on lab, you create an authentication scheme named Open Door Credentials in the Budget App application. Upon creation, this scheme becomes the Current Scheme by default. You test this scheme by logging in to the application. Finally, you switch back to the Application Express Authentication scheme.

1.	In the App Builder, click the Budget App application.

2.	Navigate to Shared Components.
Under Security, click Authentication Schemes.

3.	You want to create an authentication scheme. Click Create.

4.	For Create Scheme, make sure Based on a pre-configured scheme from the gallery is selected, and click Next.

5.	For Name, enter Open Door Credentials.
For Scheme Type, select Open Door Credentials from the list.

	Click Create Authentication Scheme.


6.	In the toolbar, click the Run Page icon.
If you are already logged in, click Sign Out to perform the next step.

7.	Enter your Username and click Login.

8.	The Home page is displayed.

	Your application might display the Vita (Copy) Theme Style. Click the Customize link at the bottom of the page, select Vita for Theme Style and click Apply Changes.

	In the Developer Toolbar, click Application< n >.

9.	You want to switch back to the Application Express Authentication scheme.

	On the application home page, click Shared Components.

10.	Under Security, click Authentication Schemes.

11.	Click Application Express Authentication in the report.

12.	Click Make Current Scheme.

13.	Click OK.

14.	The Application Express Authentication scheme is now activated as the current authentication scheme.


15.	In the toolbar, click the Run Page icon. Then, click Sign Out.

16.	Notice that the authentication scheme has changed. Enter your username and password and click Sign In.


### HOL 13-3: Controlling User Access by Using the Access Control Administration

In this hands-on lab, you first create an access control page and set the application mode to restrict access. Then, you create the access control list and assign the Budget App application components to an authorization scheme.

**Notes:** You must use the Administrator's account for your lab account on iacademy.oracle.com in the assignment: CA\_A637\_SQL\_Snn\_ADMIN. The password is the same: <same password – see Canvas>.

1.	If you are in the application runtime environment, switch to the window or tab for the App Builder environment.

2.	In the Application Express toolbar, click Administration and select Manage Users and Groups.

3.	Create the following users to add to the Access Control List.

	- apex_admin: Workspace Administrator
	- apex_dev: Developer
	- apex_user: End User

	Click Create User.

4.	Enter the following information and click Create and Create Another.

	- Username: apex_admin
	- Email Address: <<your@email.address>>
	- Select Yes for User is a workspace administrator
	- Password: apexadmin123$
	- Confirm Password: apexadmin123$
	- Select No for Require Change of Password on First Use.


5.	Enter the following information and click Create and Create Another.


	- Username: apex_dev
	- Email Address: <<your@email.address>>
	- Select No for User is a workspace administrator
	- Select Yes for User is a developer
	- Password: apexdev123$
	- Confirm Password: apexdev123$
	- Select No for Require Change of Password on First Use.



6.	Enter the following information and click Create User.

	- Username: apex_user
	- Email Address: <<your@email.address>>
	- Select No for User is a workspace administrator
	- Select No for User is a developer
	- Password: lowcode123$
	- Confirm Password: lowcode123$
	- Select No for Require Change of Password on First Use.

7.	You see users in the list now. Click App Builder.

8.	In the report, click the Budget App application.

9.	You must first remove the feature that already exists in this application. You must remove the existing page(s), shared components and Feature: Access Control build option. Perform the following steps:

	a)	Go to Shared Components

	b)	Go to Application Logic > Build Options.

	c)	Click Feature: Access Control.

	d)	Click Remove Components.

	e)	Click the checkbox for Yes – remove components.

	f)	Click Remove Components.

	g)	On Create / Edit Build Option, Click Delete.

	h)	Click Delete Build Option.

	i)	Click the `Application <n>` link to navigate to the application home page.

10.	On the application home page, click Create Page.

11.	Select Feature.

12.	Select Access Control for Page Type.

13.	In the Create Access Control Pages dialog, enter / select the following:

	- Administration Page Preference: Create a new page
	- Administration Page Name: Access Control
	- Administration Page Navigation Preference: Create a new navigation menu entry
	- New Navigation Menu Entry: Access Control.

	Then, click Next.

14.	On the Confirmation page, click Create.

15.	In the Page Designer, click Save and Run Page.

16.	The Access Control page is displayed. Only users defined in the access control list may access this application.

17.	Now, add users to the access control list. You add the three users you created in a previous step and your workspace administrator username.

	- apex_admin is the administrator and so can modify anything, including the user privileges
	- apex_dev is the developer and is allowed to edit application data. However, this user cannot change the application administration settings
	- apex_user is the end-user and can only view the application but cannot make any changes to the data
	- < your username > is the administrator.
Click Users.

18.	Click Add User.

19.	Enter apex_admin for Username, select Administrator for Role and click Add User.

20.	Click Add User again.

	Enter apex_dev for Username, select Contributor for Role and click Add User.

21.	Click Add User again.

	Enter apex_user for Username, select Reader for Role and click Add User.

22.	Notice that < your username > is already listed as Administrator. You can now close the dialogue.

23.	Now, you are ready to define and apply the authorization schemes to each application component.

	- Users with the Administrator privilege can make any changes, including administering the Budget App application
	- Users with the Contributor privilege can modify the data in the report but cannot make changes to the application mode and the access control list.
	- Users with the Reader privilege can review the interactive report but cannot modify the data.

      In the application runtime environment, click Project Budget Report in the navigation menu.
      In the Developer Toolbar, click Edit Page 2.


24.	Under Rendering, expand Regions. Under the Project Budget region, select Attributes.

	In the property editor, locate Authorization Scheme and ensure that Contribution Rights are selected from the list.


25.	You want the Create Button to appear only if the user has either the Contributor or Administrator role. Under Rendering, locate Region Buttons and select CREATE.
In the property editor, navigate to Security and ensure that Contribution Rights is selected for Authorization Scheme.
Click Save.


26.	You also want to protect against direct access to the Project Budget form dialogue page. Though you restrict end-users from editing the interactive report on the Home page, they can still access the Project Budget form page by entering the correct URL in the browser. To avoid this, you must restrict the Form page access to only users with the Contributor and Administrator roles.
      
      In the page designer, click Navigate to Next Page arrow in the toolbar.
      
      You are now viewing the Project Budget form page in the page designer.

27.	Under Rendering, select Page 5: Project Budget.

	In the Property Editor, navigate to Security and ensure Contribution Rights is selected for Authorization Scheme.

	Click Save.

28.	In the page designer, enter 4 in the Page Finder and click Go.

29.	In the page designer, click Save and Run Page.

	If logged in, click Sign Out before performing the next step.

30.	Enter apex_dev for Username and apexdev123$ for Password and click Sign In.

31.	In the navigation menu, click Project Budget Report.

	Notice that apex_dev can edit the interactive report and create a new project.

32.	In the navigation menu, click Access Control.

33.	Notice that you receive an error as you need the Administrator privilege to use the Access Control Administration page.

	Click OK.

34.	Click Sign Out.

35.	Now sign in by entering apex_user for Username and lowcode123$ for password.

36.	In the navigation menu, click Project Budget Report. Notice that you cannot edit the interactive report and also cannot create a new project now.

37.	Click Sign Out.

38.	Now sign in by entering apex_admin for Username and apexadmin for password.

39.	In the navigation menu, click Budget.

40.	Notice that you can now edit the interactive report and create a project.
In the navigation menu, click Access Control.

41.	As you have the Administrator privilege, you can access the Access Control Administration page.
In the Developer Toolbar, click Application< n >.











