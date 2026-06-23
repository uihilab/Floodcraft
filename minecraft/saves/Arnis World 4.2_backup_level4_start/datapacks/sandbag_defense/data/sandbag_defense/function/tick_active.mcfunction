# tick_active.mcfunction - Runs every tick when state = 1

# Decrement the timer
scoreboard players remove #time sd_timer 1

# Update Bossbar value (smooth tick countdown)
execute store result bossbar minecraft:sd_bossbar value run scoreboard players get #time sd_timer

# Check Phase: Prep Phase (Time > 300 ticks / 15 seconds)
execute if score #time sd_timer matches 301.. run bossbar set minecraft:sd_bossbar name "PREPARATION PHASE: Protect the house!"
execute if score #time sd_timer matches 301.. run bossbar set minecraft:sd_bossbar color yellow

# Check Phase: Flooding Phase (Time <= 300 ticks / 15 seconds)
execute if score #time sd_timer matches ..300 run bossbar set minecraft:sd_bossbar name "FLOODING ACTIVE: Watch the water rise!"
execute if score #time sd_timer matches ..300 run bossbar set minecraft:sd_bossbar color red

# Transition at 15s (exactly 300 ticks remaining):
execute if score #time sd_timer matches 300 run title @a title {"text":"WARNING","color":"red","bold":true}
execute if score #time sd_timer matches 300 run title @a subtitle {"text":"Floodwaters rising!","color":"yellow"}
execute if score #time sd_timer matches 300 run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1

# Flooding Active behaviors
execute if score #time sd_timer matches ..300 run function sandbag_defense:spawn_water
execute if score #time sd_timer matches ..300 run function sandbag_defense:check_leaks

# Player Death Detection
execute as @a[scores={sd_deaths=1..}] run function sandbag_defense:fail

# Victory Condition (Timer reaches 0 and no leak has triggered fail)
execute if score #time sd_timer matches ..0 run function sandbag_defense:win
