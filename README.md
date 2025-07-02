# Walmart-Sales-Analysis
📁 Project Structure
File	Description
project.ipynb	Python notebook used to clean data, perform exploratory analysis, and connect to MySQL
walmart_sql_1.sql	SQL file containing multiple analytical queries to derive business insights

🔧 Tools & Technologies
Python (Pandas, NumPy, MySQL Connector)

Jupyter Notebook

MySQL

SQL Analytical Functions

📊 Python Notebook Highlights (project.ipynb)
Data Cleaning

Removed null/missing values

Converted date and time formats properly

Renamed and standardized columns (if necessary)

Feature Engineering

Calculated Total_Sales = Quantity × Unit_Price

Derived new columns like profit, formatted_date, and hour

MySQL Connection

Established connection using mysql.connector

Exported cleaned dataset to a MySQL table named walmart

🧠 SQL Business Questions Solved (walmart_sql_1.sql)
Here are some of the key insights generated using SQL:

Basic Summary

Total rows, distinct branches, cities, and categories

Maximum sales quantity

Payment Insights

Transaction quantity and total sales by payment method

Most used payment method by each branch

Customer Behavior

Highest-rated category per branch

Day of the week with the highest transactions per branch

Sales & Profit

Total revenue and profit by category

Top 5 branches with the largest revenue drop from 2022 to 2023

Time-Based Insights

Shift-wise sales segmentation (Morning, Afternoon, Evening)

Invoice analysis per shift

