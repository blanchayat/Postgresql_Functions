-- 📘 PostgreSQL DATE FUNCTIONS EXAMPLES

-- 🕓 Basic Date & Time Functions
SELECT 
    CURRENT_DATE,   -- Returns the current date (e.g., 2025-11-03)
    CURRENT_TIME,   -- Returns the current time with time zone
    LOCALTIME,      -- Returns the local time (without time zone)
    NOW(),          -- Returns the current date and time with time zone
    TIMEOFDAY();    -- Returns current date and time as text

	-- 📘AGE()
-- The AGE() function calculates the time difference between two dates or timestamps.
-- If only one date is given, PostgreSQL calculates the age between that date and the current date.

SELECT 
    first_name,                 -- Employee's first name
    last_name,                  -- Employee's last name
    hire_date,                  -- The date when the employee was hired
    AGE(hire_date) AS age_of_hire  -- How long ago the employee was hired (in years, months, days)
FROM employees;

-- 💡 Example Output:
-- first_name | last_name | hire_date  | age_of_hire
-- ------------+-----------+------------+-----------------
-- John        | Smith     | 2015-06-20 | 10 years 4 mons
-- Emily       | Davis     | 2020-03-15 | 5 years 7 mons
--
-- Tip: You can also use AGE(date1, date2) to compare any two specific dates.
-- Example: SELECT AGE('2025-11-03', '2020-11-03');  --> 5 years

-- 📘DATE_PART()
-- The DATE_PART() function extracts a specific part (field) from a date, time, or timestamp.
-- It returns the value as a double precision number.

-- DATE_PART('field', source)
-- Common fields: century, year, month, day, hour, minute, second, dow (day of week), doy (day of year), etc.

SELECT 
    CURRENT_DATE,  -- The current system date
    
    DATE_PART('century', CURRENT_DATE) AS century_,    -- Which century it is
    DATE_PART('quarter', CURRENT_DATE) AS quarter_,    -- Which quarter of the year (1–4)
    DATE_PART('decade', CURRENT_DATE) AS decade_,      -- Decade number
    DATE_PART('year', CURRENT_DATE) AS year_,          -- The current year
    DATE_PART('month', CURRENT_DATE) AS month_,        -- The current month (1–12)
    DATE_PART('day', CURRENT_DATE) AS day_,            -- The current day of the month
    DATE_PART('hour', CURRENT_TIMESTAMP) AS hour_,     -- Current hour (0–23)
    DATE_PART('minute', CURRENT_TIMESTAMP) AS minute_, -- Current minute (0–59)
    DATE_PART('dow', CURRENT_DATE) AS dow_,            -- Day of week (0=Sunday, 6=Saturday)
    DATE_PART('doy', CURRENT_DATE) AS doy_,            -- Day of year (1–365)
    DATE_PART('timezone', CURRENT_TIME) AS timezone_;  -- Time zone offset in seconds

-- 💡 Example Output:
-- current_date | century_ | quarter_ | decade_ | year_ | month_ | day_ | hour_ | minute_ | dow_ | doy_ | timezone_
-- 2025-11-03    | 21       | 4        | 202     | 2025  | 11     | 3    | 11     | 25      | 1    | 307  | 0

-- 🧠 Tip: DATE_PART() is similar to EXTRACT(), but EXTRACT() returns a numeric type, while DATE_PART() returns double precision.

--📘EXTRACT
-- The EXTRACT() function retrieves a specific field from a date/time value.
-- It returns the extracted part as a NUMERIC value.

-- EXTRACT(field FROM source)
-- CENTURY, DECADE, YEAR, MONTH, DAY, HOUR, MINUTE, SECOND, DOW (day of week),
-- DOY (day of year), WEEK, TIMEZONE, MILLENNIUM, MICROSECONDS, etc.

SELECT 
    CURRENT_DATE,                                         -- Current system date
    
    EXTRACT(CENTURY FROM CURRENT_DATE) AS century_,       -- 21 → 21st century
    EXTRACT(QUARTER FROM CURRENT_DATE) AS quarter_,       -- 4 → 4th quarter of the year
    EXTRACT(DECADE FROM CURRENT_DATE) AS decade_,         -- 202 → represents 2020s
    EXTRACT(YEAR FROM CURRENT_DATE) AS year_,             -- 2025
    EXTRACT(MONTH FROM CURRENT_DATE) AS month_,           -- 11 → November
    EXTRACT(DAY FROM CURRENT_DATE) AS day_,               -- 3 → day of the month
    EXTRACT(HOUR FROM CURRENT_TIME) AS hour_,             -- current hour (0–23)
    EXTRACT(MINUTE FROM CURRENT_TIME) AS minute_,         -- current minute
    EXTRACT(DOW FROM CURRENT_DATE) AS dow_,               -- day of week (0=Sunday)
    EXTRACT(DOY FROM CURRENT_DATE) AS doy_,               -- day of year (1–365)
    EXTRACT(TIMEZONE FROM CURRENT_TIME) AS timezone_;     -- timezone offset in seconds

-- 💡 Example Output:
-- current_date | century_ | quarter_ | decade_ | year_ | month_ | day_ | hour_ | minute_ | dow_ | doy_ | timezone_
-- 2025-11-03    | 21       | 4        | 202     | 2025  | 11     | 3    | 11     | 28      | 1    | 307  | 0

-- ⚖️ NOTE:
-- EXTRACT() and DATE_PART() perform the same operation.
-- The only difference is in syntax style and the return type precision.
-- ✅ EXTRACT() → returns numeric
-- ✅ DATE_PART() → returns double precision

## 🧩 Date Functions Comparison

-----| Function | Description | Syntax Style | Returns | Example | Result |

--| EXTRACT() | Extracts a specific part (such as year, month, or day) from a date/time value | SQL Standard | Numeric value | `EXTRACT(YEAR FROM CURRENT_DATE)` | `2025` |
--| DATE_PART()| Extracts a specific part of a date/time (PostgreSQL version of EXTRACT) | PostgreSQL Style | Double precision | `DATE_PART('year', CURRENT_DATE)` | `2025` |
--| DATE_TRUNC()| Truncates a date/time to a specified level (rounds down to month, day, etc.) | PostgreSQL Style | Timestamp | `DATE_TRUNC('month', CURRENT_TIMESTAMP)` | `2025-11-01 00:00:00` |

---

### 💡 Notes
-- `EXTRACT()` and `DATE_PART()` both return **numbers**, while `DATE_TRUNC()` returns a **timestamp**.  
-- Use `DATE_TRUNC()` when grouping by **time periods** (e.g., months, quarters).  
-- Use `EXTRACT()` or `DATE_PART()` when you need to **calculate or filter** based on date parts.

-- 🧠 Summary (for notes)
-- CURRENT_DATE   → Current date
-- CURRENT_TIME   → Current time (with time zone)
-- LOCALTIME      → Current time (no time zone)
-- NOW()          → Current timestamp with time zone
-- TIMEOFDAY()    → Current date/time as text
-- AGE()          → Difference between two dates
-- DATE_PART()    → Extracts part of a date/time (PostgreSQL style)
-- EXTRACT()      → Extracts part of a date/time (SQL standard style)
-- DATE_TRUNC()   → Truncate timestamp to specific precision