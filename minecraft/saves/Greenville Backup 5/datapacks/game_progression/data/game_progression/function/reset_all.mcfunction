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
scoreboard players set #state tent_state 0
scoreboard players set #state relief_state 0

# Reset storage progress keys
data remove storage arnis:progress sd
data remove storage arnis:progress wr
data remove storage arnis:progress sd2
data remove storage arnis:progress sf
data remove storage arnis:progress sr

# Teleport player and Guide NPC to Level 1 (Save the Furniture)

# Revoke converse tags on reset
tag @a remove talked_to_guide
tag @a remove watched_sandbag_video
advancement revoke @a only creaturechat:ice_breaker
tp @a 707.5 -47.0 470.5 180 0
scoreboard players set #guide guide_state 0
kill @e[type=easy_npc:chicken]

# Print confirmation
tellraw @a [{"text":"[System] ","color":"gold","bold":true},{"text":"Greenville game progression reset successfully!","color":"green"}]
