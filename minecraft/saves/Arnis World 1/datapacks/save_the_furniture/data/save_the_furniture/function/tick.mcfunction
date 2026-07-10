# tick.mcfunction - Runs every game tick (20 times per second)

# If game is inactive (state = 0), check if the button is pressed to start the game
execute if score #state sf_state matches 0 if block 712 -46 469 minecraft:pale_oak_button[powered=true] run function save_the_furniture:start

# If game is active (state = 1), run active game tick
execute if score #state sf_state matches 1 run function save_the_furniture:tick_active

# If game is in cooldown (state = 2 [won] or 3 [lost])
execute if score #state sf_state matches 2..3 run scoreboard players remove #cooldown sf_timer 1
execute if score #state sf_state matches 2..3 if score #cooldown sf_timer matches ..0 run function save_the_furniture:reset
execute if score #state sf_state matches 2..3 if score #cooldown sf_timer matches ..0 run scoreboard players set #state sf_state 0
execute if score #state sf_state matches 2..3 if score #cooldown sf_timer matches ..0 run tellraw @a [{"text":"[Save the Furniture] ","color":"gold"},{"text":"Game reset! Press the button at 1308 -52 766 to play again.","color":"green"}]
