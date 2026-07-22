#  Global Workforce Layoffs Analysis (2020–2023)

<p align="left">

![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Language](https://img.shields.io/badge/Language-SQL-F29111?style=for-the-badge)
![Project](https://img.shields.io/badge/Project-EDA-2E8B57?style=for-the-badge)
![Analytics](https://img.shields.io/badge/Analytics-Business_Insights-blue?style=for-the-badge)
![Git](https://img.shields.io/badge/Git-Version_Control-F05032?style=for-the-badge&logo=git&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

</p>

---

# Executive Summary

Between **2020 and 2023**, organizations across the technology, retail, finance, transportation, healthcare, and consumer sectors announced significant workforce reductions in response to changing economic conditions, post-pandemic restructuring, inflationary pressures, and shifting business priorities.

This project demonstrates an **end-to-end SQL analytics workflow** by transforming raw global layoff data into an analysis-ready dataset through comprehensive data cleaning and exploratory data analysis (EDA). Using SQL, the project identifies workforce trends across companies, industries, countries, funding stages, and time periods to uncover business insights that support strategic decision-making.

Rather than focusing only on SQL syntax, this project approaches the dataset from a business perspective—answering stakeholder questions, quantifying workforce trends, and communicating findings through structured analytical storytelling.

---

# Business Context

Large-scale workforce reductions are more than operational events—they often reflect broader economic shifts, changing consumer demand, evolving business strategies, and organizational restructuring.

Business leaders, investors, HR executives, and strategy teams monitor workforce trends to better understand:

- Which industries are under the greatest pressure.
- How economic conditions affect different sectors.
- Which regions experience the largest workforce reductions.
- Whether highly funded companies remain resilient during market uncertainty.
- How workforce reductions evolve over time.

Reliable business analysis requires clean, standardized, and trustworthy data. This project focuses on preparing raw layoff records for analysis before generating meaningful insights using SQL.

---

# Project Objectives

This project aims to:

- Clean and standardize raw layoff data using SQL.
- Improve overall data quality by removing duplicates, correcting inconsistencies, and handling missing values.
- Transform the dataset into an analysis-ready format.
- Explore workforce reduction trends across multiple business dimensions.
- Answer stakeholder-focused business questions through SQL analysis.
- Generate insights supported by quantitative evidence.
- Demonstrate an end-to-end SQL analytics workflow suitable for business reporting.

---

# Key Stakeholders

This analysis is designed to support stakeholders who rely on workforce and market intelligence for strategic decision-making.

| Stakeholder | Business Need |
|-------------|---------------|
| Executive Leadership | Monitor workforce reduction trends and organizational performance. |
| HR & Workforce Planning Teams | Understand hiring and restructuring patterns across industries. |
| Business Strategy Teams | Evaluate changing market conditions and industry performance. |
| Investors & Financial Analysts | Assess business stability and market-wide restructuring activity. |
| Business Intelligence Teams | Support executive reporting with reliable workforce analytics. |

---

# Business Questions

The exploratory analysis addresses the following key business questions:

1. Which companies recorded the highest workforce reductions?

2. Which industries experienced the largest layoffs?

3. Which countries were most affected?

4. How did workforce reductions change over time?

5. How did cumulative layoffs evolve throughout the analysis period?

6. Which companies recorded the highest layoffs each year?

7. Did highly funded organizations also conduct significant layoffs?

---

> **Business Goal:** Transform raw workforce data into actionable business insights that support strategic planning, workforce monitoring, and market analysis through SQL-driven analytics.


---

# Dataset Overview

The analysis is based on a publicly available dataset containing global workforce reduction announcements across multiple industries between **2020 and 2023**.

The dataset includes information about companies, industries, countries, funding stages, total employees laid off, percentage of workforce affected, announcement dates, and company funding.

Before any business analysis was performed, the dataset underwent a structured data cleaning process to improve consistency, completeness, and analytical reliability.

---

## Dataset Summary

| Attribute | Description |
|-----------|-------------|
| **Dataset** | Global Layoffs Dataset |
| **Analysis Period** | 2020 – 2023 |
| **Primary Domain** | Workforce & Business Analytics |
| **SQL Environment** | MySQL |
| **Analysis Type** | Data Cleaning & Exploratory Data Analysis |
| **Data Source** | Originally compiled from publicly reported layoff announcements |
| **File Format** | CSV |

---

# Dataset Schema

The dataset consists of the following business attributes:

| Column | Description |
|---------|-------------|
| `company` | Company announcing layoffs |
| `location` | City where the company is headquartered |
| `industry` | Business sector or industry |
| `total_laid_off` | Total number of employees laid off |
| `percentage_laid_off` | Percentage of workforce affected |
| `date` | Date of layoff announcement |
| `stage` | Company's funding or business stage |
| `country` | Country where layoffs occurred |
| `funds_raised_millions` | Total funding raised (USD Millions) |

---

# Data Quality Challenges

The raw dataset contained several quality issues that required preprocessing before meaningful analysis could be performed.

### Identified Issues

- Duplicate records
- Inconsistent company names
- Inconsistent industry names
- Missing industry values
- Missing total layoff values
- Missing percentage values
- Date stored as text
- Country naming inconsistencies
- Blank and NULL values
- Unnecessary records unsuitable for analysis

These issues could impact reporting accuracy and lead to misleading business conclusions if left unresolved.

---

# Data Cleaning Process

A structured SQL data cleaning workflow was implemented to prepare the dataset for analysis.

| Step | Cleaning Activity | Business Purpose |
|------|-------------------|------------------|
| **1** | Removed duplicate records | Prevent double-counting in reports |
| **2** | Standardized company names | Improve consistency across records |
| **3** | Standardized industry values | Enable accurate industry-level comparisons |
| **4** | Standardized country names | Improve geographic reporting accuracy |
| **5** | Converted text dates into SQL DATE format | Enable time-series analysis |
| **6** | Populated missing industry values where possible | Improve data completeness |
| **7** | Removed records with insufficient analytical value | Improve dataset reliability |
| **8** | Validated cleaned dataset | Ensure consistency before exploratory analysis |

---

# Data Cleaning Workflow

The following workflow was followed throughout the project:

```text
Raw Dataset
      │
      ▼
Duplicate Detection
      │
      ▼
Data Standardization
      │
      ▼
Missing Value Handling
      │
      ▼
Date Formatting
      │
      ▼
Data Validation
      │
      ▼
Analysis-Ready Dataset
```

---

# Outcome of Data Cleaning

After completing the cleaning process, the dataset was transformed into a reliable, analysis-ready resource suitable for business reporting and exploratory analysis.


---

# Exploratory Data Analysis

After preparing the dataset through data cleaning and validation, exploratory data analysis (EDA) was performed to uncover workforce reduction trends across companies, industries, countries, and time periods.

Each analysis begins with a business objective, followed by the SQL approach used to answer the corresponding stakeholder question.

---

# Analysis 1 — Companies with the Highest Workforce Reductions

## Objective

Identify the organizations that announced the largest workforce reductions during the analysis period.

Understanding which companies experienced the highest layoffs helps executives, investors, and business leaders assess organizational restructuring and changing market conditions.

## Business Question

**Which companies recorded the highest total layoffs?**

## Approach

Layoffs were aggregated by company and ranked in descending order to identify organizations with the largest workforce reductions.

---

## SQL Query

<details>
<summary>View SQL Query</summary>

```sql
SELECT
company,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC;
```

</details>

---

## Key Metrics

| Metric | Value |
|---------|------:|
| Companies Analyzed | 2,000+ |
| Highest Layoffs | 18,150 |
| Top Company | Amazon |
| Analysis Period | 2020–2023 |

---

## Results

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

---

## Business Insight

- Amazon recorded the largest workforce reduction with **18,150 employees**, followed by Google (**12,000**) and Meta (**11,000**).
- Six of the top ten companies are global technology organizations, highlighting how the technology sector underwent significant restructuring.
- The findings indicate that workforce reductions were driven by strategic business realignment rather than company size alone.




# Analysis 2 — Industries Most Affected

## Objective

Identify the industries that experienced the largest workforce reductions during the analysis period.

This analysis helps stakeholders understand which business sectors were most impacted by organizational restructuring and changing market conditions.

## Business Question

**Which industries recorded the highest total layoffs?**

## Analytical Approach

The dataset was grouped by **industry**, and the total number of employees laid off was calculated using the `SUM()` aggregate function. The results were then sorted in descending order to identify the industries that experienced the highest workforce reductions across the analysis period.


---

## SQL Query


<details>

<summary>View SQL Query</summary>

```sql
SELECT
industry,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;
```

</details>


---

## Key Metrics

| Metric | Value |
|---------|------:|
| Industries Analyzed | 30+ |
| Highest Layoffs | 45,182 |
| Most Affected Industry | Consumer |

---

## Results

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

---

## Business Insight

- The Consumer industry recorded **45,182 layoffs**, closely followed by Retail (**43,613**).
- Customer-facing industries experienced the greatest workforce reductions, suggesting that changing consumer demand significantly influenced restructuring decisions.
- Layoffs were distributed across multiple industries rather than being concentrated in a single sector.


# Analysis 3 — Countries with the Highest Layoffs

## Objective

Identify the countries that recorded the largest workforce reductions during the analysis period.

This analysis provides geographic insights into where workforce restructuring was most concentrated and highlights regional business trends.

## Business Question

**Which countries recorded the highest total layoffs?**

## Analytical Approach

The dataset was grouped by **country**, and the total number of employees laid off was calculated using SQL aggregate functions. The results were ranked in descending order to identify the countries with the highest recorded workforce reductions.


---


## SQL Query

<details>

<summary>View SQL Query</summary>

```sql
SELECT
country,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;
```

</details>


---


## Key Metrics

| Metric | Value |
|---------|------:|
| Countries Analyzed | 35+ |
| Highest Layoffs | 256,559 |
| Most Affected Country | United States |

---

## Results

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

---

## Business Insight

- The United States recorded **256,559 layoffs**, representing more than **seven times** the workforce reductions recorded in India (**35,993**).
- Workforce reductions were heavily concentrated in countries with a high presence of multinational technology companies.
- Mature business markets experienced the largest organizational restructuring during the analysis period.


# Analysis 4 — Workforce Reduction Trends by Year

## Objective

Analyze yearly workforce reduction trends to understand how layoffs changed over time.

Examining annual trends helps identify periods of increased organizational restructuring and changing business conditions.

## Business Question

**How did global layoffs change over time?**

## Analytical Approach

The layoff announcement dates were converted into yearly values using the `YEAR()` date function. Total layoffs were then aggregated for each year and arranged chronologically to identify long-term workforce reduction trends.


---


## SQL Query

<details>

<summary>View SQL Query</summary>

```sql
SELECT
YEAR(date),
SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY YEAR(date);
```

</details>


---


## Key Metrics

| Metric | Value |
|---------|------:|
| Peak Year | 2022 |
| Highest Layoffs | 160,661 |
| Years Analyzed | 4 |

---

## Results

| Year | Total Employees Laid Off |
|----:|-------------------------:|
| 2020 | 80,998 |
| 2021 | 15,823 |
| 2022 | 160,661 |
| 2023 | 125,677 |

---

## Business Insight

- Workforce reductions peaked in **2022**, reaching **160,661 employees**, nearly double the total recorded in 2020.
- Layoffs remained elevated in **2023 (125,677)**, indicating that restructuring continued despite signs of market stabilization.
- The trend reflects a prolonged period of workforce optimization rather than isolated layoffs.


# Analysis 5 — Rolling Workforce Reduction Trend

## Objective

Measure the cumulative growth of workforce reductions over time.

Rolling trend analysis provides a clearer understanding of how layoffs accumulated throughout the analysis period rather than focusing on individual months.

## Business Question

**How did cumulative layoffs evolve over time?**

## Analytical Approach

Monthly layoff totals were first calculated by grouping records based on the announcement month. A SQL Window Function (`SUM() OVER`) was then applied to calculate the cumulative (rolling) total of layoffs, enabling the analysis of long-term workforce reduction trends.


---


## SQL Query

<details>

<summary>View SQL Query</summary>

```sql
WITH Rolling_Total AS
(
SELECT
SUBSTRING(`date`,1,7) AS `MONTH`,
SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT 
`MONTH`,
SUM(total_off)
OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;
```

</details>


---


## Key Metrics

| Metric | Value |
|---------|------:|
| Analysis Period | Mar 2020 – Mar 2023 |
| Final Rolling Total | 383,159 |

---

## Results

| Month | Rolling Total |
|--------|--------------:|
| 2020-03 | 9,628 |
| 2020-04 | 36,338 |
| 2020-05 | 62,142 |
| ... | ... |
| 2023-01 | 331,839 |
| 2023-02 | 364,895 |
| 2023-03 | 383,159 |

> **Note:** A representative sample of the rolling totals is displayed for readability.

---

## Business Insight

- Cumulative layoffs increased from **9,628** in March 2020 to **383,159** by March 2023.
- The consistent upward trend demonstrates that workforce reductions occurred over multiple years rather than during a single restructuring event.
- This pattern reflects sustained economic uncertainty across global industries.


# Analysis 6 — Top Companies by Layoffs Each Year

## Objective

Identify the companies that recorded the highest workforce reductions within each calendar year.

Yearly rankings provide insights into how organizational restructuring shifted across different companies over time.

## Business Question

**Which companies recorded the highest layoffs each year?**

## Analytical Approach

The dataset was grouped by **company** and **year**, and total layoffs were calculated for each organization. The `DENSE_RANK()` window function was then used to rank companies within each year based on their workforce reductions, allowing the top-performing organizations to be identified annually.


---


## SQL Query

<details>

<summary>View SQL Query</summary>

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


---


## Results

| Year | Rank | Company | Total Employees Laid Off |
|:----:|:---:|----------------|-------------------------:|
| 2020 | 1 | Uber | 7,525 |
| 2020 | 2 | Booking.com | 4,375 |
| 2020 | 3 | Groupon | 2,800 |
| 2020 | 4 | Swiggy | 2,250 |
| 2020 | 5 | Airbnb | 1,900 |
| 2021 | 1 | Bytedance | 3,600 |
| 2021 | 2 | Katerra | 2,434 |
| 2021 | 3 | Zillow | 2,000 |
| 2021 | 4 | Instacart | 1,877 |
| 2021 | 5 | WhiteHat Jr | 1,800 |
| 2022 | 1 | Meta | 11,000 |
| 2022 | 2 | Amazon | 10,150 |
| 2022 | 3 | Cisco | 4,100 |
| 2022 | 4 | Peloton | 4,084 |
| 2022 | 5 | Carvana / Philips *(Tie)* | 4,000 |
| 2023 | 1 | Google | 12,000 |
| 2023 | 2 | Microsoft | 10,000 |
| 2023 | 3 | Ericsson | 8,500 |
| 2023 | 4 | Amazon / Salesforce *(Tie)* | 8,000 |
| 2023 | 5 | Dell | 6,650 |

---

## Business Insight

- Different organizations led workforce reductions each year, reflecting changing market dynamics rather than a single recurring pattern.
- Uber recorded the highest layoffs in **2020 (7,525)**, Bytedance in **2021 (3,600)**, Meta in **2022 (11,000)**, and Google in **2023 (12,000)**.
- The year-over-year shift highlights how restructuring priorities evolved as organizations responded to changing business conditions.


---

# Executive Summary of Findings

The exploratory analysis uncovered several workforce and market trends across companies, industries, countries, and time periods. The findings demonstrate how SQL can be used to transform raw operational data into meaningful business intelligence that supports strategic decision-making.

| Business Area | Key Finding | Business Impact |
|--------------|-------------|-----------------|
| **Companies** | Amazon recorded the highest total layoffs (**18,150**), followed by Google (**12,000**) and Meta (**11,000**). | Even large, market-leading organizations implemented workforce restructuring, highlighting strategic cost optimization during periods of economic uncertainty. |
| **Industries** | Consumer (**45,182**) and Retail (**43,613**) industries experienced the largest workforce reductions. | Customer-facing sectors were disproportionately affected, reflecting changing consumer demand and market pressures. |
| **Countries** | The United States accounted for **256,559** layoffs—over seven times the layoffs recorded in India (**35,993**). | Workforce reductions were concentrated in mature business markets with a high presence of multinational corporations. |
| **Yearly Trend** | Layoffs peaked in **2022 (160,661 employees)** before declining to **125,677** in **2023**. | Organizations responded to economic uncertainty with large-scale restructuring before workforce reductions began to stabilize. |
| **Rolling Trend** | Cumulative layoffs increased steadily to **383,159** by March 2023. | Workforce reductions occurred over multiple years, indicating sustained organizational restructuring rather than isolated events. |
| **Annual Company Rankings** | Different companies led layoffs each year (Uber → Bytedance → Meta → Google). | Workforce reductions evolved with changing market conditions rather than being driven by a single organization or industry. |

---

# Business Recommendations

Based on the findings, the following recommendations can support workforce planning, business strategy, and executive decision-making.

| Recommendation | Business Rationale |
|---------------|--------------------|
| **Monitor Workforce Trends Continuously** | Organizations should benchmark workforce reductions against industry peers to identify changing market conditions and adjust hiring strategies accordingly. |
| **Strengthen Workforce Planning** | HR teams should integrate industry-level workforce trends into long-term hiring and restructuring decisions to improve organizational resilience. |
| **Build Executive Dashboards** | Interactive dashboards should be developed to monitor layoffs, workforce trends, and industry performance in real time, enabling faster and more informed decision-making. |
| **Improve Data Governance** | Standardized workforce reporting improves reporting accuracy, reduces inconsistencies, and supports reliable business intelligence. |
| **Monitor Industry Performance** | Companies operating in highly affected sectors should continuously evaluate market conditions, operational efficiency, and workforce requirements to remain competitive. |

---

# Analytical Techniques Used

This project demonstrates an end-to-end SQL analytics workflow, combining data preparation, exploratory analysis, and business insight generation.

| Category | Techniques Applied |
|----------|--------------------|
| **Data Preparation** | Data Cleaning, Duplicate Removal, Data Standardization, Missing Value Handling, Date Formatting |
| **Exploratory Data Analysis** | Aggregate Analysis, Trend Analysis, Time-Series Analysis |
| **SQL Concepts** | GROUP BY, ORDER BY, Aggregate Functions, Date Functions |
| **Advanced SQL** | Window Functions, Common Table Expressions (CTEs), DENSE_RANK(), Rolling Calculations |
| **Business Analytics** | KPI Identification, Workforce Trend Analysis, Executive Reporting, Business Insight Generation |

---

# Potential Enhancements

This project establishes a strong analytical foundation and can be extended through additional reporting and automation capabilities.

| Enhancement | Business Value |
|------------|----------------|
| **Interactive Power BI Dashboard** | Provide executives with dynamic KPI reporting and workforce trend visualization. |
| **Automated ETL Pipeline** | Reduce manual effort by automating data ingestion, cleaning, and reporting workflows. |
| **Python-Based Forecasting** | Extend the analysis with statistical forecasting to identify future workforce trends. |
| **Geospatial Analysis** | Visualize layoffs by region to identify geographic workforce patterns and business hotspots. |
| **Interactive SQL Dashboard** | Enable stakeholders to explore workforce metrics through self-service reporting. |

---

# Key Skills Demonstrated

- SQL Data Cleaning
- Exploratory Data Analysis (EDA)
- Data Quality Management
- Aggregate Analysis
- Window Functions
- Common Table Expressions (CTEs)
- Time-Series Analysis
- Ranking & Segmentation
- Business Intelligence
- Analytical Storytelling
- Business Reporting
- Stakeholder-Oriented Documentation

---

# Conclusion

This project demonstrates how SQL can be used beyond querying data to solve business problems through structured analysis and data-driven storytelling.

Starting with raw workforce data, the project applied data cleaning, exploratory analysis, and business-focused reporting to uncover workforce trends across companies, industries, countries, and time periods. The resulting insights highlight the importance of reliable data preparation, analytical thinking, and clear communication in supporting strategic decision-making.

The approach reflects the responsibilities of a Data Analyst—transforming raw data into actionable insights that help stakeholders understand business performance, identify trends, and make informed decisions.

---

## Connect With Me

**LinkedIn:** https://www.linkedin.com/in/ritch-rai-4b8b23269/

**Email:** ritchiraii@gmail.com

---

⭐ If you found this project helpful, consider giving the repository a star!
