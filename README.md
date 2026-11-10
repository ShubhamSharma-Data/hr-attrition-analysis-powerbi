# HR Attrition Analysis Dashboard (Power BI + SQL)

An end-to-end analysis of employee attrition using SQL, Power Query, DAX and Power BI, built to find which employee groups are most likely to leave and what HR could do about it.

## Dataset
- **IBM HR Analytics Employee Attrition & Performance** (Kaggle): https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset
- 1,470 employees and 35 columns. This is a fictional dataset created by IBM data scientists.
- The raw CSV is not included in this repository. Please download it from Kaggle.

## Tools used
- **SQL (SQLite):** data quality checks and first-pass analysis
- **Power Query:** cleaning, labels, banding and an attrition flag
- **DAX:** measures (headcount, attrition count, attrition rate, average tenure, average income)
- **Power BI Desktop:** interactive dashboard

## Process
1. **Data checks in SQL:** confirmed 1,470 rows, no duplicate employees and no missing values in key columns.
2. **Cleaning in Power Query:** removed constant columns (EmployeeCount, Over18, StandardHours), converted coded ratings to labels, created Age, Tenure and Income bands, and added an Attrition Flag.
3. **DAX measures:** Total Headcount, Attrition Count, Attrition Rate %, Average Tenure, Average Monthly Income, Active Employees.
4. **Dashboard:** KPI cards, attrition rate by department, job role, overtime, age band, income band and tenure band, plus slicers.
5. **Validation:** the Power BI results were cross-checked against the SQL queries and matched (overall attrition 16.1%, 237 of 1,470).

## Key insights
Overall attrition is **16.1%** (237 of 1,470 employees).

1. **Overtime is the strongest signal.** Employees working overtime left at **30.5%** versus **10.4%** for those who did not, about three times higher.
   *Recommendation:* review overtime workloads and staffing.
2. **Sales Representatives have the highest attrition.** **39.8%** versus 16.1% overall (83 employees). Sales is also the highest department at **20.6%**.
   *Recommendation:* review targets, pay structure and manager support in sales.
3. **Early-career and early-tenure employees leave most.** Employees under 25 are at **39.2%** and employees with 0-2 years at the company are at **29.8%**.
   *Recommendation:* strengthen onboarding and early-career growth plans.
4. **Lower income goes with higher attrition.** The under-3K monthly income band is at **28.6%** versus **8.9%** in the highest band.
   *Recommendation:* benchmark pay for low-income roles.

## Limitations
- The dataset is fictional, and these findings show association, not cause.
- The groups overlap (for example, a junior sales representative may be young, low-paid and working overtime), so effects can't be separated without further analysis.
- Some groups are small (Sales Representative n=83, Human Resources n=52), so their rates are less reliable.

## Repository contents
- `HR_Attrition_Analysis.pbix` - Power BI dashboard file (open with Power BI Desktop)
- `queries.sql` - SQL queries used for the checks and analysis
- `screenshots/` - dashboard and SQL result screenshots
