# 🛒 Walmart Sales Analysis

This project provides a comprehensive analysis of Walmart's sales data using **Python** and **SQL**.  
It includes steps for data cleaning, calculating total sales, and extracting business insights through SQL queries connected to a **MySQL** database.

---

## 📁 Project Structure

| File               | Description                                                        |
|--------------------|--------------------------------------------------------------------|
| `project.ipynb`     | Python notebook used to clean data, perform exploratory analysis, and connect to MySQL |
| `walmart_sql_1.sql` | SQL file containing multiple analytical queries to derive business insights |

---

## 🔧 Tools & Technologies

- Python (Pandas, NumPy, MySQL Connector)
- Jupyter Notebook
- MySQL
- SQL Analytical Functions

---

## 📊 Python Notebook Highlights (`project.ipynb`)

### 🔹 Data Cleaning
- Removed null/missing values
- Converted date and time formats properly
- Renamed and standardized columns (if necessary)

### 🔹 Feature Engineering
- Calculated `Total_Sales = Quantity × Unit_Price`

### 🔹 MySQL Connection
- Established connection using `mysql.connector`
- Exported cleaned dataset to a MySQL table named `walmart`

---

## 🧠 SQL Business Questions Solved (`walmart_sql_1.sql`)

Here are some of the key insights generated using SQL:

### 🔹 Basic Summary
- Total rows
- Total number of distinct branches, cities, and categories
- Maximum sales quantity

### 🔹 Payment Insights
- Transaction quantity and total sales by payment method
- Most used payment method by each branch

### 🔹 Customer Behavior
- Highest-rated category per branch
- Day of the week with the highest transactions per branch

### 🔹 Sales & Profit
- Total revenue and total profit by category
- Top 5 branches with the largest revenue drop from 2022 to 2023

### 🔹 Time-Based Insights
- Shift-wise sales segmentation (Morning, Afternoon, Evening)
- Invoice analysis per shift

---

## 📬 Contact
Feel free to reach out for questions or collaboration via GitHub or email.
