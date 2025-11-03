--Conversion Functions
TO_DATE(text, format)     → Converts a string to a DATE
TO_TIMESTAMP(text, format)→ Converts a string to a TIMESTAMP
TO_NUMBER(text)           → Converts a character string to a numeric value
TO_CHAR(value, format)    → Converts a date, number, or timestamp to a string
CAST(value AS type)       → Converts a value from one data type to another
--------------------------------------------------------------------------
--Common Date-Time Conversion Patterns
Pattern | Example        | Description
YYYY / YYY / YY / Y      | 2023 / 023 / 23 / 3  → Year in 4 / last 3 / last 2 / last 1 digits
MONTH / Month / month    | FEBRUARY / February / february  → Full month name (case-sensitive)
MON / Mon / mon          | FEB / Feb / feb  → Abbreviated month name
DAY / Day / day          | MONDAY / Monday / monday  → Full day name
DY / Dy / dy             | MON / Mon / mon  → Abbreviated day name
MM                       | 01–12  → Month number
DDD                      | 001–366 → Day of year
DD                       | 01–31  → Day of month
D                        | 1–7  → Day of week (Sunday=1)
W                        | 1–5  → Week of month
CC                       | 20, 21 → Century
HH, HH12                 | 1–12  → Hour of day (12-hour format)
HH24                     | 0–23  → Hour of day (24-hour format)
MI                       | 0–59  → Minute
SS                       | 0–59  → Second
MS                       | 000–9999  → Millisecond
US                       | 000000–999999  → Microsecond
SSSS                     | 0–86399 → Seconds past midnight
AM/PM                    | AM, PM → Meridiem indicator

--TO_DATE() Examples with Outputs
-------------------------------------------------------------*/

SELECT 
    TO_DATE('20230405', 'YYYYMMDD')               AS TD1,  -- 2023-04-05 | Standard numeric format 
    TO_DATE('2023 APRIL 05', 'YYYY MONTH DD')     AS TD2,  -- 2023-04-05 | Full uppercase month name
    TO_DATE('2023 april 05', 'YYYY month DD')     AS TD3,  -- 2023-04-05 | Lowercase month name
    TO_DATE('2023 APR 05', 'YYYY MON DD')         AS TD4,  -- 2023-04-05 | Abbreviated month (MON)
    TO_DATE('2023 240', 'YYYY DDD')               AS TD5,  -- 2023-08-28 (240th day of the year)
    TO_DATE('February 08, 2023', 'Month DD, YYYY') AS TD6; -- 2023-02-08 | Month DD, YYYY pattern  

--TO_TIMESTAMP Function
--TO_TIMESTAMP(timestamp_text, format)
 --Converts a text string into a TIMESTAMP value (date + time)

SELECT 
    TO_TIMESTAMP('2021-05-30 08:40:30', 'YYYY-MM-DD HH:MI:SS') AS TT1,   -- Output: 2021-05-30 08:40:30
    TO_TIMESTAMP('05.30.2021 20:40:30', 'MM.DD.YYYY HH24:MI:SS') AS TT2,-- Output: 2021-05-30 20:40:30
    TO_TIMESTAMP('2022/25/08 08:40', 'YYYY/DD/MM HH:MI') AS TT3,         -- Output: 2022-08-25 08:40:00
    TO_TIMESTAMP('11 30 99 12:40', 'MM DD YY HH:MI') AS TT4,             -- Output: 1999-11-30 12:40:00
    TO_TIMESTAMP('09 07 19 10:35', 'MM DD YY HH:MI') AS TT5,             -- Output: 2019-09-07 10:35:00
    TO_TIMESTAMP('2022 OCT 15 07:21:11', 'YYYY MON DD HH:MI:SS') AS TT6; -- Output: 2022-10-15 07:21:11

--TO_NUMBER
-- Purpose: Converts a character (text) value into a numeric value
--TO_NUMBER(text, format)

SELECT 
    TO_NUMBER('1210.73', '9999.99') AS TN1,        -- Output: 1210.73
    TO_NUMBER('1,210.73', '9G999.99') AS TN2,      -- Output: 1210.73 (G = thousand symbol)
    TO_NUMBER('$1,210.73', 'L9G999.99') AS TN3,    -- Output: 1210.73 (L = currency symbol)
	--bu üçü aynı ama formatta belirtiyoruzz nasıl yazdığımızı
    TO_NUMBER('$1,210.73', 'L9G999') AS TN4,       -- Output: 1210
    TO_NUMBER('-12.345,6', '99G999D9S') AS TN5,    -- Output: -12345.6  (D = decimal separator, S = sign)
    TO_NUMBER('$1.234.567,89', 'L9G999g999,99') AS TN6, -- Output: 1234567.89
    TO_NUMBER('00005469', '999999999') AS TN7,     -- Output: 5469
    '00005469'::integer AS TN8,                    -- Output: 5469 (PostgreSQL cast shortcut)
    CAST('00005469' AS integer) AS TN9;            -- Output: 5469 (Standard SQL cast)

   🧠 Explanation of Format Elements
   Symbol | Meaning
   --------|------------------------------------------------
   9       | Digit placeholder
   G       | Group (thousand) separator
   D       | Decimal point
   L       | Currency symbol (based on locale)
   S       | Sign indicator (+ / -)

--TO_CHAR
   
-- Purpose: Converts a DATE or NUMBER value into a formatted text (VARCHAR)
-- Syntax:  TO_CHAR(expression, format)

SELECT 
    payment_id, 
    payment_date, 
    amount,

    TO_CHAR(payment_date, 'HH24:MI:SS') AS TC1,          -- 14:35:22 (24-hour time)
    TO_CHAR(payment_date, 'MON-DD-YYYY HH12:MI PM') AS TC2, -- NOV-03-2025 02:35 PM
    TO_CHAR(payment_date, 'DD.MM.YYYY HH24:MI') AS TC3, -- 03.11.2025 14:35
    TO_CHAR(payment_date, 'MON-DAY-YYYY HH12:MI') AS TC4, -- NOV-MONDAY-2025 02:35
    TO_CHAR(payment_date, 'Month DD, YYYY') AS TC5,     -- November 03, 2025
    TO_CHAR(payment_date, 'YYYYMMDD') AS TC6,           -- 20251103
    TO_CHAR(amount, '99D99') AS TC7                     -- 10.50  (depending on locale)
FROM payment;

-- Explanation of Common Date Format Patterns
   Code  | Meaning
   ------|-------------------------------------------
   YYYY  | 4-digit year
   MON   | Abbreviated month name (e.g., NOV)
   Month | Full month name (e.g., November)
   DD    | Day of month (01–31)
   HH12  | 12-hour format hour
   HH24  | 24-hour format hour
   MI    | Minutes
   SS    | Seconds
   PM/AM | Meridian indicator
   
   ✅ QUICK RECAP
   -----------------------------------------------------------
   FUNCTION     | FROM → TO           | PURPOSE
   --------------|--------------------|---------------------------------
   TO_DATE       | TEXT → DATE         | Converts text to date
   TO_TIMESTAMP  | TEXT → TIMESTAMP    | Converts text to timestamp
   TO_NUMBER     | TEXT → NUMBER       | Converts text to numeric
   TO_CHAR       | DATE/NUMBER → TEXT  | Formats numbers or dates as text
    
