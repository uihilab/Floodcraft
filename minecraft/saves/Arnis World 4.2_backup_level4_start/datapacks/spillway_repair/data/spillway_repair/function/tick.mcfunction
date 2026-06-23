# tick.mcfunction - Main game loop running 20 times per second

# Check if the player pressed the start button when the game is inactive
execute if score #state sr_state matches 0 if block 1263 -52 677 minecraft:spruce_button[powered=true] run function spillway_repair:start

# Run active game loop if game state is active (1)
execute if score #state sr_state matches 1 run function spillway_repair:tick_active

# Run win animation / cooldown ticks if state is 2 (win animation running) or 3 (defeat cooldown)
execute if score #state sr_state matches 2..3 run function spillway_repair:tick_active
