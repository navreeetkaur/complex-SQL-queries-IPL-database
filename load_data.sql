DELETE FROM player;
DELETE FROM team;
DELETE FROM match;
DELETE FROM player_match;
DELETE FROM ball_by_ball;
DELETE FROM batsman_scored;
DELETE FROM wicket_taken;
DELETE FROM extra_runs;

COPY player FROM '.data/player.csv' (FORMAT CSV, ENCODING 'UTF8');
COPY team FROM '.data/team.csv' (FORMAT CSV, ENCODING 'UTF8');
COPY match FROM '.data/match.csv' (FORMAT CSV, ENCODING 'UTF8');
COPY player_match FROM '.data/player_match.csv' (FORMAT CSV, ENCODING 'UTF8');
COPY ball_by_ball FROM '.data/ball_by_ball.csv' (FORMAT CSV, ENCODING 'UTF8');
COPY batsman_scored FROM '.data/batsman_scored.csv' (FORMAT CSV, ENCODING 'UTF8');
COPY wicket_taken FROM '.data/wicket_taken.csv' (FORMAT CSV, ENCODING 'UTF8');
COPY extra_runs FROM '/.data/extra_runs.csv' (FORMAT CSV, ENCODING 'UTF8');