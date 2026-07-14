# tick.mcfunction - Main Game Loop

# If button is pressed and game is idle (0), start it!
execute if score #state tent_state matches 0 if block 540 -42 345 #minecraft:buttons[powered=true] run function tent_city:start
execute if score #state tent_state matches 2..3 if block 540 -42 345 #minecraft:buttons[powered=true] run function tent_city:start

execute if score #state tent_state matches 1 as @e[tag=tent_npc_1,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run summon armor_stand ~ ~ ~ {Tags:["seat_1"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b}
execute if score #state tent_state matches 1 as @e[tag=tent_npc_1,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run ride @e[tag=seat_1,distance=..1,limit=1] mount @e[type=minecraft:spruce_boat,distance=..5,limit=1,sort=nearest]
execute if score #state tent_state matches 1 as @e[tag=tent_npc_1,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run tag @s add has_hologram
execute if score #state tent_state matches 1 as @e[tag=seat_1] at @s run tp @e[tag=tent_npc_1,tag=has_hologram] ~ ~ ~ ~ ~
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_1] as @e[tag=seat_1] on vehicle if entity @s[x=552,y=-42,z=316,distance=..30] run function tent_city:rescue_1
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_1] as @e[tag=seat_1] on vehicle if entity @s[x=542,y=-42,z=333,distance=..30] run function tent_city:rescue_1
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_1] as @e[tag=seat_1] on vehicle if entity @s[x=532,y=-42,z=349,distance=..30] run function tent_city:rescue_1
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_1] as @e[tag=seat_1] on vehicle if entity @s[x=522,y=-42,z=365,distance=..30] run function tent_city:rescue_1

execute if score #state tent_state matches 1 as @e[tag=tent_npc_2,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run summon armor_stand ~ ~ ~ {Tags:["seat_2"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b}
execute if score #state tent_state matches 1 as @e[tag=tent_npc_2,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run ride @e[tag=seat_2,distance=..1,limit=1] mount @e[type=minecraft:spruce_boat,distance=..5,limit=1,sort=nearest]
execute if score #state tent_state matches 1 as @e[tag=tent_npc_2,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run tag @s add has_hologram
execute if score #state tent_state matches 1 as @e[tag=seat_2] at @s run tp @e[tag=tent_npc_2,tag=has_hologram] ~ ~ ~ ~ ~
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_2] as @e[tag=seat_2] on vehicle if entity @s[x=552,y=-42,z=316,distance=..30] run function tent_city:rescue_2
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_2] as @e[tag=seat_2] on vehicle if entity @s[x=542,y=-42,z=333,distance=..30] run function tent_city:rescue_2
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_2] as @e[tag=seat_2] on vehicle if entity @s[x=532,y=-42,z=349,distance=..30] run function tent_city:rescue_2
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_2] as @e[tag=seat_2] on vehicle if entity @s[x=522,y=-42,z=365,distance=..30] run function tent_city:rescue_2

execute if score #state tent_state matches 1 as @e[tag=tent_npc_3,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run summon armor_stand ~ ~ ~ {Tags:["seat_3"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b}
execute if score #state tent_state matches 1 as @e[tag=tent_npc_3,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run ride @e[tag=seat_3,distance=..1,limit=1] mount @e[type=minecraft:spruce_boat,distance=..5,limit=1,sort=nearest]
execute if score #state tent_state matches 1 as @e[tag=tent_npc_3,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run tag @s add has_hologram
execute if score #state tent_state matches 1 as @e[tag=seat_3] at @s run tp @e[tag=tent_npc_3,tag=has_hologram] ~ ~ ~ ~ ~
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_3] as @e[tag=seat_3] on vehicle if entity @s[x=552,y=-42,z=316,distance=..30] run function tent_city:rescue_3
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_3] as @e[tag=seat_3] on vehicle if entity @s[x=542,y=-42,z=333,distance=..30] run function tent_city:rescue_3
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_3] as @e[tag=seat_3] on vehicle if entity @s[x=532,y=-42,z=349,distance=..30] run function tent_city:rescue_3
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_3] as @e[tag=seat_3] on vehicle if entity @s[x=522,y=-42,z=365,distance=..30] run function tent_city:rescue_3

execute if score #state tent_state matches 1 as @e[tag=tent_npc_4,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run summon armor_stand ~ ~ ~ {Tags:["seat_4"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b}
execute if score #state tent_state matches 1 as @e[tag=tent_npc_4,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run ride @e[tag=seat_4,distance=..1,limit=1] mount @e[type=minecraft:spruce_boat,distance=..5,limit=1,sort=nearest]
execute if score #state tent_state matches 1 as @e[tag=tent_npc_4,tag=!has_hologram] at @s if entity @e[type=minecraft:spruce_boat,distance=..5] run tag @s add has_hologram
execute if score #state tent_state matches 1 as @e[tag=seat_4] at @s run tp @e[tag=tent_npc_4,tag=has_hologram] ~ ~ ~ ~ ~
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_4] as @e[tag=seat_4] on vehicle if entity @s[x=552,y=-42,z=316,distance=..30] run function tent_city:rescue_4
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_4] as @e[tag=seat_4] on vehicle if entity @s[x=542,y=-42,z=333,distance=..30] run function tent_city:rescue_4
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_4] as @e[tag=seat_4] on vehicle if entity @s[x=532,y=-42,z=349,distance=..30] run function tent_city:rescue_4
execute if score #state tent_state matches 1 if entity @e[tag=tent_npc_4] as @e[tag=seat_4] on vehicle if entity @s[x=522,y=-42,z=365,distance=..30] run function tent_city:rescue_4

# Win condition
execute if score #state tent_state matches 1 if score @p tent_score matches 4 run function tent_city:win

