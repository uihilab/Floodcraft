# rescue_animal.mcfunction - Runs as the animal being rescued

# Mark as rescued so they aren't processed again
tag @s add wr_rescued

# Play a happy chime sound at the animal's new location
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2

# Teleport to the safety pen and spread them out on the grass
spreadplayers 1253 755 1 3 false @s

# Unleash the animal so the lead item drops and is removed from the animal
data remove entity @s Leash
data modify entity @s Leashed set value 0b

# Make them owned by the dummy owner so they cannot be leashed again
data modify entity @s Owner set value [I;0,0,0,99]

# Freeze the animal in the pen so it stays there
data modify entity @s NoAI set value 1b

# Print a nice notification to chat using the animal's selector to show their name
tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"selector":"@s","color":"green","bold":true},{"text":" has been rescued and is safe in the pen!","color":"white"}]
