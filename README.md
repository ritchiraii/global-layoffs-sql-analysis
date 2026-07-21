# 📊 Global Layoffs Data Cleaning & Exploratory Data Analysis using MySQL

<p align="center">

![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge)
![EDA](https://img.shields.io/badge/Project-EDA-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

</p>

---

##  Project Summary

This project demonstrates an **end-to-end SQL workflow** using MySQL by transforming raw layoff data into an analysis-ready dataset and uncovering business insights through Exploratory Data Analysis (EDA).

The project focuses on real-world data cleaning techniques and answering business questions related to global workforce reductions between **2020–2023**.

---

##  Business Objectives

The analysis answers the following questions:

- Which companies laid off the most employees?
- Which industries experienced the highest layoffs?
- Which countries and cities were most affected?
- How did layoffs change over time?
- Which companies had the highest layoffs each year?
- Did highly funded companies also conduct layoffs?

---

#  Dataset Overview

| Attribute | Description |
|------------|-------------|
| Dataset | Global Layoffs |
| Database | MySQL |
| Records | ~2,300+ |
| Time Period | 2020–2023 |

---

#  Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL | Database |
| SQL | Data Cleaning & Analysis |
| Git | Version Control |
| GitHub | Documentation |

---

#  Data Cleaning

The raw dataset contained duplicate records, inconsistent formatting, missing values and incorrect data types.

Cleaning steps performed:

- 1 Removed duplicate records
- 2 Standardized company names
- 3 Standardized industry names
- 4 Standardized country names
- 5 Converted Date column to SQL DATE datatype
- 6 Handled missing values
- 7 Removed unnecessary records

---

#  Exploratory Data Analysis

---

## 1️⃣ Companies with the Highest Layoffs

### Business Question

Which companies laid off the highest number of employees?

<details>

<summary>SQL Query</summary>

```sql
SELECT
company,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC;
```

</details>

### Query Output

![Top Companies](images/top_companies.png)

### Business Insight

The analysis shows that several large technology companies announced the highest workforce reductions, reflecting significant organizational restructuring during the observed period.

---

## 2️⃣ Industries Most Affected

### Business Question

Which industries experienced the largest workforce reductions?

<details>

<summary>SQL Query</summary>

```sql
SELECT
industry,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;
```

</details>

### Query Output

![Industry Analysis](images/industry_analysis.png)

### Business Insight

Consumer and Retail industries experienced the largest layoffs, indicating these sectors faced considerable operational and market pressures.

---

## 3️⃣ Countries with the Highest Layoffs

### Business Question

Which countries were most affected?

<details>

<summary>SQL Query</summary>

```sql
SELECT
country,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;
```

</details>

### Query Output

![Country Analysis](images/country_analysis.png)

### Business Insight

The United States accounted for the majority of recorded layoffs, reflecting its large concentration of technology companies represented in the dataset.

---

## 4️⃣ Layoffs by Year

### Business Question

How did layoffs change over time?

<details>

<summary>SQL Query</summary>

```sql
SELECT
YEAR(date),
SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY YEAR(date);
```

</details>

### Query Output

![Yearly Analysis](images/yearly_analysis.png)

### Business Insight

Layoffs increased significantly during the post-pandemic period before beginning to stabilize, highlighting changing business priorities and cost optimization strategies.

---

## 5️⃣ Rolling Layoff Trend

### Business Question

How did cumulative layoffs evolve over time?

<details>

<summary>SQL Query</summary>

```sql
WITH Rolling_Total AS
(
SELECT
SUBSTRING(date,1,7) AS Month,
SUM(total_laid_off) AS total_off
FROM layoffs_staging2
GROUP BY Month
)

SELECT
Month,
SUM(total_off)
OVER(ORDER BY Month)
FROM Rolling_Total;
```

</details>

### Query Output

![Rolling Total](images/rolling_total.png)

### Business Insight

The rolling trend demonstrates that workforce reductions accumulated steadily across multiple months rather than occurring as isolated events.

---

## 6️⃣ Top Companies by Layoffs Each Year

### Business Question

Which companies recorded the highest layoffs each year?

<details>

<summary>SQL Query</summary>

```sql
WITH Company_Year AS
(
SELECT
company,
YEAR(date) AS years,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company,YEAR(date)
),

Company_Year_Rank AS
(
SELECT *,
DENSE_RANK()
OVER(PARTITION BY years ORDER BY total_laid_off DESC) Ranking
FROM Company_Year
)

SELECT *
FROM Company_Year_Rank
WHERE Ranking <=5;
```

</details>

### Query Output

![Company Ranking](images/company_year_rank.png)

### Business Insight

The organizations leading layoffs changed each year, suggesting workforce reductions were influenced by evolving market conditions rather than a single company or industry.

---

#  Key Business Insights

- Technology companies accounted for a significant proportion of global layoffs.
- Consumer and Retail sectors experienced the highest workforce reductions.
- The United States recorded the largest number of layoffs.
- Layoffs accelerated during the post-pandemic period.
- Multiple companies conducted layoffs over several rounds.
- High funding levels did not necessarily prevent workforce reductions.

---

#  SQL Concepts Demonstrated

- Data Cleaning
- Exploratory Data Analysis (EDA)
- Aggregate Functions
- GROUP BY
- ORDER BY
- Window Functions
- Common Table Expressions (CTEs)
- DENSE_RANK()
- Date Functions
- Business Insight Generation

---

#  Repository Structure

```text
global-layoffs-sql-analysis/

│
├── README.md
│
├── dataset/
│      └── layoffs.csv
│
├── sql/
│      ├── 01_data_cleaning.sql
│      └── 02_exploratory_data_analysis.sql
│
├── images/
│      ├── top_companies.png
│      ├── industry_analysis.png
│      ├── country_analysis.png
│      ├── yearly_analysis.png
│      ├── rolling_total.png
│      └── company_year_rank.png
│
└── LICENSE
```

---

#  Future Improvements

- Develop an interactive Power BI dashboard using the cleaned dataset.
- Perform predictive trend analysis with Python.
- Build an automated ETL workflow for recurring data updates.

---

#  About Me

**Ritch Rai**

Aspiring **Data Analyst** with a passion for SQL, Power BI, Excel, Python, and Business Analytics.

- 💼 LinkedIn: https://www.linkedin.com/in/ritch-rai-4b8b23269/
- 📧 Email: ritchiraii@gmail.com
- 🌐 Portfolio: 

---

⭐ If you found this project helpful, consider giving it a star!
