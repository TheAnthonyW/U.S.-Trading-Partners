-- Total Trading Volume From 2000 to 2023 for Canada Method 1
SELECT 
    SUM(ex.Canada) AS total_canada_export_value,
    SUM(im.Canada) AS total_canada_import_value,
    SUM(b.Canada) AS total_canada_balance_value
FROM  `exports by countries` AS ex
JOIN  `imports by countries` AS im ON ex.Period = im.Period
JOIN  `balance by countries` AS b ON ex.Period = b.Period
WHERE ex.Period BETWEEN 2000 AND 2023;


-- Total Trading Volume From 2000 to 2023 for Canada Method 2
SELECT
(SELECT SUM(Canada)
FROM ustrading.`exports by countries`
WHERE Period BETWEEN 2000 AND 2023) AS Total_Canada_Exporting_Volume,
(SELECT SUM(Canada)
FROM ustrading.`imports by countries`
WHERE Period BETWEEN 2000 AND 2023) AS Total_Canada_Importing_Volume,
(SELECT SUM(Canada)
FROM ustrading.`balance by countries`
WHERE Period BETWEEN 2000 AND 2023) AS Total_Canada_Exporting_Volume;


