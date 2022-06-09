# COSC 304 - Introduction to Database Systems<br>Lab 7: Building a Database-enabled Web Site using APEX

**The sample code for these examples is in Canvas/Modules/Oracle APEX PPTX and Oracle Application Express: Developing Database Web Applications: Hands-On-Labs Guide folders.**

## Unit 1: Getting Started with Oracle Application Express (see 'hol01GettingStarted.docx' in Canvas/Modules)

To log in to Oracle Application Express, you need a Workspace name, username, and the password created for that Workspace (see the account information in Canvas). In this hands-on Unit 1, you log in to your  Oracle  Application  Express  Workspace.  Once logged in,  you navigate through the major components of Oracle Application Express. This Unit also covers installing and running a packaged application.1. Log in to Oracle Application Express Workspace. Perform the following steps:	a) Open your browser and enter the URL to sign in to the Application Express development environment.  You can access the  Oracle  Application  Express application with the URL: HTTPS://< hostname >:< port >/apex. Alternatively, if you have already signed up for a free Workspace on apex.oracle.com, use the URL: [https://iacademy.oracle.com](https://iacademy.oracle.com), then click the Sign In button (top right).	b) The login page appears. Enter the Workspace name, username, and password. Click Sign In. You may be prompted to change your Workspace password the first time you log in. This option is set when your username and password are created by the  Oracle  Application  Express administrator.  You can set your new password to be the same as your old password.

2. The Workspace home page appears. Click App Builder (top left).
3. You do not have any applications listed right now. You can either create a new app or install a sample or productivity app. Review the components.
4. Click SQL Workshop. The SQL Workshop home page appears. Review each of the SQL Workshop components.
5. Click App Gallery.
6. The App Gallery page displays all of the Productivity and Sample applications. Click Sample.
7. Now, you want to install a packaged application. Click Sample Reporting.
8. Click Install App.
9. Accept the defaults and click Next.
10. Click Install App.
11. Click the Run button.
12. Log in to the Sample Reporting application. Enter your Username and Password (same as your Workspace credentials) and click Sign In.
13.  You now see the Sample Reporting application home page. In the Runtime Developer Toolbar, click Home.
14. Click App Builder.
15. Toggle between the View Icons and the View Report buttons. You see that applications are displayed along with their icons and in report format.


## Unit 2: Using SQL Workshop (see 'hol02UsingSQL_Workshop.docx' in Canvas/Modules)

This exercise includes two hands-on labs.1. HOL 2-1: Loading the Tables and Data: In this lab, you will use SQL Workshop to create the underlying database objects and data required for you to build the Demo Projects application.
2. HOL 2-2: Creating a Lookup Table: In this lab, you will create a tabled named HARDWARE and load data into the table. Then, you create a lookup table.

### HOL 2-1: Loading the Tables and DataIt is essential to have at least the tables defined in order the Create Application wizard to generate pages in your application. In this hands-on-lab, you create the required database objects and populate the tables with sample data.
1. Use SQL Workshop to upload a script that creates the tables for the Demo Projects application. Perform the following steps:

	a) Navigate to SQL Workshop and select SQL Scripts.
	
	b) Click Upload.

	c) Click Choose File.

	d) Navigate to the working directory where you extracted apex-course-labs.zip from Canvas/Modules. Locate the Project_Tables.sql file, double-click the file or click the file and then click Open. Click Upload.

	e) Review the uploaded script to see what tables will be created. In the SQL Scripts list, click the Edit icon (pencil), to the left of the script you just uploaded.    

	f) Click the Run icon to the right of the script you uploaded.

	g) Then, click Run Now.

	h) Scroll down to view the results of the script that you just ran.

2. Currently the tables you created do not have any data. A script has been provided that creates an Oracle database package which can be run at any time to insert or reset the data in the tables. Use SQL Workshop to upload a script that you can use to populate table data. Perform the following steps:

	a) Click SQL Scripts. Click Upload.

	b) Click Choose File, where you extracted apex-course-labs.zip.
	c) Locate the Project_Data.sql file, double-click the file or click the file and then click Open. Click Upload.
	d) Click the Run icon to the right of the script you uploaded (top row).

	e) Then, click Run Now.
	f) Scroll down, to view the results.

3. In step 2, you uploaded a package called DEMO\_PROJECTS\_DATA\_PKG. However, this package has not yet been run so the tables you created still do not have any data. The SQL Commands facility, within SQL Workshop, allows a developer to run any valid SQL commands. You will run a SQL command to execute the data package and populate the tables. Use SQL Commands to execute the Oracle Database package. Perform the following steps:	a) Click the Up arrow, before SQL Scripts.

	b) Click SQL Commands.

	c) Enter the following code:                        begin            demo_projects_data_pkg.load_sample_data;             end;	d) Click Run.

4. Use the Object Browser within SQL Workshop to review all of the database objects, such as the tables and packages you created, available in the underlying Oracle database schema which is associated with the Application Express workspace you logged into. Perform the following steps:	a) At the top of the page, select SQL Workshop and then select Object Browser.

	b) In Object Browser, select the DEMO\_PROJ\_TEAM\_MEMBERS table, and then Click on the Data tab.

	Note: There are a number of other tables listed, outside of those you created using the script file above. 

	c) To review the package you created, select Packages.

	d) Then, select DEMO\_PROJECTS\_DATA\_PKG.	e) Click Body to review the primary PL/SQL rather than the specification.


	Note: This package includes complex PL/SQL code to insert images and replicate users entering in records. It is not important that you understand the PL/SQL code in this package, as you will not normally have to populate data in this matter. Generally, you would create the tables with no data and then use the application you build to insert the records.


###HOL 2-2: Creating a Lookup TableIn this hands-on-lab, you use the Data Workshop utility to create a table and populate the table with data. Once this table is created, you also create a lookup table.1. Click SQL Workshop > Utilities > Data Workshop.
2. Click Load Data.
3. The Load Data Wizard appears. Navigate to the working directory where you have apex-course-labs.zip.4. Locate the hardware.csv file, and then drag and drop the file to the Load Data dialogue. Alternatively, in the Load Data dialogue, click Choose File, and then double-click the hardware.csv file. (**Load doesn't work with APEX in Cloud. Use script [hardware\_app\_tables.sql](APEX\hardware_app_tables.sql) to create tables and [hardware\_app\_data.sql](APEX\hardware_app_data.sql) to populate date in the tables. If you need to drop objects before recreating, please use [drop\_hardware\_objects.sql](drop_hardware_objects.sql)**)
5. (**Skip**) Enter Hardware for Table Name, accept the remaining defaults and click Load Data. Notice that the Error Table Name is populated.6. The new table is now created and is populated with the data. Click View Table or use the object browser.
7. In the Object Selection pane, click Hardware. The Detail pane now shows details about the Hardware table. For the Hardware table, review the column names and data types. Click Data. Now you see a report of the data contained in the Hardware table.8. You want to create a lookup table now. Perform the following steps:	a) Click Table. Click Create Lookup Table.

	b) 	(**Skip**) Select DEPARTMENT for Column (it's already created). Click Next.

	c) (**Skip**) Accept the defaults on this page and click Next.

	d) (**Skip**) Click Create Lookup Table.

	e) Review the table definition of DEPARTMENT_LOOKUP table.

	f) In the Object Selection pane, click HARDWARE. Review the table details. Notice that the DEPARTMENT column has been extracted from the HARDWARE table and is now available in the DEPARTMENT_LOOKUP table.







## [Lab 7 Assignment](assign/)

