-- SELECT count(*), opening_name FROM chess WHERE moves LIKE 'e4%' GROUP BY opening_name ORDER BY count DESC;

-- SELECT count(DISTINCT opening_name) FROM chess;
--
-- -- graph of top 5 most common opening_names vs number of turns
-- SELECT winner, count(*), SUBSTRING(moves, 1, 3) as str FROM chess GROUP BY winner, str
-- 	HAVING SUBSTRING(moves, 1, 3) LIKE '%e4%' ORDER BY str, count DESC;

-- This gives us total number of each type of opening (including all known variations).
SELECT count(*), (split_part(opening_name, ' ', 1) || ' ' || split_part(split_part(opening_name, ' ', 2), ':', 1)) as name FROM chess GROUP BY name ORDER BY count DESC;

-- This gives us total number of wins for white and black for each type of opening (including all variations).
SELECT count(*), winner, (split_part(opening_name, ' ', 1) || ' ' || split_part(split_part(opening_name, ' ', 2), ':', 1)) as name FROM chess GROUP BY name, winner ORDER BY count DESC;

-- This gives us total number of times each opening move appears in the move column of the 20k games.
SELECT count(*), split_part(moves, ' ', 1) as move FROM chess GROUP BY move ORDER BY count DESC;

-- This gives us total number of wins for white and black for each opening move;
SELECT count(*), winner, split_part(moves, ' ', 1) as move FROM chess GROUP BY move, winner ORDER BY count DESC, move;

-- This gives us the average elo rating of the player using each opening.
SELECT (sum(white_rating) / count((split_part(opening_name, ' ', 1) || ' ' || split_part(split_part(opening_name, ' ', 2), ':', 1)))) as avg, sum(white_rating), count((split_part(opening_name, ' ', 1) || ' ' || split_part(split_part(opening_name, ' ', 2), ':', 1))) as name, (split_part(opening_name, ' ', 1) || ' ' || split_part(split_part(opening_name, ' ', 2), ':', 1)) as nameone
FROM chess GROUP BY nameone HAVING count((split_part(opening_name, ' ', 1) || ' ' || split_part(split_part(opening_name, ' ', 2), ':', 1))) > 20 ORDER BY avg DESC;

SELECT (count(winner) / count(split_part(moves, ' ', 1))) as some, count(*), winner, split_part(moves, ' ', 1)
as move FROM chess GROUP BY move, winner ORDER BY count DESC, move;

SELECT (sum(white_rating) / count(split_part(moves, ' ', 1))) as avg, split_part(moves, ' ', 1) as move from chess
group by move ORDER BY avg DESC;
