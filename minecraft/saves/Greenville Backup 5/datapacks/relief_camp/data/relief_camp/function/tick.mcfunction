# tick.mcfunction - Level 5 Loop

# Button Triggers start
execute if score #state relief_state matches 0 if block 519 -42 383 #minecraft:buttons[powered=true] run function relief_camp:start
execute if score #state relief_state matches 2..3 if block 519 -42 383 #minecraft:buttons[powered=true] run function relief_camp:start

# Always daytime while game is active
execute if score #state relief_state matches 1 run time set day

# =========================================
# TENT 1 - CITIZEN 1 (Needs 1 Water, 1 Bread)
# =========================================
execute if score #state relief_state matches 1 if score #c1_done relief_vars matches 0 at @e[tag=citizen_1] run tp @e[tag=c1_holo,distance=..3] ~0.8 ~1.5 ~

# 1. Bread delivery
execute if score #state relief_state matches 1 if score #c1_bread relief_vars matches 1.. as @e[tag=citizen_1] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:bread"}}] at @s run scoreboard players remove #c1_bread relief_vars 1
execute if score #state relief_state matches 1 as @e[tag=citizen_1] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:bread"}}] at @s run playsound minecraft:entity.generic.eat master @a ~ ~ ~ 1 1
execute if score #state relief_state matches 1 as @e[tag=citizen_1] at @s run kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:bread"}}]

# 2. Water delivery
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 1.. as @e[tag=citizen_1] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}] at @s run scoreboard players remove #c1_water relief_vars 1
execute if score #state relief_state matches 1 as @e[tag=citizen_1] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}] at @s run playsound minecraft:entity.generic.drink master @a ~ ~ ~ 1 1
execute if score #state relief_state matches 1 as @e[tag=citizen_1] at @s run kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}]

# 3. Hologram Name updates
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 1 if score #c1_bread relief_vars matches 1 run data merge entity @e[tag=c1_holo,limit=1] {text:'{"text":"Needs: 1 Water, 1 Bread","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 1 if score #c1_bread relief_vars matches 0 run data merge entity @e[tag=c1_holo,limit=1] {text:'{"text":"Needs: 1 Water","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 0 if score #c1_bread relief_vars matches 1 run data merge entity @e[tag=c1_holo,limit=1] {text:'{"text":"Needs: 1 Bread","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 0 if score #c1_bread relief_vars matches 0 if score #c1_done relief_vars matches 0 run data merge entity @e[tag=c1_holo,limit=1] {text:'{"text":"Thank you!","color":"green"}'}
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 0 if score #c1_bread relief_vars matches 0 if score #c1_done relief_vars matches 0 run scoreboard players add @a relief_score 1
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 0 if score #c1_bread relief_vars matches 0 if score #c1_done relief_vars matches 0 run tellraw @a [{"text":"[","color":"gray"},{"selector":"@e[tag=citizen_1,limit=1]","color":"yellow"},{"text":"] Thank you! That is exactly what I needed.","color":"green"}]
execute if score #state relief_state matches 1 if score #c1_water relief_vars matches 0 if score #c1_bread relief_vars matches 0 if score #c1_done relief_vars matches 0 run scoreboard players set #c1_done relief_vars 1


# =========================================
# TENT 2 - CITIZEN 2 (Needs 2 Bread)
# =========================================
execute if score #state relief_state matches 1 if score #c2_done relief_vars matches 0 at @e[tag=citizen_2] run tp @e[tag=c2_holo,distance=..3] ~0.8 ~1.5 ~

# 1. Bread delivery
execute if score #state relief_state matches 1 if score #c2_bread relief_vars matches 1.. as @e[tag=citizen_2] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:bread"}}] at @s run scoreboard players remove #c2_bread relief_vars 1
execute if score #state relief_state matches 1 as @e[tag=citizen_2] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:bread"}}] at @s run playsound minecraft:entity.generic.eat master @a ~ ~ ~ 1 1
execute if score #state relief_state matches 1 as @e[tag=citizen_2] at @s run kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:bread"}}]

# 2. Hologram Name updates
execute if score #state relief_state matches 1 if score #c2_bread relief_vars matches 2 run data merge entity @e[tag=c2_holo,limit=1] {text:'{"text":"Needs: 2 Bread","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c2_bread relief_vars matches 1 run data merge entity @e[tag=c2_holo,limit=1] {text:'{"text":"Needs: 1 Bread","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c2_bread relief_vars matches 0 if score #c2_done relief_vars matches 0 run data merge entity @e[tag=c2_holo,limit=1] {text:'{"text":"Thank you!","color":"green"}'}
execute if score #state relief_state matches 1 if score #c2_bread relief_vars matches 0 if score #c2_done relief_vars matches 0 run scoreboard players add @a relief_score 1
execute if score #state relief_state matches 1 if score #c2_bread relief_vars matches 0 if score #c2_done relief_vars matches 0 run tellraw @a [{"text":"[","color":"gray"},{"selector":"@e[tag=citizen_2,limit=1]","color":"yellow"},{"text":"] Ah, bless you! I was starving.","color":"green"}]
execute if score #state relief_state matches 1 if score #c2_bread relief_vars matches 0 if score #c2_done relief_vars matches 0 run scoreboard players set #c2_done relief_vars 1


