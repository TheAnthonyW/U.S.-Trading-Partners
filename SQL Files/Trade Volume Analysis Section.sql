-- Q1
SELECT
    SUM(ex.Australia), SUM(ex.Belgium), SUM(ex.Brazil), SUM(ex.Canada),
    SUM(ex.China), SUM(ex.France), SUM(ex.Germany), SUM(ex.`Hong Kong`),
    SUM(ex.India), SUM(ex.Ireland), SUM(ex.Israel), SUM(ex.Italy),
    SUM(ex.Japan), SUM(ex.`Korea, South`), SUM(ex.Malaysia), SUM(ex.Mexico),
    SUM(ex.Netherlands), SUM(ex.`Saudi Arabia`), SUM(ex.Singapore), SUM(ex.Switzerland),
    SUM(ex.Taiwan), SUM(ex.`United Kingdom`), SUM(ex.Vietnam), SUM(ex.`All other countries`),
    SUM(ex.`European Union`), SUM(ex.`SouthCentral America`)
FROM `exports by countries` ex;

SELECT GREATEST(
    SUM(ex.Australia), SUM(ex.Belgium), SUM(ex.Brazil), SUM(ex.Canada),
    SUM(ex.China), SUM(ex.France), SUM(ex.Germany), SUM(ex.`Hong Kong`),
    SUM(ex.India), SUM(ex.Ireland), SUM(ex.Israel), SUM(ex.Italy),
    SUM(ex.Japan), SUM(ex.`Korea, South`), SUM(ex.Malaysia), SUM(ex.Mexico),
    SUM(ex.Netherlands), SUM(ex.`Saudi Arabia`), SUM(ex.Singapore), SUM(ex.Switzerland),
    SUM(ex.Taiwan), SUM(ex.`United Kingdom`), SUM(ex.Vietnam), SUM(ex.`All other countries`),
    SUM(ex.`European Union`), SUM(ex.`SouthCentral America`)
    ) AS max_export
FROM `exports by countries` ex;

-- Q2
SELECT
    SUM(im.Australia), SUM(im.Belgium), SUM(im.Brazil), SUM(im.Canada),
    SUM(im.China), SUM(im.France), SUM(im.Germany), SUM(im.`Hong Kong`),
    SUM(im.India), SUM(im.Ireland), SUM(im.Israel), SUM(im.Italy),
    SUM(im.Japan), SUM(im.`Korea, South`), SUM(im.Malaysia), SUM(im.Mexico),
    SUM(im.Netherlands), SUM(im.`Saudi Arabia`), SUM(im.Singapore), SUM(im.Switzerland),
    SUM(im.Taiwan), SUM(im.`United Kingdom`), SUM(im.Vietnam), SUM(im.`All other countries`),
    SUM(im.`European Union`), SUM(im.`SouthCentral America`)
FROM `imports by countries` im;

SELECT GREATEST(
    SUM(im.Australia), SUM(im.Belgium), SUM(im.Brazil), SUM(im.Canada),
    SUM(im.China), SUM(im.France), SUM(im.Germany), SUM(im.`Hong Kong`),
    SUM(im.India), SUM(im.Ireland), SUM(im.Israel), SUM(im.Italy),
    SUM(im.Japan), SUM(im.`Korea, South`), SUM(im.Malaysia), SUM(im.Mexico),
    SUM(im.Netherlands), SUM(im.`Saudi Arabia`), SUM(im.Singapore), SUM(im.Switzerland),
    SUM(im.Taiwan), SUM(im.`United Kingdom`), SUM(im.Vietnam), SUM(im.`All other countries`),
    SUM(im.`European Union`), SUM(im.`SouthCentral America`)
    ) AS max_import
FROM `imports by countries` im;

