-- EDA
-- order by 1, 2, 3 is the place of column name in the select statement 
-- as in state name is at 1, aland is 2, awater is 3
-- in this query checking the order by awater 
SELECT State_Name, SUM(ALand),SUM(AWater)
FROM household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10 
;

SELECT *
FROM household_income u
JOIN income_statistics us
	ON u.id = us.id
WHERE Mean <> 0;
;

SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM household_income u
INNER JOIN income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
;

SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM household_income u 
INNER JOIN income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 10
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM household_income u 
INNER JOIN income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type)>100
ORDER BY 4 DESC
LIMIT 20
;


SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM household_income u 
JOIN income_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC
;


SELECT *
FROM household_income 
WHERE Type = 'Community'
;


SELECT * 
FROM household_income
;

SELECT *
FROM income_statistics
;
