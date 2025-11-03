# 📅 PostgreSQL Date Functions — Exercise

## 🧩 Question

> **Using today’s date**, create an output like the one below.  
> And do it in **two different ways**.

## 🧠 Method 1 — Using `DATE_PART()`

SELECT
    DATE_PART('quarter', CURRENT_DATE) AS quarter_,
    DATE_PART('year', CURRENT_DATE) AS year_,
    DATE_PART('month', CURRENT_DATE) AS month_,
    DATE_PART('doy', CURRENT_DATE) AS doy_;

## ⚙️ Method 2 — Using EXTRACT()

SELECT
    EXTRACT(QUARTER FROM CURRENT_DATE) AS quarter_,
    EXTRACT(YEAR FROM CURRENT_DATE) AS year_,
    EXTRACT(MONTH FROM CURRENT_DATE) AS month_,
    EXTRACT(DOY FROM CURRENT_DATE) AS doy_;
	
	Quarter is: 4, Year is: 2025, Month is: 11, Doy is: 307
