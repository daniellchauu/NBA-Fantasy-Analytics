Select 
	p.pos,
	n.Player,
	n.Team,
	ROUND(AVG(
	(fg3 * 3) +
	((fg - fg3) * 2) +
	(ft * 1) +
	(trb * 1.2) +
	(ast * 1.5) +
	(blk * 2) +
	(stl * 2) +
	(tov * -1)), 2) AS avg_fantasy_pts
From NBAstats n 
Join Player_positions p ON n.player = p.player
Group By p.pos, n.Player, n.Team
Order By Avg_Fantasy_Pts Desc
Limit 100; 