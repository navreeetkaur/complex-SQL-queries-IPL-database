CREATE  TABLE player(
	player_id int PRIMARY KEY,
	player_name text,
	dob date,
	batting_hand text,
	bowling_skill text,
	country_name text
);

CREATE TABLE team(
	team_id int PRIMARY KEY,
	name text
);

CREATE TABLE match(
	match_id int PRIMARY KEY,
	team_1 int,
	team_2 int,
	match_date date,
	season_id int,
	venue text,
	toss_winner int,
	toss_decision text,
	win_type text,
	win_margin int,
	outcome_type text,
	match_winner int,
	man_of_the_match int
);

CREATE TABLE player_match(
	match_id int NOT NULL,
	player_id int NOT NULL,
	role text,
	team_id int,
	CONSTRAINT pk_player_match PRIMARY KEY(match_id, player_id)
);

CREATE TABLE ball_by_ball(
	match_id int NOT NULL,
	over_id int NOT NULL,
	ball_id int NOT NULL,
	innings_no int NOT NULL,
	team_batting int,
	team_bowling int,
	striker_batting_position int,
	striker int,
	non_striker int,
	bowler int,
	CONSTRAINT pk_ball_by_ball PRIMARY KEY(match_id, over_id, ball_id, innings_no)
);

CREATE TABLE batsman_scored(
	match_id int NOT NULL,
	over_id int NOT NULL,
	ball_id int NOT NULL,
	runs_scored int,
	innings_no int NOT NULL,
	CONSTRAINT pk_batsman_scored PRIMARY KEY(match_id, over_id, ball_id, innings_no)
);

CREATE TABLE wicket_taken(
	match_id int NOT NULL,
	over_id int NOT NULL,
	ball_id int NOT NULL,
	player_out int,
	kind_out text,
	innings_no int NOT NULL,
	CONSTRAINT pk_wicket_taken PRIMARY KEY(match_id, over_id, ball_id, innings_no)
);

CREATE TABLE extra_runs(
	match_id int NOT NULL,
	over_id int NOT NULL,
	ball_id int NOT NULL,
	extra_type text,
	extra_runs int,
	innings_no int NOT NULL,
	CONSTRAINT pk_extra_runs PRIMARY KEY(match_id, over_id, ball_id, innings_no)
);







