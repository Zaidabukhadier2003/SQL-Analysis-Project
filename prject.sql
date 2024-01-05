-- Generate sample data
CREATE TABLE international_debt_table (
    country_name TEXT,
    debt_amount DECIMAL(10, 2),
    debt_indicator TEXT,
    date_column DATE
);

INSERT INTO international_debt_table VALUES
('CountryA', 1000000.50, 'External debt', '2022-01-01'),
('CountryB', 500000.25, 'Public debt', '2022-01-02'),
('CountryC', 1500000.75, 'Private debt', '2022-01-03'),
('CountryD', 750000.00, 'External debt', '2022-01-04'),
('CountryE', 2000000.30, 'Public debt', '2022-01-05');

-- Create a temporary table to store debt data
CREATE TEMPORARY TABLE temp_debt_data AS
SELECT
    country_name,
    debt_amount,
    debt_indicator,
    date_column
FROM international_debt_table;

-- Query 1: The number of countries with debt
SELECT COUNT(DISTINCT country_name) AS num_countries_with_debt
FROM temp_debt_data;

-- Query 2: The total amount of debt owed by all countries
SELECT SUM(debt_amount) AS total_debt_amount
FROM temp_debt_data;

-- Query 3: The country with the highest debt and the amount of its debt
SELECT
    country_name,
    debt_amount AS highest_debt_amount
FROM temp_debt_data
ORDER BY debt_amount DESC
LIMIT 1;

-- Query 4: The average amount of debt owed by countries across different debt indicators
SELECT
    debt_indicator,
    AVG(debt_amount) AS avg_debt_amount
FROM temp_debt_data
GROUP BY debt_indicator;

-- Query 5: The most common debt indicator
SELECT
    debt_indicator,
    COUNT(*) AS num_occurrences
FROM temp_debt_data
GROUP BY debt_indicator
ORDER BY num_occurrences DESC
LIMIT 1;

-- Advanced SQL techniques

-- Query 6: Using common table expressions (CTE) to calculate cumulative debt
WITH cumulative_debt_cte AS (
    SELECT
        country_name,
        debt_amount,
        SUM(debt_amount) OVER (ORDER BY debt_amount DESC) AS cumulative_debt
    FROM temp_debt_data
)
SELECT *
FROM cumulative_debt_cte
ORDER BY cumulative_debt DESC;

-- Query 7: Applying SQL window functions to find the rank of each country based on debt
SELECT
    country_name,
    debt_amount,
    RANK() OVER (ORDER BY debt_amount DESC) AS debt_rank
FROM temp_debt_data;

-- Query 8: Working with dates and times (Assuming a date column in the international_debt_table)
SELECT
    country_name,
    debt_amount,
    date_column
FROM international_debt_table
WHERE date_column >= '2022-01-01';

-- Query 9: Using self join to find countries with similar debt levels
SELECT
    a.country_name AS country1,
    b.country_name AS country2,
    ABS(a.debt_amount - b.debt_amount) AS debt_difference
FROM temp_debt_data a
JOIN temp_debt_data b ON a.country_name <> b.country_name
ORDER BY debt_difference ASC
LIMIT 5;

-- Query 10: Extracting patterns using regular expressions
SELECT
    country_name,
    debt_indicator,
    REGEXP_REPLACE(debt_indicator, 'debt', '***') AS modified_indicator
FROM temp_debt_data;

-- Query 11: Applying set operators to find unique debt indicators
SELECT DISTINCT debt_indicator
FROM temp_debt_data
UNION
SELECT DISTINCT UPPER(debt_indicator)
FROM temp_debt_data;

-- Query 12: Creating a view to simplify complex queries
CREATE VIEW debt_summary_view AS
SELECT
    country_name,
    debt_amount,
    debt_indicator,
    date_column
FROM temp_debt_data;

-- Query 13: Using a view to find the latest debt for each country
SELECT
    country_name,
    debt_amount,
    date_column
FROM debt_summary_view
WHERE (country_name, date_column) IN (
    SELECT country_name, MAX(date_column) AS latest_date
    FROM debt_summary_view
    GROUP BY country_name
);

-- Query 14: Truncating data for privacy concerns (e.g., rounding debt amounts)
SELECT
    country_name,
    ROUND(debt_amount, -3) AS truncated_debt_amount
FROM temp_debt_data;

-- Query 15: Labeling data using CASE statements
SELECT
    country_name,
    debt_amount,
    CASE
        WHEN debt_amount > 1000000 THEN 'High Debt'
        WHEN debt_amount > 500000 THEN 'Moderate Debt'
        ELSE 'Low Debt'
    END AS debt_label
FROM temp_debt_data;

-- Drop the temporary table
DROP TEMPORARY TABLE IF EXISTS temp_debt_data;