-- Q3
SELECT country, total_exports FROM (
    SELECT 'Australia', SUM(ex.Australia) FROM `exports by countries` ex
    UNION ALL SELECT 'Belgium', SUM(ex.Belgium) FROM `exports by countries` ex
    UNION ALL SELECT 'Brazil', SUM(ex.Brazil) FROM `exports by countries` ex
    UNION ALL SELECT 'Canada', SUM(ex.Canada) FROM `exports by countries` ex
    UNION ALL SELECT 'China', SUM(ex.China) FROM `exports by countries` ex
    UNION ALL SELECT 'France', SUM(ex.France) FROM `exports by countries` ex
    UNION ALL SELECT 'Germany', SUM(ex.Germany) FROM `exports by countries` ex
    UNION ALL SELECT 'Hong Kong', SUM(ex.`Hong Kong`) FROM `exports by countries` ex
    UNION ALL SELECT 'India', SUM(ex.India) FROM `exports by countries` ex
    UNION ALL SELECT 'Ireland', SUM(ex.Ireland) FROM `exports by countries` ex
    UNION ALL SELECT 'Israel', SUM(ex.Israel) FROM `exports by countries` ex
    UNION ALL SELECT 'Italy', SUM(ex.Italy) FROM `exports by countries` ex
    UNION ALL SELECT 'Japan', SUM(ex.Japan) FROM `exports by countries` ex
    UNION ALL SELECT 'Korea, South', SUM(ex.`Korea, South`) FROM `exports by countries` ex
    UNION ALL SELECT 'Malaysia', SUM(ex.Malaysia) FROM `exports by countries` ex
    UNION ALL SELECT 'Mexico', SUM(ex.Mexico) FROM `exports by countries` ex
    UNION ALL SELECT 'Netherlands', SUM(ex.Netherlands) FROM `exports by countries` ex
    UNION ALL SELECT 'Saudi Arabia', SUM(ex.`Saudi Arabia`) FROM `exports by countries` ex
    UNION ALL SELECT 'Singapore', SUM(ex.Singapore) FROM `exports by countries` ex
    UNION ALL SELECT 'Switzerland', SUM(ex.Switzerland) FROM `exports by countries` ex
    UNION ALL SELECT 'Taiwan', SUM(ex.Taiwan) FROM `exports by countries` ex
    UNION ALL SELECT 'United Kingdom', SUM(ex.`United Kingdom`) FROM `exports by countries` ex
    UNION ALL SELECT 'Vietnam', SUM(ex.Vietnam) FROM `exports by countries` ex
    UNION ALL SELECT 'All other countries', SUM(ex.`All other countries`) FROM `exports by countries` ex
    UNION ALL SELECT 'European Union', SUM(ex.`European Union`) FROM `exports by countries` ex
    UNION ALL SELECT 'SouthCentral America', SUM(ex.`SouthCentral America`) FROM `exports by countries` ex
) temp(country, total_exports)
ORDER BY total_exports DESC;

#Q4
SELECT country, trade_balance FROM (
    SELECT 'Australia', SUM(ex.Australia) - SUM(im.Australia) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Belgium', SUM(ex.Belgium) - SUM(im.Belgium) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Brazil', SUM(ex.Brazil) - SUM(im.Brazil) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Canada', SUM(ex.Canada) - SUM(im.Canada) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'China', SUM(ex.China) - SUM(im.China) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'France', SUM(ex.France) - SUM(im.France) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Germany', SUM(ex.Germany) - SUM(im.Germany) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Hong Kong', SUM(ex.`Hong Kong`) - SUM(im.`Hong Kong`) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'India', SUM(ex.India) - SUM(im.India) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Ireland', SUM(ex.Ireland) - SUM(im.Ireland) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Israel', SUM(ex.Israel) - SUM(im.Israel) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Italy', SUM(ex.Italy) - SUM(im.Italy) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Japan', SUM(ex.Japan) - SUM(im.Japan) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Korea, South', SUM(ex.`Korea, South`) - SUM(im.`Korea, South`) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Malaysia', SUM(ex.Malaysia) - SUM(im.Malaysia) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Mexico', SUM(ex.Mexico) - SUM(im.Mexico) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Netherlands', SUM(ex.Netherlands) - SUM(im.Netherlands) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Saudi Arabia', SUM(ex.`Saudi Arabia`) - SUM(im.`Saudi Arabia`) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Singapore', SUM(ex.Singapore) - SUM(im.Singapore) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Switzerland', SUM(ex.Switzerland) - SUM(im.Switzerland) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Taiwan', SUM(ex.Taiwan) - SUM(im.Taiwan) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'United Kingdom', SUM(ex.`United Kingdom`) - SUM(im.`United Kingdom`) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'Vietnam', SUM(ex.Vietnam) - SUM(im.Vietnam) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'All other countries', SUM(ex.`All other countries`) - SUM(im.`All other countries`) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'European Union', SUM(ex.`European Union`) - SUM(im.`European Union`) FROM `exports by countries` ex, `imports by countries` im
    UNION ALL SELECT 'SouthCentral America', SUM(ex.`SouthCentral America`) - SUM(im.`SouthCentral America`) FROM `exports by countries` ex, `imports by countries` im
) temp(country, trade_balance)
ORDER BY trade_balance ASC; -- Sorts by the biggest trade deficit first

#5
SELECT ex.Period, 
       SUM(ex.Canada) AS total_exports, 
       SUM(im.Canada) AS total_imports
FROM `exports by countries` ex
JOIN `imports by countries` im ON ex.Period = im.Period
GROUP BY ex.Period
ORDER BY ex.Period ASC;