# trigger_victory.mcfunction - Handles the final game win celebration
scoreboard players set #victory_triggered gp_victory 1

# Display victory screen
title @a times 20 120 20
title @a title {"text":"YOU WON!","color":"green","bold":true}
title @a subtitle {"text":"You helped flood-proof Greenville!","color":"yellow"}

# Chat message
tellraw @a [{"text":"[System] ","color":"gold"},{"text":"Congratulations! You have completed all 5 tasks and successfully flood-proofed Greenville! You are a hero!","color":"green"}]

# Sounds
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.5 1.0
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.5 0.8
