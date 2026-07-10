# tick_cooldown.mcfunction - Runs during the post-game win/fail sequences

# Decrement cooldown timer
scoreboard players remove #cooldown sd2_timer 1

# If cooldown reaches 0, reset the game state and restore the world
execute if score #cooldown sd2_timer matches ..0 run function storm_drains:reset
execute if score #cooldown sd2_timer matches ..0 run scoreboard players set #state sd2_state 0
