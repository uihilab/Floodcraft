# check.mcfunction - Evaluates win/lose conditions

# Win condition: All 6 pets have been rescued
execute if score #rescued wr_score matches 2.. run function wildlife_rescue:win

# Lose condition 1: Timer runs out (reaches 0)
execute if score #time wr_timer matches ..0 run function wildlife_rescue:fail

# Lose condition 2: Player dies (wr_deaths >= 1)
execute if entity @a[scores={wr_deaths=1..}] run function wildlife_rescue:fail
