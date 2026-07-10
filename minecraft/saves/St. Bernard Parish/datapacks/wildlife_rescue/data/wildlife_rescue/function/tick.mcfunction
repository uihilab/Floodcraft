# tick.mcfunction - Runs every game tick (20 times per second)

# If game is inactive (state = 0), check if the button is pressed to start the game
execute if score #state wr_state matches 0 if block 1259 -53 760 minecraft:spruce_button[powered=true] run function wildlife_rescue:start

# If game is active (state = 1), run active game tick
execute if score #state wr_state matches 1 run function wildlife_rescue:tick_active

# Clean up any leftover animals from unloaded chunks that load while the game is inactive
execute unless score #state wr_state matches 1 as @e[tag=wr_animal] run tp @s 1250 -200 750

# If game is in cooldown (state = 2 [won] or 3 [lost])
execute if score #state wr_state matches 2..3 run scoreboard players remove #cooldown wr_timer 1
execute if score #state wr_state matches 2..3 if score #cooldown wr_timer matches ..0 run function wildlife_rescue:reset
execute if score #state wr_state matches 2..3 if score #cooldown wr_timer matches ..0 run scoreboard players set #state wr_state 0
execute if score #state wr_state matches 2..3 if score #cooldown wr_timer matches ..0 run tellraw @a [{"text":"[Wildlife Rescue] ","color":"gold"},{"text":"Game reset! Press the button at 1259 -53 760 to play again.","color":"green"}]
