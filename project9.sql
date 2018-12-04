-- SELECT count(*), opening_name FROM chess WHERE moves LIKE 'e4%' GROUP BY opening_name ORDER BY count DESC;

SELECT count(DISTINCT opening_name) FROM chess;

-- graph of top 5 most common opening_names vs number of turns
SELECT winner, count(*), SUBSTRING(moves, 1, 3) as str FROM chess GROUP BY winner, str
	HAVING SUBSTRING(moves, 1, 3) LIKE '%e4%' ORDER BY str, count DESC;
