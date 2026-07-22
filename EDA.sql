#-----EDA----

SELECT * FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM 
layoffs_staging2;

SELECT 
company,
SUM(total_laid_off),
YEAR(`Date`)
FROM layoffs_staging2
GROUP BY company,YEAR(`Date`)
ORDER BY 2 DESC;

SELECT
industry,
SUM(total_laid_off),
YEAR(`Date`)
FROM layoffs_staging2
GROUP BY industry,YEAR(`Date`)
ORDER BY 2 DESC;


SELECT
industry,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;


SELECT
country,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;

SELECT 
location,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL
GROUP BY location
ORDER BY 2 DESC
;

SELECT
YEAR(date),
SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 2 DESC;

SELECT
company,
funds_raised_millions,
total_laid_off
FROM layoffs_staging2
ORDER BY funds_raised_millions DESC;



SELECT 
MIN(`Date`), MAX(`Date`)
FROM 
layoffs_staging2;

SELECT
SUBSTRING(`date`,1,7) AS `MONTH`,
SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

SELECT * FROM layoffs_staging2;


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

WITH Company_Year(company,years,total_laid_off) AS
(
SELECT 
company,
YEAR(`Date`),
SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`Date`)
) ,
Company_Year_Rank AS
(SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS 
Ranking
FROM Company_Year
WHERE years IS NOT NULL)
SELECT * FROM Company_Year_Rank
WHERE Ranking <= 5;

SELECT * FROM layoffs_staging2;

SELECT
company,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC;

SELECT
company,
COUNT(*) AS number_of_rounds
FROM layoffs_staging2
GROUP BY company
ORDER BY number_of_rounds DESC;

SELECT
YEAR(date),
SUM(total_laid_off)
FROM layoffs_staging2
WHERE YEAR(date) IS NOT NULL
GROUP BY YEAR(date)
ORDER BY YEAR(date);