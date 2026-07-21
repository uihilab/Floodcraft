# load.mcfunction - Initializes the master progression scoreboards
scoreboard objectives add gp_completed dummy "Completed Levels"
scoreboard objectives add gp_victory dummy "Victory State"

# Ensure objectives are set to 0 initially if not set
execute unless score #sd_won gp_completed matches 0..1 run scoreboard players set #sd_won gp_completed 0
execute unless score #sd2_won gp_completed matches 0..1 run scoreboard players set #sd2_won gp_completed 0
execute unless score #sf_won gp_completed matches 0..1 run scoreboard players set #sf_won gp_completed 0
execute unless score #wr_won gp_completed matches 0..1 run scoreboard players set #wr_won gp_completed 0
execute unless score #sr_won gp_completed matches 0..1 run scoreboard players set #sr_won gp_completed 0
execute unless score #victory_triggered gp_victory matches 0..1 run scoreboard players set #victory_triggered gp_victory 0

# Register video trigger
scoreboard objectives add watch_video trigger "Watch Video Link Trigger"

# Keep it always daytime and weather clear, disable death messages
gamerule doDaylightCycle false
time set day
gamerule doWeatherCycle false
weather clear
gamerule showDeathMessages false
gamerule sendCommandFeedback false
gamerule commandBlockOutput false
