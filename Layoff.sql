CREATE TABLE layoff (
id INT PRIMARY KEY,
company VARCHAR(100),
location_hq VARCHAR(120),
industry VARCHAR(120),
laid_off_count INT,
layoff_date TEXT,
funds_raised DECIMAL,
stage VARCHAR(120),
country VARCHAR(100),
percentage DECIMAL,
monthly_date TEXT
);

-- update layoff
UPDATE layoff
SET layoff_date = TO_DATE(layoff_date,'DD/MM/YY');

-- update date datatype

ALTER TABLE layoff
ALTER COLUMN layoff_date TYPE DATE
USING layoff_date::DATE;

-- Total layoffs in the dataset
select *
from layoff
limit 5

-- laidoffcount for each company

select company,SUM(laid_off_count) as Total_count
from layoff
group by company 
LIMIT 10;

-- Companies with the biggest layoffs --- Amazon,meta,Tesla have maximum layoffs

SELECT company, SUM(laid_off_count) AS total_layoffs
FROM layoff
WHERE laid_off_count is not null
GROUP BY company
ORDER BY total_layoffs DESC
LIMIT 60;

-- Industries with most layoffs - Retail and consumer have maximumn layoff

select industry,sum(laid_off_count) AS total_layoffs
from layoff
where laid_off_count is not null
Group by industry
order by total_layoffs desc
LIMIT 10;


-- with most layoffs-- US and India have maximum layoff

select country,sum(laid_off_count) as total_layoffs
from layoff
where laid_off_count is not null
Group by country
order by total_layoffs desc
limit 10;

-- Layoffs trend by month

SELECT monthly_date, SUM(laid_off_count)
FROM layoff
GROUP BY monthly_date
ORDER BY monthly_date;



