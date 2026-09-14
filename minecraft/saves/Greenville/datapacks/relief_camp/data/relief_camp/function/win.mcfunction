# win.mcfunction - Win Level 5
title @a title {"text":"YOU WIN!","color":"gold","bold":true}
title @a subtitle {"text":"All survivors fed! Greenville is saved!","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Full reset cleanup
function relief_camp:reset
scoreboard players set #state relief_state 2

# Update game progression completion state
scoreboard players set #sr_won gp_completed 1
data modify storage arnis:progress sr set value "Relief Camp (Already done!)"

# Set transition state
scoreboard players set #guide guide_state 19
scoreboard players set #transition_timer guide_state 240
tellraw @a [{"text":"[Guide] ","color":"yellow"},{"text":"Amazing job! You have completed all levels! Greenville is saved!","color":"green"}]
