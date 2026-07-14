scoreboard objectives add tent_score dummy
scoreboard objectives add tent_state dummy
scoreboard players set #state tent_state 0
forceload add 607 224
tellraw @a ["",{"text":"[Tent City] ","color":"gold"},{"text":"Datapack loaded successfully!","color":"green"}]
