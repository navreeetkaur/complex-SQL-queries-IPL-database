--1--
SELECT player_name FROM player WHERE batting_hand = 'Left-hand bat' and country_name = 'England' ORDER BY player_name;
--2------------------------------------------
SELECT player_name, age
FROM (SELECT player_id, player_name, DATE_PART('year','2018-12-02'::date) - DATE_PART('year', dob) AS age FROM player WHERE bowling_skill='Legbreak googly') AS derived4
WHERE age >= 28
ORDER BY age DESC, player_name ASC;
--3--
SELECT match_id, toss_winner FROM match WHERE toss_decision = 'bat' ORDER BY match_id;
--4-- (take into account extra_runs also)
SELECT over_id, SUM(runs_scored) AS runs_scored
FROM batsman_scored 
WHERE match_id = 335987
GROUP BY over_id
ORDER BY runs_scored DESC, over_id ASC;
--5--
SELECT player_name
FROM player
WHERE player_id IN (SELECT DISTINCT player_out FROM wicket_taken WHERE kind_out = 'bowled')
ORDER BY player_name;
--6--
SELECT match_id, team_1, team_2, match_winner AS winning_team_name, win_margin
FROM match 
WHERE win_margin>=60 
ORDER BY win_margin, match_id;
--7--
SELECT DISTINCT player_name 
FROM (SELECT player_name, batting_hand, DATE_PART('year','2018-12-02'::date) - DATE_PART('year', dob) AS age FROM player) AS derived7
WHERE batting_hand = 'Left-hand bat' and age<30
ORDER BY player_name;
--8--
SELECT derived8_1.match_id AS match_id, (total1 + total2) AS total_runs
FROM(SELECT match_id, SUM(runs_scored) AS total1
		FROM batsman_scored
		GROUP BY match_id) AS derived8_1, 
	(SELECT match_id, SUM(extra_runs) AS total2
		FROM extra_runs
		GROUP BY match_id) AS derived8_2
WHERE (derived8_1.match_id = derived8_2.match_id)
ORDER BY match_id;
--9--
SELECT derived9_1.match_id AS match_id, derived9_1.maximum_runs AS maximum_runs, ball_by_ball.bowler AS player_name
FROM	
	(
	SELECT derived9.match_id AS match_id, derived9.over_idas AS over_id, derived9.ball_id AS ball_id, derived9.innings_no AS innings_no, MAX(derived9.max_score) AS maximum_runs, 
	FROM (
		WITH max_bats_scored AS 
				(SELECT match_id, over_id, ball_id, innings_no, MAX(runs_scored) as max_runs1
				FROM batsman_scored
				GROUP BY match_id),
			max_extra_scored AS 
				(SELECT match_id, over_id, ball_id, innings_no, MAX(extra_runs) as max_runs2
				FROM extra_runs
				GROUP BY match_id)
		SELECT max_bats_scored.match_id AS match_id, max_bats_scored.over_id AS over_id, max_bats_scored.ball_id AS ball_id, max_bats_scored.innings_no AS innings_no, 
				MAX(max_bats_scored.max_runs1, max_extra_scored.max_runs2) AS max_score
		FROM max_bats_scored JOIN max_extra_scored ON max_bats_scored.match_id = max_extra_scored.match_id and
														max_bats_scored.over_id = max_extra_scored.over_id and
														max_bats_scored.ball_id = max_extra_scored.ball_id and
														max_bats_scored.innings_no = max_extra_scored.innings_no
		) AS derived9
	GROUP BY match_id, over_id
	) AS derived9_1, ball_by_ball 
WHERE 	derived9_1.match_id = ball_by_ball.match_id and
		derived9_1.over_id = ball_by_ball.over_id and
		derived9_1.ball_id = ball_by_ball.ball_id and
		derived9_1.innings_no = ball_by_ball.innings_no
ORDER BY match_id, over_id;
--10--
SELECT striker_batting
(SELECT match_id, over_id, ball_id, innings_no
FROM wicket_taken
WHERE kind_out = 'run out')

















