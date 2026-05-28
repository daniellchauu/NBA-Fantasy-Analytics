Select 
	p.pos,
	n.Player,
	(ARRAY_AGG(n.team ORDER BY game_date DESC))[1] AS current_team,
	Count(*) As GP,
	ROUND(AVG(Minutes), 1) AS avg_mins,
	ROUND(AVG(pts), 1) AS avg_pts,
	ROUND(AVG(fg3), 1) AS avg_3pm,
	ROUND(AVG(fg), 1) AS avg_fg,
	ROUND(AVG(ft), 1) AS avg_ft,
	ROUND(AVG(trb), 1) AS avg_reb,
	ROUND(AVG(ast), 1) AS avg_ast,
	ROUND(AVG(blk), 1) AS avg_blk,
	ROUND(AVG(stl), 1) AS avg_stl,
    ROUND(AVG(tov), 1) AS avg_tov
From NBAstats n
Join player_positions p ON n.player = p.player 
Group By p.pos, n.Player
Limit 300; 
