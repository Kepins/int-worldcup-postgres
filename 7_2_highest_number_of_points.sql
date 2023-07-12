CREATE TEMPORARY TABLE temp_points(
   id integer,
   points integer
);


-- insert all points for first_teams
INSERT INTO temp_points
SELECT first_team_id AS id, 
CASE 
	WHEN first_team_score > second_team_score THEN 3 --first team wins
	WHEN first_team_score < second_team_score THEN 0 --first team loses
	ELSE 1 --draw
END AS points
FROM match;

-- insert all points for second_teams
INSERT INTO temp_points
SELECT second_team_id AS id, 
CASE 
	WHEN second_team_score > first_team_score THEN 3 --second team wins
	WHEN second_team_score < first_team_score THEN 0 --second team loses
	ELSE 1 --draw
END AS points
FROM match;

SELECT MAX(points) FROM
(
	SELECT SUM(points) AS points
	FROM temp_points
	GROUP BY id
)AS points;


--drop temporary table
DROP TABLE temp_points;
