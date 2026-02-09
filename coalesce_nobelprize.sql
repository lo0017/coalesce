----Generate to query this output:
----Display Country name, 4-digit year, count of Nobel prize winners (where the count is ≥ 1), and country size:	
----Large: Population > 100 million
----Medium: Population between 50 and 100 million (inclusive)
----Small: Population < 50 million
----Sort results so that the country and year with the largest number of Nobel prize winners appear at the top.
SELECT country, LEFT(year, 4) AS calendar_year, nobel_prize_winners,
	CASE
 WHEN pop_in_millions::NUMERIC > 100 THEN 'large'
 WHEN pop_in_millions::NUMERIC BETWEEN 50 AND 100 THEN 'medium'
 WHEN pop_in_millions::NUMERIC < 50 THEN 'small'
	END AS pop_cat
FROM countries
	INNER JOIN country_stats
	ON countries.id = country_stats.country_id
WHERE nobel_prize_winners >= 1
ORDER BY nobel_prize_winners DESC;
----Export the results as a CSV file.
----Use Excel to create a chart effectively communicating the findings.


----Create the output below that shows a row for each country and each year. Use COALESCE() to display unknown when the gdp is NULL.
SELECT country, LEFT(year, 4) AS calendar_year, COALESCE(gdp::TEXT::MONEY::TEXT, 'unknown')
FROM countries
	INNER JOIN country_stats
	ON countries.id = country_stats.country_id;