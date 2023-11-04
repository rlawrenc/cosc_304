# COSC 304 - Introduction to Database Systems<br>Lab 8 - Data Prediction, Forecasting, and Visualization

## ACME Company Goals

Your managers found the data analysis you performed previously very helpful in understanding their customers, products, and overall business. They have now started asking questions about not just the current state of the business, but future trends for use in long range planning. ACME Company has tasked you with several goals related to prediction and forecasting, specifically predicting their sales for the next few years, best selling products, and customer growth. The output of this analysis will be an Excel file called `lab8_analysis.xlsx`.

### Connecting Excel and SQL Server

To read data into Excel from SQL Server, follow these steps:

1) Open Excel. Under the `Data` Menu, select `Get Data` then, `From Database`, then `From SQL Server Database`.

<img src="img/excel_getdata.png" width="500">

2) Enter `cosc304.ok.ubc.ca` for the server and `analysis` for the database. Select `Advanced options` and enter the SQL query that you want to perform. Click `OK`.

<img src="img/excel_query.png" width="500">

3) For authentication, select `Database` authentication. The user id is `cosc304`.

<img src="img/excel_user_pw.png" width="500" alt="User authentication">

4) Click the `Load` button to load the data into a worksheet.

## Part 1: Prediction and Forecasting (25 marks)

Performing predictions is easy in Excel. Once you have a data set loaded, created a visualization and select ...

### Question 1: Predicting Company Sales (10 marks)

Let's go through the steps to predict the company sales for the next two years (2024, 2025). The initial query to retrieve the data is: 

```SELECT YEAR(orderDate) as year, SUM(TotalAmount) as totalSales
FROM ordersummary
GROUP BY YEAR(orderDate)
ORDER BY YEAR(orderDate)
```
Connect to the database using Excel. Execute the query and load the data into Excel. The output table should look like this:

<img src="img/excel_data_sales.png" width="500">

Create a bar chart to display this data. To perform a prediction, add a linear interpolation to the chart as shown. By this metric, the predicted sales for 2023 is X and for 2024 is Y. Completing this part is worth 3 marks.

<img src="img/excel_data_chart.png" width="500">

Unfortunately, this prediction is not very accurate for several reasons. First, 2019 was only a partial year for sales starting in October. Similarly, the 2023 selling season is not complete with data only up to October. The *art* of making predictions comes from deciding what to do with incomplete, missing, or inaccurate data. Perform an updated prediction and save in the sheet `salesprediction`. Here are the assumptions:

1. 2019 data will not be used as it is incomplete.
2. 2023 data will be increased by 20% as there are still 2 months of sales. (Note: This estimate could be better as many retailers do a higher percentage of sales around Christmas.)
3. Generate an update sales table and sales prediction for 2024 and 2025.

This second prediction is worth 7 marks.


### Question 2: Predicting Sales by Region (5 marks)

ACME Company wants to understand its sales by province (state). Generate a query that produces data with the overall sales by province for the years 2020 to 2023. Use this data to predict the sales by province for 2024. 

Excel has a nice visualization for displaying data on a map.

### Question 3: Predicting Top Product Sales (10 marks)

The goal is to predict the top 10 selling products in 2024 based on historical data from 2020 to 2023. The data table and visualization should be in a sheet called `productsales`.

How to do this ...

# Submission

Submit your Excel file on Canvas. Bonus marks are available for early review by the TA in a virtual office hours.
