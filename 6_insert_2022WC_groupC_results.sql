INSERT INTO team (name) 
VALUES
	('Argentina'),
	('Poland'),
	('Saudi Arabia'),
	('Mexico')
;


INSERT INTO match(first_team_id, second_team_id, first_team_score, second_team_score) 
VALUES 
(
	(SELECT id FROM team WHERE name = 'Argentina'),
	(SELECT id FROM team WHERE name = 'Saudi Arabia'),
	1,
	2
),
(
	(SELECT id FROM team WHERE name = 'Mexico'),
	(SELECT id FROM team WHERE name = 'Poland'),
	0,
	0
),
(
	(SELECT id FROM team WHERE name = 'Poland'),
	(SELECT id FROM team WHERE name = 'Saudi Arabia'),
	2,
	0
),
(
	(SELECT id FROM team WHERE name = 'Argentina'),
	(SELECT id FROM team WHERE name = 'Mexico'),
	2,
	0
),
(
	(SELECT id FROM team WHERE name = 'Poland'),
	(SELECT id FROM team WHERE name = 'Argentina'),
	0,
	2
),
(
	(SELECT id FROM team WHERE name = 'Saudi Arabia'),
	(SELECT id FROM team WHERE name = 'Mexico'),
	1,
	2
);

