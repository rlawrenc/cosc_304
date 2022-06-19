# COSC 304 - Introduction to Database Systems<br>Lab 10: Project Completion

### Unit 11: Implementing Navigation in your Application

This hands-on lab includes two sections. In HOL 11-1, you implement navigation in the Demo Projects application.

Breadcrumbs are very common within Web applications, allowing users to traverse from the current page to a parent page easily. Use of the Back button is discouraged within Web applications, as this operation may display old ("stale") information to the user. This hands-on lab covers updating the breadcrumb entries for the following pages:

- Demo Proj Team Members
- Demo Projects
-	Demo Proj Milestones
-	Demo Proj Tasks

The Navigation Menu is defined as a list within Shared Components. In this hands-on lab, you update the Navigation Menu entries and include icons for each entry.

Oracle APEX enables you to create applications that integrate data from local Oracle Database tables and remote data sources. These remote data sources can be simple HTTP data feeds, OAuth2 or Basic Authentication–protected resources, REST services provided by Oracle REST Data Services, or even Oracle cloud applications (SaaS) REST services. In HOL 11-2, you build an application that uses the iTunes Search API, which requests via HTTP, returns the results in JSON, and parses the results before further manipulating the results via SQL postprocessing.

#### HOL 11-1: Implementing Navigation in your Application
In this hands-on lab, you update breadcrumb entries for the pages in the Demo Projects application. You also update the Navigation Menu entries and add icons for each entry.

1.	Navigate to App Builder and run the Demo Projects application.
In the navigation menu, click Demo Proj Team Members.
In the Developer Toolbar, click Edit Page 2.

2.	Update the page properties from Demo Proj Team Members to Team Members. In the Property Editor:

	-	Identification: Name - enter Team Members
	-	Identification: Title - enter Team Members

	Click Save.            

3.	Update the breadcrumb entry for the page.

	a) In the Rendering tree, click the Page Shared Components tab.

	b) Expand the Breadcrumbs node and click the Breadcrumb entry.

	c) In the Property Editor, click the Edit Component button.

4.	Click DEMO\_PROJ\_TEAM\_MEMBERS in the breadcrumb entry.

5.	For Short Name, enter Team Members and click Apply Changes.

6.	To return to page designer, on the toolbar, click Edit Page 2.

7.	The navigation menu is still displayed as Demo Proj Team Members. Update the Navigation Menu entries and include icons for each entry.

	In the page designer, click the Shared Components icon in the toolbar (not the page shared components).

8.	Under Shared Components, locate Navigation and click Lists.

9. In the Lists report, click Desktop Navigation Menu.
	
10.	Click DEMO\_PROJ\_TEAM\_MEMBERS.

11.	On the DEMO_PROJ_TEAM_MEMBERS list entry, locate the Image/Class item. Click at the end of the field to display a list of images.

12.	Review the library of images, provided by Font APEX. These images can be utilized throughout the application to improve aesthetics and provide a visual indicator, rather than just text.
	Locate and select fa-users.


13.	For List Entry Label enter Team Members.

	Click the Next button (>).

14.	On the DEMO_PROJECTS list entry, for Image/Class enter fa-folder, and for List Entry Label enter Projects.
Click the Next button (>).

	Note: You can simply type in the image name, such as fa-folder, directly into the Image/Classs field, rather than bringing up the library of images.

15.	On the DEMO_PROJ_MILESTONES list entry, for Image/Class enter fa-flag, and for List Entry Label enter Milestones.

	Click the Next button (>).

16.	On the DEMO_PROJ_TASKS list entry, for Image/Class enter fa-check-square-o, and for List Entry Label enter Tasks.

	Click Apply Changes.

17.	Click Run on the toolbar to see the updated navigation menu.

	You still need to update the icon for the Dashboard.
	Navigate to Shared Components > List Details page and click Dashboard.
	
18.	For Image/Class enter fa-dashboard.

	Click Apply Changes.

19.	Click Run on the toolbar to see the updated navigation menu.

20.	In step 3 above, you updated the breadcrumb entry for Team Members page. Now, update the breadcrumb entries for all of the remaining pages. Perform the following steps:

	a) In the Developer Toolbar, click Edit Page 1.

	b) Click Shared Components.

	Under Navigation, click Breadcrumbs.

	d) Click Breadcrumb.

	e) Now, click DEMO_PROJECTS.

	f) Enter Projects for Short Name and click Apply Changes.

	g) Then, click DEMO_PROJ_MILESTONES.

	h) Enter Milestones for Short Name and click Apply Changes.

	i) Click DEMO_PROJ_TASKS.

	j) Enter Tasks for Short Name and click Apply Changes.

21.	Click Run on the toolbar.

22.	Click each of the pages: Projects, Milestones and Tasks to see the updated region titles.

23.	Now, update the page properties and the breadcrumb entry for the Projects page. In the navigation menu, click Projects.

	In the Developer Toolbar, click Edit Page 4.

24.	In the Property Editor:

	- Identification: Name - enter Projects
	- Identification: Title - enter Projects
	Click Save.

25.	Now, update the page properties for the Demo Proj Milestones page.

	In the navigation menu, click Milestones.
	In the Developer Toolbar, click Edit Page 6.


