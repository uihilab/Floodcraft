# tick.mcfunction - Main tick loop for Storm Drains level, running every game tick (20 Hz)

# 1. Detect if the start button is pressed (block state powered=true)
# If state is inactive (0), start the game!
execute if block 1209 -52 760 minecraft:spruce_button[powered=true] if score #state sd2_state matches 0 run function storm_drains:start

# 2. Run active game loop if state is Active (1)
execute if score #state sd2_state matches 1 run function storm_drains:tick_active

# 3. Handle post-game cooldown (states 2 or 3) before auto-resetting
execute if score #state sd2_state matches 2..3 run function storm_drains:tick_cooldown
