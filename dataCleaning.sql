-- data cleaning
-- RENAME TABLE test to household_income_backup;
SELECT *
FROM household_income
;
SELECT *
FROM income_statistics;

SELECT COUNT(id)
FROM household_income
;
SELECT COUNT(id)
FROM income_statistics
;

SELECT id, COUNT(id)
FROM household_income
GROUP BY id
HAVING COUNT(id) > 1
;
-- identifying duplicates
SELECT *
FROM(
SELECT row_id, id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS RowNum
FROM household_income) duplicates
WHERE RowNum > 1
;

-- deleting duplicates
DELETE FROM household_income
WHERE row_id IN(
SELECT row_id
FROM(
SELECT row_id, id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS RowNum
FROM household_income
) duplicates
WHERE RowNum > 1
)
;

SELECT id, COUNT(id)
FROM income_statistics
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT State_Name, COUNT(State_Name)
FROM household_income
GROUP BY State_Name
;

SELECT DISTINCT State_Name
FROM household_income
ORDER BY 1
;

UPDATE household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT *
FROM household_income
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE household_income 
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;


SELECT Type, COUNT(Type)
FROM household_income
GROUP BY Type
;

UPDATE household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

SELECT ALand, AWater
FROM household_income 
WHERE (AWater = 0 OR AWATER = '' OR AWATER IS NULL)
AND (ALand = 0 OR ALand = '' OR ALand IS NULL)
;
SELECT ALand, AWater
FROM household_income 
-- WHERE AWater = 0 OR AWATER = '' OR AWATER IS NULL
WHERE ALand = 0 OR ALand = '' OR ALand IS NULL
;
