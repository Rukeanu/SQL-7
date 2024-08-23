SELECT address, round((MAX(age) - MIN(age) / MAX(age::numeric)), 2) AS formula,
round(AVG(age), 2) AS "average",
round((MAX(age) - MIN(age) / MAX(age::numeric)),2) > round(AVG(age), 2) AS comparison
FROM person
GROUP BY address
ORDER BY address;