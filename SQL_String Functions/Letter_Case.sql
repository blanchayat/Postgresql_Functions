--String Functions-Letter Case 

SELECT title,
 lower(title) lo_title,
 upper(title) up_title,
 initcap(title) ic_title
from film;

-- Without LOWER() – may return no results if case differs:
SELECT * 
FROM film
WHERE title LIKE '%trip%';

-- With LOWER() – ensures all text is compared in lowercase:
SELECT * 
FROM film
WHERE LOWER(title) LIKE '%trip%';

-- Question:
-- Write a query that returns movies with the words 
-- "drama" and "Australia" in the description field.
-- The search should not be case sensitive.

--wrong answer
SELECT title,description AS description_new FROM film
WHERE LOWER(description) like '%drama%'

-- ✅ Correct Answer (using LOWER for portability)
SELECT 
    UPPER(title) AS title_new,
    LOWER(description) AS description_new
FROM film
WHERE LOWER(description) LIKE '%drama%'
  AND LOWER(description) LIKE '%australia%';

-- Alternative using ILIKE (PostgreSQL only)
-- The ILIKE operator performs a case-insensitive search
-- without needing LOWER(). (Not supported in Oracle.)

SELECT 
    UPPER(title) AS title_new,
    LOWER(description) AS description_new
FROM film
WHERE description ILIKE '%drama%'
  AND description ILIKE '%australia%';

--💡 WHAT I LEARNED
------------------------------------------------------------
-- How to use string case functions:
 -- • LOWER()   → Converts text to lowercase
 --• UPPER()   → Converts text to uppercase
 --• INITCAP() → Capitalizes the first letter of each word

--💡 How to search text without case sensitivity using:
 --• LOWER(column) with LIKE
 --• ILIKE operator (PostgreSQL only)

-- How to use column aliases for clearer output names
-- How to apply string functions in real-world examples