# COSC 304 - Introduction to Database Systems<br>Lab 8 - Data Prediction, Forecasting, and Visualization

## ACME Company Goals

Your managers found the data analysis you performed previously very helpful in understanding their customers, products, and overall business. They have now started asking questions about not just the current state of the business, but future trends for use in long range planning. ACME Company has tasked you with several goals related to prediction and forecasting, specifically predicting their overall sales for the next few years and best selling products. The output of this analysis will be an Excel file called `304_lab8_analysis.xlsx`.

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

Performing predictions is easy in Excel. Once you have a data set loaded and selected, on the **Data** tab, in the **Forecast** group, click **Forecast** Sheet. An [example walkthrough written by Microsoft](https://support.microsoft.com/en-us/office/create-a-forecast-in-excel-for-windows-22c500da-6da7-45e5-bfdc-60a7062329fd) is available.

<img src="img/excel_forecast.png" width="200">

### Question 1: Predicting Company Sales (10 marks)

Let's go through the steps to predict the company sales for the next two years (2024, 2025). The initial query to retrieve the data is: 

```
SELECT YEAR(orderDate) as year, SUM(TotalAmount) as totalSales
FROM ordersummary
GROUP BY YEAR(orderDate)
ORDER BY YEAR(orderDate)
```
Connect to the database using Excel. Execute the query and load the data into Excel. Store data in sheet called `salesdata`. The output table should look like this:

<img src="img/excel_data_sales.png" width="500">

There are several ways to perform a prediction. Excel has a [**forecast** function](https://support.microsoft.com/en-us/office/forecast-and-forecast-linear-functions-50ca49c9-7b40-4892-94e4-7ad38bbeda99) that will predict an output value based on an input value and the prior data series points.

<img src="img/p1_q1_linear_forecast.png" width="500">

Another way is to create a graph and add a linear interpolation line.

A better way with more options is to use **Forecast Sheet**. Create a forecast sheet and rename it as `initialpredict` similar to shown below.

<img src="img/excel_sales_forecast.png" width="500">

The results of these two forecasts are sales in 2024 of **$762,127.98** and 2025 of **$851,584.09**. Completing this part is worth 4 marks.


Unfortunately, this prediction is not very accurate for several reasons. First, 2019 was only a partial year for sales starting in October. Similarly, the 2023 selling season is not complete with data only up to October. The *art* of making predictions comes from deciding what to do with incomplete, missing, or inaccurate data. Perform an updated prediction and save in the sheet `salesprediction`. Here are the assumptions:

1. 2019 data will not be used as it is incomplete.
2. 2023 data will be increased by 20% as there are still 2 months of sales. (Note: This estimate could be better as many retailers do a higher percentage of sales around Christmas.)
3. Generate an updated sales table and sales prediction for 2024 and 2025.

This second prediction is worth 6 marks.


### Question 2: Predicting Sales by Region (5 marks)

ACME Company wants to understand its sales by province (state). Generate a query that produces data with the overall sales by province for the years 2020 to 2023. Use this data to predict the sales by province for 2024. 

Excel has a nice visualization for displaying data on a map.

### Question 3: Predicting Top Product Sales (10 marks)

The goal is to predict the top 10 selling products in 2024 based on historical data from 2020 to 2023. The data table and visualization should be in a sheet called `productsales`.

How to do this ...

# Submission

Submit your Excel file on Canvas. Bonus marks are available for early review by the TA in a virtual office hours.
