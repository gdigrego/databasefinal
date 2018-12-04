DROP TABLE IF EXISTS chess;

CREATE TABLE chess (
	id VARCHAR(255),
	rated boolean,
	created_at VARCHAR(255),
	last_move_at VARCHAR(255),
	turns int,
	victory_status VARCHAR(255),
	winner VARCHAR(255),
	increment_code VARCHAR(255),
	white_id VARCHAR(255),
	white_rating int,
	black_id VARCHAR(255),
	black_rating int,
	moves VARCHAR(2048),
	opening_eco VARCHAR(255),
	opening_name VARCHAR(255),
	opening_ply int
);

\COPY chess FROM 'games.csv' DELIMITER ',' CSV HEADER;
