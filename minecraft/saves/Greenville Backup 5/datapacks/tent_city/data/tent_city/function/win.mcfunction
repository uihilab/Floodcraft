title @a title {"text":"YOU WIN!","color":"gold","bold":true}
title @a subtitle {"text":"Follow the path to the Relief Camp!","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Break the spruce boats immediately on win
kill @e[type=minecraft:spruce_boat,x=550,y=-42,z=350,distance=..150]

# Clear the objective book from player inventory
clear @a minecraft:written_book

# Set gamemode back to creative for exploration
gamemode creative @a

# Clear active minigame tags (except permanent citizen tags)
tag @e[type=!player] remove tent_npc_1
tag @e[type=!player] remove tent_npc_2
tag @e[type=!player] remove tent_npc_3
tag @e[type=!player] remove tent_npc_4
tag @e[type=!player] remove rescued
tag @e[type=!player] remove has_hologram
kill @e[tag=seat_1]
kill @e[tag=seat_2]
kill @e[tag=seat_3]
kill @e[tag=seat_4]

# Remove slabs
setblock 546 -43 418 minecraft:air replace
setblock 574 -43 374 minecraft:air replace
setblock 601 -43 339 minecraft:air replace
setblock 615 -43 308 minecraft:air replace

# Set state to 2 (Won)
scoreboard players set #state tent_state 2
scoreboard players set @a tent_score 0

# Make Guide walk to Relief Camp start button
scoreboard players set #guide guide_state 17
scoreboard players set #transition_timer guide_state 240
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"Follow the path to the Relief Camp level!","color":"green"}]

# Update game progression completion state
scoreboard players set #wr_won gp_completed 1
data modify storage arnis:progress wr set value "Tent City Rescue (Already done!)"
