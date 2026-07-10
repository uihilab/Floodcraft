# Reset the trigger
scoreboard players set @a show_tasks 0

# Print the header
tellraw @a {"text":"\n=== CHOOSE A TASK ===","color":"gold","bold":true}

# Task 1: Sandbag Defense
execute if score #sd_won gp_completed matches 0 run tellraw @a [{"text":"1. [Sandbag Defense] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_sandbag_defense"}},{"text":"- Help block river leaks with sandbags!","color":"gray"}]
execute if score #sd_won gp_completed matches 1 run tellraw @a [{"text":"1. [Sandbag Defense] ","color":"gray","bold":true,"strikethrough":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_sandbag_defense"}},{"text":" (Already done!)","color":"yellow","italic":true}]

# Task 2: Wildlife Rescue
execute if score #wr_won gp_completed matches 0 run tellraw @a [{"text":"2. [Wildlife Rescue] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_wildlife_rescue"}},{"text":"- Save stranded pets in the swamp!","color":"gray"}]
execute if score #wr_won gp_completed matches 1 run tellraw @a [{"text":"2. [Wildlife Rescue] ","color":"gray","bold":true,"strikethrough":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_wildlife_rescue"}},{"text":" (Already done!)","color":"yellow","italic":true}]

# Task 3: Storm Drains
execute if score #sd2_won gp_completed matches 0 run tellraw @a [{"text":"3. [Storm Drains] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_storm_drains"}},{"text":"- Clear debris clogging the street drains!","color":"gray"}]
execute if score #sd2_won gp_completed matches 1 run tellraw @a [{"text":"3. [Storm Drains] ","color":"gray","bold":true,"strikethrough":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_storm_drains"}},{"text":" (Already done!)","color":"yellow","italic":true}]

# Task 4: Save the Furniture
execute if score #sf_won gp_completed matches 0 run tellraw @a [{"text":"4. [Save the Furniture] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_save_the_furniture"}},{"text":"- Move furniture to safety upstairs!","color":"gray"}]
execute if score #sf_won gp_completed matches 1 run tellraw @a [{"text":"4. [Save the Furniture] ","color":"gray","bold":true,"strikethrough":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_save_the_furniture"}},{"text":" (Already done!)","color":"yellow","italic":true}]

# Task 5: Spillway Repair
execute if score #sr_won gp_completed matches 0 run tellraw @a [{"text":"5. [Spillway Repair] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_spillway_repair"}},{"text":"- Repair the dam spillway and gates!","color":"gray"}]
execute if score #sr_won gp_completed matches 1 run tellraw @a [{"text":"5. [Spillway Repair] ","color":"gray","bold":true,"strikethrough":true,"clickEvent":{"action":"run_command","value":"/function game_progression:lead_to_spillway_repair"}},{"text":" (Already done!)","color":"yellow","italic":true}]

tellraw @a {"text":"=====================\n","color":"gold"}
