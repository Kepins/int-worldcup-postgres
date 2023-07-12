DELETE FROM match;
DELETE FROM team;
--resets serials to 1
ALTER SEQUENCE match_id_seq RESTART;
ALTER SEQUENCE team_id_seq RESTART;

