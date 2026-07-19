# trigger_victory.mcfunction - Handles the final game win announcement and celebration

# Mark victory as triggered to prevent looping
scoreboard players set #victory_triggered gp_victory 1

# Big victory titles on screen
title @a times 20 120 20
title @a title {"text":"YOU WON!","color":"green","bold":true}
title @a subtitle {"text":"You helped flood-proof the town!","color":"yellow"}

# Chat message
tellraw @a [{"text":"[System] ","color":"gold"},{"text":"Congratulations! You have completed all 5 tasks and successfully flood-proofed the entire town! You are a hero!","color":"green"}]

# Play challenge complete sounds
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.5 1.0
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.5 0.8