# =========================================
# TENT 3 - CITIZEN 3 (Needs 1 Water, 1 Stew)
# =========================================
execute if score #state relief_state matches 1 if score #c3_done relief_vars matches 0 at @e[tag=citizen_3] run tp @e[tag=c3_holo,distance=..3] ~0.8 ~1.5 ~

# 1. Stew delivery
execute if score #state relief_state matches 1 if score #c3_stew relief_vars matches 1.. as @e[tag=citizen_3] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:suspicious_stew"}}] at @s run scoreboard players remove #c3_stew relief_vars 1
execute if score #state relief_state matches 1 as @e[tag=citizen_3] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:suspicious_stew"}}] at @s run playsound minecraft:entity.generic.eat master @a ~ ~ ~ 1 1
execute if score #state relief_state matches 1 as @e[tag=citizen_3] at @s run kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:suspicious_stew"}}]

# 2. Water delivery
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 1.. as @e[tag=citizen_3] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}] at @s run scoreboard players remove #c3_water relief_vars 1
execute if score #state relief_state matches 1 as @e[tag=citizen_3] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}] at @s run playsound minecraft:entity.generic.drink master @a ~ ~ ~ 1 1
execute if score #state relief_state matches 1 as @e[tag=citizen_3] at @s run kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:potion",components:{"minecraft:potion_contents":{potion:"minecraft:water"}}}}]

# 3. Hologram Name updates
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 1 if score #c3_stew relief_vars matches 1 run data merge entity @e[tag=c3_holo,limit=1] {text:'{"text":"Needs: 1 Water, 1 Canned Stew","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 1 if score #c3_stew relief_vars matches 0 run data merge entity @e[tag=c3_holo,limit=1] {text:'{"text":"Needs: 1 Water","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 0 if score #c3_stew relief_vars matches 1 run data merge entity @e[tag=c3_holo,limit=1] {text:'{"text":"Needs: 1 Canned Stew","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 0 if score #c3_stew relief_vars matches 0 if score #c3_done relief_vars matches 0 run data merge entity @e[tag=c3_holo,limit=1] {text:'{"text":"Thank you!","color":"green"}'}
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 0 if score #c3_stew relief_vars matches 0 if score #c3_done relief_vars matches 0 run scoreboard players add @a relief_score 1
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 0 if score #c3_stew relief_vars matches 0 if score #c3_done relief_vars matches 0 run tellraw @a [{"text":"[","color":"gray"},{"selector":"@e[tag=citizen_3,limit=1]","color":"yellow"},{"text":"] Thank you so much! My family will be so relieved.","color":"green"}]
execute if score #state relief_state matches 1 if score #c3_water relief_vars matches 0 if score #c3_stew relief_vars matches 0 if score #c3_done relief_vars matches 0 run scoreboard players set #c3_done relief_vars 1


# =========================================
# TENT 4 - CITIZEN 4 (Needs 2 Stew)
# =========================================
execute if score #state relief_state matches 1 if score #c4_done relief_vars matches 0 at @e[tag=citizen_4] run tp @e[tag=c4_holo,distance=..3] ~0.8 ~1.5 ~

# 1. Stew delivery
execute if score #state relief_state matches 1 if score #c4_stew relief_vars matches 1.. as @e[tag=citizen_4] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:suspicious_stew"}}] at @s run scoreboard players remove #c4_stew relief_vars 1
execute if score #state relief_state matches 1 as @e[tag=citizen_4] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:suspicious_stew"}}] at @s run playsound minecraft:entity.generic.eat master @a ~ ~ ~ 1 1
execute if score #state relief_state matches 1 as @e[tag=citizen_4] at @s run kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:suspicious_stew"}}]

# 2. Hologram Name updates
execute if score #state relief_state matches 1 if score #c4_stew relief_vars matches 2 run data merge entity @e[tag=c4_holo,limit=1] {text:'{"text":"Needs: 2 Canned Stew","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c4_stew relief_vars matches 1 run data merge entity @e[tag=c4_holo,limit=1] {text:'{"text":"Needs: 1 Canned Stew","color":"yellow"}'}
execute if score #state relief_state matches 1 if score #c4_stew relief_vars matches 0 if score #c4_done relief_vars matches 0 run data merge entity @e[tag=c4_holo,limit=1] {text:'{"text":"Thank you!","color":"green"}'}
execute if score #state relief_state matches 1 if score #c4_stew relief_vars matches 0 if score #c4_done relief_vars matches 0 run scoreboard players add @a relief_score 1
execute if score #state relief_state matches 1 if score #c4_stew relief_vars matches 0 if score #c4_done relief_vars matches 0 run tellraw @a [{"text":"[","color":"gray"},{"selector":"@e[tag=citizen_4,limit=1]","color":"yellow"},{"text":"] Thank you, this canned stew is wonderful!","color":"green"}]
execute if score #state relief_state matches 1 if score #c4_stew relief_vars matches 0 if score #c4_done relief_vars matches 0 run scoreboard players set #c4_done relief_vars 1


# Win Trigger
execute if score #state relief_state matches 1 if score @p relief_score matches 4 run function relief_camp:win
