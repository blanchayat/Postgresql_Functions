-- 🧩Basic character operations

SELECT 
    first_name, 
    last_name,
    CONCAT(first_name, ' ', last_name) AS f1,        -- Combine first & last name
    CONCAT_WS(',', first_name, last_name) AS f2,     -- Combine with comma separator
    LEFT(first_name, 1) AS f3,                       -- First letter of first_name
    RIGHT(first_name, 1) AS f4,                      -- Last letter of first_name
    LPAD(phone_number, 14, '00') AS f6,              -- Add '00' to the left
    RPAD(phone_number, 14, '00') AS f7               -- Add '00' to the right
FROM employees;


-- 🧩 Advanced string and character functions

SELECT 
    first_name, 
    last_name,
    LENGTH(last_name) AS f5,                          -- number of characters
    REPLACE(first_name, 'e', ' * ') AS f8,            -- replace 'e' with ' * '
    SPLIT_PART(hire_date::varchar, '-', 2) AS f9,     -- find the month from date
    -- SPLIT_PART(hire_date::varchar, '-', 1) gives the year

    SUBSTRING(last_name, 2, 3) AS f10,                -- take 3 chars starting from 2nd
    POSITION('a' IN first_name) AS f11,               -- position of first 'a'
    REVERSE(first_name) AS f12                        -- reverse the string
FROM employees;

-- 🧠 Notes:
-- REPLACE and POSITION are case-sensitive.
-- Use LOWER() if you want to make them case-insensitive.

💡 WHAT I LEARNED
------------------------------------------------------------
🎯 CONCAT() - join two or more strings
🎯 CONCAT_WS() - join strings with a separator
🔠 LEFT() - get characters from the left side
🔠 RIGHT() - get characters from the right side
🧱 LPAD() / RPAD() - pad a string with characters
🔢 LENGTH() - count how many characters
🔁 REPLACE() - replace one part of a string
🧩 SPLIT_PART() - split a string by a delimiter
✂️ SUBSTRING() - take part of a string by position
🔍 POSITION() - find the index of a character
↩️ REVERSE() - reverse the string

--❓ QUESTION 1
--Find movies with the word "Hunter" in the description field in 3 different ways. 
--Search should be case sensitive.


-- ❌ Wrong Way (not correct)
SELECT title, description,
       POSITION('%Hunter%' IN description)
FROM film;
-- Wrong because '%' cannot be used inside POSITION()
-- It does not search text patterns like LIKE does.


-- ✅ WAY 1 - Using LIKE (case-sensitive)
SELECT title, description
FROM film
WHERE description LIKE '%Hunter%';
-- Finds only rows where description includes 'Hunter'
-- Remember: case-sensitive, so 'hunter' will NOT match.

-- ✅ WAY 2 - Using INITCAP() + LIKE
SELECT title, description
FROM film
WHERE INITCAP(description) LIKE '%Hunter%';
-- INITCAP() makes every word start with a capital letter.
-- Useful if you want to match proper names like 'Hunter'.


-- ✅ WAY 3 (Important) - Using POSITION()
SELECT title, description
FROM film
WHERE POSITION('Hunter' IN description) > 0;
-- POSITION() returns where 'Hunter' starts in the text.
-- If result > 0 → 'Hunter' exists.

--💡 WHAT I LEARNED
--🔍 LIKE - checks if a pattern exists in a string
--🔡 INITCAP() - capitalizes first letter of each word
--📍 POSITION() - finds the location of text inside a string

--❓ QUESTION 2
--combine the first_name, last_name and email fields in the film table with a space between them.
--and, do this operation in 3 diffrent ways.

-- ✅ WAY 1 - Using CONCAT()
SELECT 
    first_name, 
    last_name,
    CONCAT(first_name, ' ', last_name, ' ', email) AS f1
FROM employees;
-- CONCAT() joins multiple columns or strings together.
-- Here, spaces are manually added between fields.

-- ✅ WAY 2 - Using CONCAT_WS() (Concatenate With Separator)
--Use CONCAT_WS() when you have many columns
SELECT 
    first_name, 
    last_name,
    CONCAT_WS(' ', first_name, last_name, email) AS f2
FROM employees;
-- CONCAT_WS() automatically adds the given separator (' ')
-- between all columns. Cleaner and shorter than CONCAT().

-- ✅ WAY 3 - Using || (Concatenation Operator)
SELECT 
    first_name, 
    last_name,
    first_name || ' ' || last_name || ' ' || email AS f3
FROM employees;
-- The || operator is another way to merge text fields.
-- Works in PostgreSQL, Oracle, and many other SQL systems.

--💡 WHAT I LEARNED
--🔗 CONCAT() - joins multiple strings together
--🔗 CONCAT_WS() - joins strings using a separator
--🧱 || (Double Pipe) - concatenation operator in SQL