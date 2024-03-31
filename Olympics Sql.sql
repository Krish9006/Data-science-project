CREATE DATABASE olympics_db;

USE olympics_db;

SELECT * FROM olympics;

SELECT name,medal FROM olympics;

SELECT COUNT(name) AS total_number_of_athletes FROM olympics;

SELECT * FROM olympics WHERE medal='Gold';

SELECT name,year FROM olympics WHERE medal='silver';

SELECT 
    team,
    SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM 
    olympics
WHERE 
    medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY 
    team;

SELECT team 
FROM olympics 
WHERE medal LIKE 'Gold'
GROUP BY team
HAVING count(medal='Gold')>50;

SELECT name FROM olympics GROUP BY name  ORDER BY COUNT(medal) DESC LIMIT 1;

SELECT event FROM olympics WHERE event LIKE '%Freestyle%';

SELECT name,count(medal) AS total_numbers_of_medals FROM olympics GROUP BY name  ORDER BY COUNT(medal) DESC LIMIT 3;

SELECT distinct name, COUNT(*) AS total_medals
FROM olympics
GROUP BY name
HAVING COUNT(*) > 1;

SELECT DISTINCT team 
FROM olympics
WHERE medal='Gold' AND (season='Summer' OR season='Winter');

SELECT team, MAX(year) - MIN(year) AS year_difference
FROM olympics
GROUP BY team;

SELECT team, COUNT(medal) / COUNT(DISTINCT name) AS avg_medals_per_athlete
FROM olympics
GROUP BY team;

SELECT team
FROM (
    SELECT team, sport, medal
    FROM olympics
    GROUP BY team, sport, medal
) AS medal_counts
GROUP BY team
HAVING COUNT(DISTINCT sport) > 10;