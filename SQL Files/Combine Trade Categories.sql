-- Import, Export, Balance Trading Volume From 2000 to 2023 for Canada
SELECT 
    ex.Period,
    ex.Canada AS export_value,
    im.Canada AS import_value,
    b.Canada AS balance_value
FROM  `exports by countries` AS ex
JOIN  `imports by countries` AS im ON ex.Period = im.Period
JOIN  `balance by countries` AS b ON ex.Period = b.Period
WHERE ex.Period BETWEEN 2000 AND 2023
ORDER BY ex.Period ASC;
