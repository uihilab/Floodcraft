# win.mcfunction - Win Level 5
title @a title {"text":"YOU WIN!","color":"gold","bold":true}
title @a subtitle {"text":"All survivors fed! Greenville is saved!","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Full reset cleanup
function relief_camp:reset
scoreboard players set #state relief_state 2
