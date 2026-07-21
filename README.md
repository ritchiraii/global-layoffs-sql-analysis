#  Global Layoffs Data Cleaning & Exploratory Data Analysis using MySQL

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

| Rank | Company | Total Employees Laid Off |
|-----:|---------|-------------------------:|
| 1 | Amazon | 18,150 |
| 2 | Google | 12,000 |
| 3 | Meta | 11,000 |
| 4 | Salesforce | 10,090 |
| 5 | Microsoft | 10,000 |
| 6 | Philips | 10,000 |
| 7 | Ericsson | 8,500 |
| 8 | Uber | 7,585 |
| 9 | Dell | 6,650 |
| 10 | Booking.com | 4,601 |

### Business Insight

**Large technology companies accounted for the highest workforce reductions, indicating that even market-leading organizations implemented significant cost optimization and restructuring efforts during the observed period.
**---

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

| Rank | Industry | Total Employees Laid Off |
|-----:|----------|-------------------------:|
| 1 | Consumer | 45,182 |
| 2 | Retail | 43,613 |
| 3 | Other | 35,649 |
| 4 | Transportation | 33,748 |
| 5 | Finance | 28,344 |
| 6 | Healthcare | 25,863 |
| 7 | Food | 22,735 |
| 8 | Real Estate | 17,565 |
| 9 | Travel | 17,159 |
| 10 | Hardware | 13,798 |

### Business Insight

** The concentration of layoffs across consumer-facing industries highlights that changing market conditions affected demand-driven businesses more significantly than others, resulting in widespread workforce restructuring
**---

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

| Rank | Country | Total Employees Laid Off |
|-----:|---------|-------------------------:|
| 1 | United States | 256,559 |
| 2 | India | 35,993 |
| 3 | Netherlands | 17,220 |
| 4 | Sweden | 11,264 |
| 5 | Brazil | 10,391 |
| 6 | Germany | 8,701 |
| 7 | United Kingdom | 6,398 |
| 8 | Canada | 6,319 |
| 9 | Singapore | 5,995 |
| 10 | China | 5,905 |

### Business Insight

The United States accounts for the majority of recorded layoffs by a wide margin, suggesting that global workforce reductions were heavily concentrated in markets where large multinational and technology companies are headquartered.

---

## 4️⃣ Layoffs by Year

### Business Question

How did workforce reductions change over time?

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

| Year | Total Employees Laid Off |
|----:|-------------------------:|
| 2020 | 80,998 |
| 2021 | 15,823 |
| 2022 | 160,661 |
| 2023 | 125,677 |

### Business Insight

**Layoffs increased significantly in **2022**, marking the highest number of workforce reductions in the dataset. While layoffs remained elevated in **2023**, the decrease compared to 2022 suggests organizations began stabilizing after widespread restructuring efforts.
**---

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

<p align="center">
    <img src="images/rolling_total.png" width="700">
</p>

<p align="center">
<i>Figure 1: Rolling cumulative layoffs using a SQL Window Function.</i>
</p>


### Business Insight

**The rolling total of layoffs increased throughout 2020 to early 2023, showing that workforce reductions continued over multiple years. This suggests companies responded to changing economic conditions with ongoing layoffs rather than a single round of job cuts.
**---

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

<p align="center">
    <img src="images/top_companies_by_year.png" width="700">
</p>

<p align="center">
<i>Figure 2: Top 5 companies by layoffs each year using a CTE and DENSE_RANK().</i>
</p>

### Business Insight

** The companies with the highest layoffs changed each year. For example, Uber had the highest layoffs in 2020, Bytedance in 2021, Meta in 2022, and Google in 2023. This shows that workforce reductions affected different companies over time as business priorities and market conditions evolved.
**---
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
