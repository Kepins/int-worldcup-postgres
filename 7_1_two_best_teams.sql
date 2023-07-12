CREATE TEMPORARY TABLE temp_points(
   id integer,
   points integer,
   scored integer,
   conceded integer
);


-- insert all points for first_teams
INSERT INTO temp_points
SELECT first_team_id AS id, 
CASE 
	WHEN first_team_score > second_team_score THEN 3 --first team wins
	WHEN first_team_score < second_team_score THEN 0 --first team loses
	ELSE 1 --draw
END AS points,
first_team_score AS scored,
second_team_score AS conceded
FROM match;

-- insert all points for second_teams
INSERT INTO temp_points
SELECT second_team_id AS id, 
CASE 
	WHEN second_team_score > first_team_score THEN 3 --second team wins
	WHEN second_team_score < first_team_score THEN 0 --second team loses
	ELSE 1 --draw
END AS points,
second_team_score AS scored,
first_team_score AS conceded
FROM match;

--select only two first teams
SELECT id, name FROM(
	SELECT team.id AS id, team.name AS name, SUM(scored) AS scored, SUM(conceded) AS conceded, SUM(scored)-SUM(conceded) AS goal_diff, SUM(points) AS points
	FROM temp_points
	JOIN team ON team.id = temp_points.id
	GROUP BY team.id, team.name
	ORDER BY points DESC, goal_diff DESC, scored DESC
) AS scores
LIMIT 2;

--drop temporary table
DROP TABLE temp_points;

