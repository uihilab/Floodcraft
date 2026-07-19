# Reset all master scoreboards
scoreboard players set #sd_won gp_completed 0
scoreboard players set #wr_won gp_completed 0
scoreboard players set #sd2_won gp_completed 0
scoreboard players set #sf_won gp_completed 0
scoreboard players set #sr_won gp_completed 0
scoreboard players set #victory_triggered gp_victory 0

# Reset individual minigame states
scoreboard players set #state sd_state 0
scoreboard players set #state sd2_state 0
scoreboard players set #state sf_state 0
scoreboard players set #state wr_state 0
scoreboard players set #state spillway_state 0

# Reset storage progress keys
data remove storage arnis:progress sd
data remove storage arnis:progress wr
data remove storage arnis:progress sd2
data remove storage arnis:progress sf
data remove storage arnis:progress sr

# Teleport player and Guide NPC to Level 1 (Sandbag Defense)

# Revoke converse tags on reset
tag @a remove talked_to_guide
tag @a remove watched_sandbag_video
advancement revoke @a only creaturechat:ice_breaker
tp @a 1218.5 -53 704.5 180 0
# tp @e[tag=ai_guide,limit=1] 1223.5 -53.0 706.5 180 0
# easy_npc navigation set pos @e[tag=ai_guide,limit=1] 1223 -53 706
scoreboard players set #guide guide_state 0
scoreboard players set #transition_timer guide_state 0

# Kill all currently spawned guide chickens to force clean recreation on reset
kill @e[type=easy_npc:chicken]

# Print confirmation
tellraw @a [{"text":"[System] ","color":"gold","bold":true},{"text":"St. Bernard Parish game progression reset successfully!","color":"green"}]
# tellraw @a {"text":"<Guide> Welcome to Saint Bernard Parish, Louisiana! Would you like me to tell you about the history of Saint Bernard Parish, or would you like to hear about our 5 game levels?","color":"white"}
