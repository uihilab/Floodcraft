# load.mcfunction - Initializes the master progression variables and AI NPC configuration

# 1. Initialize Scoreboards
scoreboard objectives add gp_completed dummy "Completed Levels"
scoreboard objectives add gp_victory dummy "Victory State"
scoreboard objectives add return_to_lobby trigger "Return to Lobby Trigger"
scoreboard objectives add show_tasks trigger "Show Tasks Trigger"
scoreboard objectives add watch_video trigger "Watch Video Link Trigger"

# Ensure objectives are set (only if not already set to prevent reset on load)
execute unless score #sd_won gp_completed matches 0..1 run scoreboard players set #sd_won gp_completed 0
execute unless score #wr_won gp_completed matches 0..1 run scoreboard players set #wr_won gp_completed 0
execute unless score #sd2_won gp_completed matches 0..1 run scoreboard players set #sd2_won gp_completed 0
execute unless score #sf_won gp_completed matches 0..1 run scoreboard players set #sf_won gp_completed 0
execute unless score #sr_won gp_completed matches 0..1 run scoreboard players set #sr_won gp_completed 0
execute unless score #victory_triggered gp_victory matches 0..1 run scoreboard players set #victory_triggered gp_victory 0

# 2. Initialize NBT Storage for CreatureChat prompts (if not already set)
execute unless data storage arnis:progress sd run data modify storage arnis:progress sd set value "Sandbag Defense"
execute unless data storage arnis:progress wr run data modify storage arnis:progress wr set value "Wildlife Rescue"
execute unless data storage arnis:progress sd2 run data modify storage arnis:progress sd2 set value "Storm Drains"
execute unless data storage arnis:progress sf run data modify storage arnis:progress sf set value "Save the Furniture"
execute unless data storage arnis:progress sr run data modify storage arnis:progress sr set value "Spillway Repair"

# 3. Setup selection wall and clean up Guide NPC
function game_progression:setup_npc

# 4. Keep it always daytime and weather clear, disable death messages
gamerule doDaylightCycle false
time set day
gamerule doWeatherCycle false
weather clear
gamerule showDeathMessages false

# 5. Set default world spawn to Sandbag Defense start
setworldspawn 1221 -54 706 180


