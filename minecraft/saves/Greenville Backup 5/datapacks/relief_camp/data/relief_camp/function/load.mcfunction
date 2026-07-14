# load.mcfunction - Initialize Level 5 Relief Camp
scoreboard objectives add relief_state dummy
scoreboard objectives add relief_vars dummy
scoreboard objectives add relief_score dummy
scoreboard players set #state relief_state 0
tellraw @a ["",{"text":"[Relief Camp] ","color":"gold"},{"text":"Datapack loaded successfully!","color":"green"}]