26.	In the Property Editor:

	- Identification: Name - enter Milestones
	- Identification: Title - enter Milestones

	Click Save.

27.	Now, update the page properties and the breadcrumb entry for the Demo Proj Tasks page. In the navigation menu, click Tasks.
	
	In the Developer Toolbar, click Edit Page 8.

28.	In the Property Editor:

	- Identification: Name - enter Tasks
	- Identification: Title - enter Tasks

	Click Save.

29.	Now, run the application. You need to update the Home page. Click Edit Page 1 in the Developer Toolbar.

30.	In the Page Designer, click Page Shared Components.

31.	Expand Lists and click Page Navigation.

32.	In the Property Editor, click Edit Component.

33.	Now, you need to edit each of the list entries. First, click DEMO\_PROJ\_TEAM\_MEMBERS.

34.	Replace the text in the List Entry Label with Team Members and click >.

35.	Replace the text in the List Entry Label with Projects and click >.

36.	Replace the text in the List Entry Label with Milestones and click >.

37.	Replace the text in the List Entry Label with Tasks and click Apply Changes.

38.	Click Run Page 1 icon on the toolbar to see the updated Home page.


#### HOL 11-2: Integrating Application Data from Remote Data Sources

Oracle APEX allows you to build powerful, feature-rich applications against remote, web, and REST data sources. In this lab, you build a web application on top of the Apple iTunes Search API, which is a simple API over HTTP that takes input arguments via parameters in the URL. First, you create a report against the iTunes music video catalogue. Next, you simplify the report to include a preview of the music video and a link to watch a clip of the music video.

1.	Navigate to App Builder and click Create.

2.	Click New Application.

3.	Enter APEX and REST for Name and click Create Application.

4.	On the Application home page, click Shared Components.

5.	Under Data Sources, click Web Source Modules.

6. Click Create. 

7.	Select From Scratch and click Next.

8.	For Web Source Type accept the default selection of Simple HTTP. Enter iTunes Search for Name, and for URL End Point, copy and paste the URL [https://itunes.apple.com/search](https://itunes.apple.com/search) Click Next.

9.	Oracle APEX parses the into its Base URL and Service URL path. 

	Click Next.

10.	You do not need authentication for this API. Accept the default selection of No and click Advanced.

11.	For Parameters, select the following and click Discover.

	- Parameter Type: Query String Variable, Parameter Name: term, Value: beyonce, Is Static: No
	- Parameter Type: Query String Variable, Parameter Name: entity, Value: musicVideo, Is Static: Yes

12.	Oracle APEX invokes the REST API and attempts to parse the results and creates a data profile. Click the Data Profile subtab to view the entities parsed from the JSON result and see how they will be mapped to specific column names and data types. 

13.	Click Create Web Source.

14.	Click the Application <n> breadcrumb.

15.	Click Create Page.

16.	Click Report. Then, click Classic Report.

17.	Enter iTunes for Page Name and click Next.

18.	Select Create a new navigation menu entry and click Next.

19.	For Data Source, select Web Source. Then select iTunes Search for Web Source Module. Click Create.

20.	Click Create.


21.	You are now the page designer. Click Save and Run Page. Log in to the application using your Workspace Username and Password. 

	In the Developer Toolbar, click Edit Page <n>.

22.	Under Rendering, select Report1.
In the Property Editor, for Local Processing, select SQL Query.

23.	In the SQL Query region, replace the existing SQL with the following SQL: 

	```
	select ARTISTNAME,
          TRACKNAME,
          PREVIEWURL,
          ARTWORKURL100,
          COLLECTIONPRICE,
          RELEASEDATE,
          COUNTRY,
          CURRENCY
     from #APEX$SOURCE_DATA#

	```
	
24.	In the Property Editor, under Appearance, select Blank with Attributes for Template.

25.	Under Rendering, navigate to Report1 and expand Columns.

26.	Select each of the columns and adjust their corresponding Heading in the property editor.

	- ARTISTNAME: Artist
	- TRACKNAME: Track
	- COLLECTIONPRICE: Price
	- RELEASEDATE: Release Date

27.	Select CURRENCY and in the Property Editor, under Identification > Type, select Hidden Column.

28.	Select ARTWORKURL100 and in the Property Editor, under Identification > Type, select Hidden Column.

29.	Select the PREVIEWURL column. In the property editor, for Heading, replace the existing text with Preview. 
Under Identification > Type, select Link.

30.	In the property editor, navigate to Link region and click No Link Defined for Target. 

31.	In the Link Builder – Target dialog, select URL for Type. 
In the URL attribute, enter #PREVIEWURL#. This will create an HTML anchor to the value of the Preview URL returned in the REST results. 
	
	Click OK.

32.	For Link Text, enter \<img src="#ARTWORKURL100#"/>. This will display the image returned in the value of the Artwork column in the REST results.

33.	For Link Attributes, enter target="_new". This will cause the video preview to open in a new browser tab when clicked.

34.	Under Rendering, navigate to Report1 > Columns and select COLLECTIONPRICE. In the property editor, for Column Formatting > HTML Expression enter #COLLECTIONPRICE# #CURRENCY#.

35.	Click Save and Run Page.

36.	Your application now includes a much-better-looking report, with an image of the video preview. Additionally, if you click the image, it should open a new tab in your browser and start playing the video.




