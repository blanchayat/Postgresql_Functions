--📚 SQL MATH FUNCTIONS

SELECT
    -- 🔹 ROUND(x): Rounds the number to the nearest integer
    ROUND(14.45) AS "Round (ROUND)",           -- 14.45 → 14

    -- 🔹 CEIL(x): Rounds the number up to the nearest integer
    CEIL(14.45) AS "Ceiling (CEIL)",           -- 14.45 → 15

    -- 🔹 FLOOR(x): Rounds the number down to the nearest integer
    FLOOR(14.45) AS "Floor (FLOOR)",           -- 14.45 → 14

    -- 🔹 ABS(x): Returns the absolute (positive) value of a number
    ABS(-5.78) AS "Absolute (ABS)",            -- -5.78 → 5.78

    -- 🔹 POWER(x, y): Returns x raised to the power of y
    POWER(4, 3) AS "Power (POWER)",            -- 4³ → 64

    -- 🔹 SIGN(x): Returns the sign of a number
    -- -1 if negative, 0 if zero, +1 if positive
    SIGN(-5) AS "Sign (SIGN)",                 -- -5 → -1

    -- 🔹 TRUNC(x): Truncates (removes) the decimal part of a number
    TRUNC(4836.98) AS "Truncate (TRUNC)"       -- 4836.98 → 4836

---------------------------------------------------------------------------
SELECT 
    payment_id,
    amount,

    -- 🧮 Calculate 45% of the amount
    (amount * 0.45) AS percent_amount,

    -- 🔹 ROUND(x, n): Rounds to n decimal places
    ROUND(amount * 0.45, 2) AS f_round,

    -- 🔹 CEIL(x): Rounds up to the nearest integer
    CEIL(amount * 0.45) AS f_ceil,

    -- 🔹 FLOOR(x): Rounds down to the nearest integer
    FLOOR(amount * 0.45) AS f_floor,

    -- 🔹 TRUNC(x): Removes the fractional part
    TRUNC(amount * 0.45) AS f_trunc,

    -- 🔹 MOD(x, y): Returns the remainder after division
    MOD(amount, 5) AS f_mod

FROM payment
LIMIT 10;


 -- Generate a random number between 0 and 1
SELECT random();

-- Generate a random number between 1 and 100 (with decimals)
SELECT random() * 100 + 1 AS ran_num;

-- Generate a random integer between 1 and 100
SELECT floor(random() * 100 + 1)::int AS ran_num;

-- Generate a random integer between any two numbers (low and high)
-- Example: between 50 and 150
SELECT floor(random() * (150 - 50 + 1) + 50)::int AS ran_num;

-- Generate 10 random integers between 100 and 200
SELECT floor(random() * (200 - 100 + 1) + 100)::int AS ran_num
FROM generate_series(1, 10);

--🧩 Functions Overview

| Function | Description | Example | Result |
|-----------|--------------|----------|---------|
| `ROUND(x, n)` | Rounds `x` to `n` decimal places | `ROUND(14.45, 1)` | 14.5 |
| `CEIL(x)` | Rounds up to the nearest integer | `CEIL(3.1)` | 4 |
| `FLOOR(x)` | Rounds down to the nearest integer | `FLOOR(3.9)` | 3 |
| `TRUNC(x)` | Removes the decimal part | `TRUNC(3.9)` | 3 |
| `MOD(x, y)` | Returns the remainder of a division | `MOD(7, 5)` | 2 |
| `RANDOM()` | Generates a random number between 0 and 1 | `SELECT RANDOM();` | 0.5473 (example) |
