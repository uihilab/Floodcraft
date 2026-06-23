# lever_error.mcfunction - Triggers if the player pulls the main lever too early

# Reset the main control lever back to unpowered state
setblock 1269 -52 676 minecraft:lever[facing=north,face=floor,powered=false] replace

# Play warning sounds
playsound minecraft:block.anvil.land master @a ~ ~ ~ 1.0 1.2
playsound minecraft:block.redstone_torch.burnout master @a ~ ~ ~ 1.0 0.8

# Display actionbar warning
title @a actionbar {"text":"CANNOT OPEN: Complete all 3 repairs first!","color":"red","bold":true}

# Send warning chat message
tellraw @a [{"text":"[Spillway Repair] ","color":"red"},{"text":"Warning! The spillway gate is still jammed or has no power. Check your guidebook and complete all 3 repairs first!","color":"yellow"}]
