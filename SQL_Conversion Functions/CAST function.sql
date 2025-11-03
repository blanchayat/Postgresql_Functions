
-- SQL CONVERSION FUNCTION – CAST()
   The CAST() function converts a value from one data type 
   into another. It is a standard SQL function and is widely 
   used for ensuring data compatibility and accuracy.
   🧩 SYNTAX
   -----------------------------------------------------------
-- CAST(expression AS target_type)

   ➤ expression  → The value or column you want to convert.
   ➤ target_type → The new data type.

   -----------------------------------------------------------
   🧩 POSTGRESQL SHORTHAND SYNTAX
   -----------------------------------------------------------
       expression::type
   Example:
       SELECT '100'::INTEGER;   -- Same as CAST('100' AS INTEGER)

   ===========================================================
   🧠 CAST FUNCTION EXAMPLES
   ----------------------------------------------------------- */

SELECT 
    '100'::INTEGER                  AS cast1,  -- Converts text to integer → Output: 100
    '01-OCT-2015'::DATE             AS cast2,  -- Converts string to date → Output: 2015-10-01
    598::VARCHAR                    AS cast3,  -- Converts number to string → Output: '598'
    '2019-06-15 14:30:20'::TIMESTAMP AS cast4, -- Converts string to timestamp → Output: 2019-06-15 14:30:20
    '15 minute'::INTERVAL           AS cast5,  -- Interval: 15 minutes
    '2 hour'::INTERVAL              AS cast6,  -- Interval: 2 hours
    '1 day'::INTERVAL               AS cast7,  -- Interval: 1 day
    '2 week'::INTERVAL              AS cast8,  -- Interval: 2 weeks
    '3 month'::INTERVAL             AS cast9;  -- Interval: 3 months

/* ===========================================================
   🧩 OUTPUT (Example Result)
   -----------------------------------------------------------
   cast1 | cast2      | cast3 | cast4               | cast5     | cast6   | cast7 | cast8 | cast9
   -------+-------------+--------+--------------------+-----------+---------+--------+--------+---------
     100  | 2015-10-01 | 598    | 2019-06-15 14:30:20| 00:15:00  | 02:00:00| 1 day  | 14 days| 3 mons
   -----------------------------------------------------------

   ===========================================================
   🧾 COMMON USES
   -----------------------------------------------------------
   🔹 Convert text to numeric/date/timestamp formats.
   🔹 Prepare data for calculations or date operations.
   🔹 Ensure consistent data types in SELECT or JOIN queries.
   🔹 Format values for display or reporting.

   ===========================================================
   ✅ SUMMARY TABLE
   -----------------------------------------------------------
   PURPOSE                  | EXAMPLE
   --------------------------|-----------------------------------
   Text → Integer            | CAST('123' AS INTEGER)
   Text → Date               | '2025-11-03'::DATE
   Number → Text             | 123::VARCHAR
   Text → Timestamp          | '2024-08-10 09:45'::TIMESTAMP
   Text → Interval           | '5 day'::INTERVAL
   -----------------------------------------------------------

   🧠 KEY POINTS:
   🔸 CAST() is the ANSI SQL standard syntax.
   🔸 The PostgreSQL shorthand (::) is more compact.
   🔸 Always match format patterns to your data strings.
	
