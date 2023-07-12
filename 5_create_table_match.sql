CREATE TABLE match(
	id SERIAL PRIMARY KEY,
	first_team_id INTEGER NOT NULL,
	second_team_id INTEGER NOT NULL,
	first_team_score INTEGER NOT NULL,
	second_team_score INTEGER NOT NULL,
	FOREIGN KEY (first_team_id)
		REFERENCES team (id),
  	FOREIGN KEY (second_team_id)
		REFERENCES team (id)
);
