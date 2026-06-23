# tick.mcfunction - Runs every game tick (20 times per second)

# If game is inactive (state = 0), check if the button is pressed to start the game
execute if score #state sd_state matches 0 if block 1219 -52 701 minecraft:spruce_button[powered=true] run function sandbag_defense:start

# If game is active (state = 1), run active game tick
execute if score #state sd_state matches 1 run function sandbag_defense:tick_active

# If game is in cooldown (state = 2 [won] or 3 [lost])
execute if score #state sd_state matches 2..3 run scoreboard players remove #cooldown sd_timer 1
execute if score #state sd_state matches 2..3 if score #cooldown sd_timer matches ..0 run function sandbag_defense:reset
execute if score #state sd_state matches 2..3 if score #cooldown sd_timer matches ..0 run scoreboard players set #state sd_state 0
execute if score #state sd_state matches 2..3 if score #cooldown sd_timer matches ..0 run tellraw @a [{"text":"[Sandbag Defense] ","color":"gold"},{"text":"Game reset! Press the button at 1219 -52 701 to play again.","color":"green"}]

