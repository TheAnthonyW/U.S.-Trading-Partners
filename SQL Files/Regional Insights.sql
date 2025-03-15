SELECT 
    SUM(ex.`European Union`) + SUM(im.`European Union`) AS total_trade, 
    (SUM(ex.`European Union`) + SUM(im.`European Union`)) * 100.0 / 
    (SUM(ex.Australia) + SUM(ex.Belgium) + SUM(ex.Brazil) + SUM(ex.Canada) +
     SUM(ex.China) + SUM(ex.France) + SUM(ex.Germany) + SUM(ex.`Hong Kong`) +
     SUM(ex.India) + SUM(ex.Ireland) + SUM(ex.Israel) + SUM(ex.Italy) +
     SUM(ex.Japan) + SUM(ex.`Korea, South`) + SUM(ex.Malaysia) + SUM(ex.Mexico) +
     SUM(ex.Netherlands) + SUM(ex.`Saudi Arabia`) + SUM(ex.Singapore) + SUM(ex.Switzerland) +
     SUM(ex.Taiwan) + SUM(ex.`United Kingdom`) + SUM(ex.Vietnam) + SUM(ex.`All other countries`) +
     SUM(ex.`European Union`) + SUM(ex.`SouthCentral America`) +
     SUM(im.Australia) + SUM(im.Belgium) + SUM(im.Brazil) + SUM(im.Canada) +
     SUM(im.China) + SUM(im.France) + SUM(im.Germany) + SUM(im.`Hong Kong`) +
     SUM(im.India) + SUM(im.Ireland) + SUM(im.Israel) + SUM(im.Italy) +
     SUM(im.Japan) + SUM(im.`Korea, South`) + SUM(im.Malaysia) + SUM(im.Mexico) +
     SUM(im.Netherlands) + SUM(im.`Saudi Arabia`) + SUM(im.Singapore) + SUM(im.Switzerland) +
     SUM(im.Taiwan) + SUM(im.`United Kingdom`) + SUM(im.Vietnam) + SUM(im.`All other countries`) +
     SUM(im.`European Union`) + SUM(im.`SouthCentral America`)
    ) AS trade_percentage
FROM `exports by countries` ex
JOIN `imports by countries` im ON ex.Period = im.Period;

SELECT country, ABS(total_exports - total_imports) AS trade_difference
FROM (
    SELECT 'Australia' AS country, SUM(ex.Australia) AS total_exports, SUM(im.Australia) AS total_imports 
    FROM `exports by countries` ex
    JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Belgium', SUM(ex.Belgium), SUM(im.Belgium) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Brazil', SUM(ex.Brazil), SUM(im.Brazil) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Canada', SUM(ex.Canada), SUM(im.Canada) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'China', SUM(ex.China), SUM(im.China) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'France', SUM(ex.France), SUM(im.France) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Germany', SUM(ex.Germany), SUM(im.Germany) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Hong Kong', SUM(ex.`Hong Kong`), SUM(im.`Hong Kong`) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'India', SUM(ex.India), SUM(im.India) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Ireland', SUM(ex.Ireland), SUM(im.Ireland) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Israel', SUM(ex.Israel), SUM(im.Israel) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Italy', SUM(ex.Italy), SUM(im.Italy) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Japan', SUM(ex.Japan), SUM(im.Japan) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Korea, South', SUM(ex.`Korea, South`), SUM(im.`Korea, South`) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Malaysia', SUM(ex.Malaysia), SUM(im.Malaysia) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Mexico', SUM(ex.Mexico), SUM(im.Mexico) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Netherlands', SUM(ex.Netherlands), SUM(im.Netherlands) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Saudi Arabia', SUM(ex.`Saudi Arabia`), SUM(im.`Saudi Arabia`) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Singapore', SUM(ex.Singapore), SUM(im.Singapore) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Switzerland', SUM(ex.Switzerland), SUM(im.Switzerland) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Taiwan', SUM(ex.Taiwan), SUM(im.Taiwan) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'United Kingdom', SUM(ex.`United Kingdom`), SUM(im.`United Kingdom`) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
    UNION ALL SELECT 'Vietnam', SUM(ex.Vietnam), SUM(im.Vietnam) FROM `exports by countries` ex JOIN `imports by countries` im ON ex.Period = im.Period
) temp
ORDER BY trade_difference ASC
LIMIT 5;
