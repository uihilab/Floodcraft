# tick.mcfunction - Runs every game tick to check for victory
execute if score #sd_won gp_completed matches 1 if score #wr_won gp_completed matches 1 if score #sd2_won gp_completed matches 1 if score #sf_won gp_completed matches 1 if score #sr_won gp_completed matches 1 if score #victory_triggered gp_victory matches 0 run function game_progression:trigger_victory

# Enable and run video link trigger
scoreboard players enable @a watch_video
execute as @a[scores={watch_video=1..}] run function game_progression:print_video_link
