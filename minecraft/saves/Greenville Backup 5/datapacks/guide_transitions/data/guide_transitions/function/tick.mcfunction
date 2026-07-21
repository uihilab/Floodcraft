# === DETECT CRIMSON BUTTON PRESS (Level 3 Sandbags) ===
execute if block 609 -47 546 minecraft:crimson_button[powered=true] unless score #gv_btn guide_state matches 1 as @p[x=609,y=-47,z=546,distance=..6] run function game_progression:print_video_link
execute if block 609 -47 546 minecraft:crimson_button[powered=true] run scoreboard players set #gv_btn guide_state 1
execute unless block 609 -47 546 minecraft:crimson_button[powered=true] run scoreboard players set #gv_btn guide_state 0

# === CONVERSE LOCK SYSTEM ===
# Revoke the ice_breaker advancement unconditionally at the end of the tick so it is always cleared
execute as @a[advancements={creaturechat:ice_breaker=true}] run advancement revoke @s only creaturechat:ice_breaker

# tick.mcfunction - Runs every tick

# 1. Enforce guide attributes in case of reloading/chunk loading
execute as @e[tag=ai_guide] run attribute @s minecraft:follow_range base set 2048
execute as @e[tag=ai_guide] run attribute @s minecraft:movement_speed base set 0.4

# 2. Handle Teleport and Guide Run Delay on Victory
# Decrement timer (total 240 ticks = 12 seconds)
execute if score #transition_timer guide_state matches 1..240 run scoreboard players remove #transition_timer guide_state 1

# Trigger teleport when timer hits 200 (after 2 seconds / 40 ticks pass, with 10 seconds remaining)
# L1 won -> L2 teleport
execute if score #guide guide_state matches 11 if score #transition_timer guide_state matches 200 run tp @a 707.5 -47.0 470.5 180 0
# L2 won -> L3 teleport
execute if score #guide guide_state matches 13 if score #transition_timer guide_state matches 200 run tp @a 714.5 -46.0 459.5 -90 0
# L3 won -> L4 teleport
execute if score #guide guide_state matches 15 if score #transition_timer guide_state matches 200 run tp @a 610.5 -48.0 543.5 180 0
# L4 won -> L5 teleport
execute if score #guide guide_state matches 17 if score #transition_timer guide_state matches 200 run tp @a 542.0 -42.0 343.0 180 0
# L5 won -> End Game teleport
execute if score #guide guide_state matches 19 if score #transition_timer guide_state matches 200 run tp @a 522.5 -42.0 381.5 180 0

# Trigger Guide run and active transition state when timer hits 180 (after 3 seconds total)
# L1 won -> L2 transition active (State 11 -> 1)
execute if score #guide guide_state matches 11 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 1

# L2 won -> L3 transition active (State 13 -> 3)
execute if score #guide guide_state matches 13 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 3

# L3 won -> L4 transition active (State 15 -> 5)
execute if score #guide guide_state matches 15 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 5

# L4 won -> L5 transition active (State 17 -> 7)
execute if score #guide guide_state matches 17 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 7

# L5 won -> Game finished (State 19 -> 9)
execute if score #guide guide_state matches 19 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 9

# Initialize timer when entering a won state (set to 240 ticks)
execute if score #guide guide_state matches 11 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 13 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 15 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 17 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 19 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240


# 3. Check if player has reached the guide for the active transitions
# Transition 1 -> 2 (Save the Furniture won, guiding to Storm Drains start at 716 -47 458)
execute if score #guide guide_state matches 1 if entity @a[x=716,y=-47,z=458,distance=..6] run function guide_transitions:reach_l2

# Transition 3 -> 4 (Storm Drains won, guiding to Sandbag start at 613 -48 543)
execute if score #guide guide_state matches 3 if entity @a[x=613,y=-48,z=543,distance=..6] run function guide_transitions:reach_l3

# Transition 5 -> 6 (Sandbag won, guiding to Tent City start at 542 -42 343)
execute if score #guide guide_state matches 5 if entity @a[x=542,y=-42,z=343,distance=..6] run function guide_transitions:reach_l4

# Transition 7 -> 8 (Tent City won, guiding to Relief Camp start at 518 -41 382)
execute if score #guide guide_state matches 7 if entity @a[x=518,y=-41,z=382,distance=..6] run function guide_transitions:reach_l5


# 4. Handle Guide Navigation on State Change
# L1 -> L2 (State 1): Guide to Storm Drains (716 -47 458) (Disabled for multi-NPC)
# execute if score #guide guide_state matches 1 unless score #current_guide_dest guide_state matches 1 run tp @e[tag=ai_guide,limit=1] 716.5 -47.0 458.5 -90 0
# execute if score #guide guide_state matches 1 unless score #current_guide_dest guide_state matches 1 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 716 -47 458
execute if score #guide guide_state matches 1 unless score #current_guide_dest guide_state matches 1 run scoreboard players set #current_guide_dest guide_state 1

# L2 -> L3 (State 3): Guide to Sandbag Defense (613 -48 543) (Disabled for multi-NPC)
# execute if score #guide guide_state matches 3 unless score #current_guide_dest guide_state matches 3 run tp @e[tag=ai_guide,limit=1] 613.5 -48.0 543.5 -90 0
# execute if score #guide guide_state matches 3 unless score #current_guide_dest guide_state matches 3 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 613 -48 543
execute if score #guide guide_state matches 3 unless score #current_guide_dest guide_state matches 3 run scoreboard players set #current_guide_dest guide_state 3

# L3 -> L4 (State 5): Guide to Tent City (542 -42 343) (Disabled for multi-NPC)
# execute if score #guide guide_state matches 5 unless score #current_guide_dest guide_state matches 5 run tp @e[tag=ai_guide,limit=1] 542.5 -42.0 343.5 -90 0
# execute if score #guide guide_state matches 5 unless score #current_guide_dest guide_state matches 5 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 542 -42 343
execute if score #guide guide_state matches 5 unless score #current_guide_dest guide_state matches 5 run scoreboard players set #current_guide_dest guide_state 5

# L4 -> L5 (State 7): Guide to Relief Camp (518 -41 382) (Disabled for multi-NPC)
# execute if score #guide guide_state matches 7 unless score #current_guide_dest guide_state matches 7 run tp @e[tag=ai_guide,limit=1] 518.5 -41.0 382.5 -90 0
# execute if score #guide guide_state matches 7 unless score #current_guide_dest guide_state matches 7 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 518 -41 382
execute if score #guide guide_state matches 7 unless score #current_guide_dest guide_state matches 7 run scoreboard players set #current_guide_dest guide_state 7

# Reset / Start (State 0): Guide back to L1 (Save the Furniture) board (709 -47 468) (Disabled for multi-NPC)
# execute if score #guide guide_state matches 0 unless score #current_guide_dest guide_state matches 0 run tp @e[tag=ai_guide,limit=1] 709.5 -47.0 468.5 180 0
# execute if score #guide guide_state matches 0 unless score #current_guide_dest guide_state matches 0 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 709 -47 468
execute if score #guide guide_state matches 0 unless score #current_guide_dest guide_state matches 0 run scoreboard players set #current_guide_dest guide_state 0

# Sync states
execute if score #guide guide_state matches 2 unless score #current_guide_dest guide_state matches 2 run scoreboard players set #current_guide_dest guide_state 2
execute if score #guide guide_state matches 4 unless score #current_guide_dest guide_state matches 4 run scoreboard players set #current_guide_dest guide_state 4
execute if score #guide guide_state matches 6 unless score #current_guide_dest guide_state matches 6 run scoreboard players set #current_guide_dest guide_state 6
execute if score #guide guide_state matches 8 unless score #current_guide_dest guide_state matches 8 run scoreboard players set #current_guide_dest guide_state 8
execute if score #guide guide_state matches 9 unless score #current_guide_dest guide_state matches 9 run scoreboard players set #current_guide_dest guide_state 9
execute if score #guide guide_state matches 11 unless score #current_guide_dest guide_state matches 11 run scoreboard players set #current_guide_dest guide_state 11
execute if score #guide guide_state matches 13 unless score #current_guide_dest guide_state matches 13 run scoreboard players set #current_guide_dest guide_state 13
execute if score #guide guide_state matches 15 unless score #current_guide_dest guide_state matches 15 run scoreboard players set #current_guide_dest guide_state 15
execute if score #guide guide_state matches 17 unless score #current_guide_dest guide_state matches 17 run scoreboard players set #current_guide_dest guide_state 17
execute if score #guide guide_state matches 19 unless score #current_guide_dest guide_state matches 19 run scoreboard players set #current_guide_dest guide_state 19


# 5. Render Particle Paths on Active Transitions
execute if score #guide guide_state matches 1 run function guide_transitions:show_path1
execute if score #guide guide_state matches 3 run function guide_transitions:show_path2
execute if score #guide guide_state matches 5 run function guide_transitions:show_path3
execute if score #guide guide_state matches 7 run function guide_transitions:show_path4


# === FAILURE TRANSITIONS LOGIC (Greenville) ===
# Ticks down transition_timer for failure states (21, 23, 25, 27, 29)
execute if score #guide guide_state matches 21..29 run scoreboard players remove #transition_timer guide_state 1

# Teleports (after 2 seconds / 40 ticks, timer reaches 100)
# L1 fail -> teleport back to L1 start (Furniture)
execute if score #guide guide_state matches 21 if score #transition_timer guide_state matches 100 run tp @a 707.5 -47.0 470.5 180 0
# L2 fail -> teleport back to L2 start (Drains)
execute if score #guide guide_state matches 23 if score #transition_timer guide_state matches 100 run tp @a 714.5 -46.0 459.5 -90 0
# L3 fail -> teleport back to L3 start (Sandbag)
execute if score #guide guide_state matches 25 if score #transition_timer guide_state matches 100 run tp @a 610.5 -48.0 543.5 180 0
# L4 fail -> teleport back to L4 start (Boat)
execute if score #guide guide_state matches 27 if score #transition_timer guide_state matches 100 run tp @a 542.0 -42.0 343.0 180 0
# L5 fail -> teleport back to L5 start (Camp)
execute if score #guide guide_state matches 29 if score #transition_timer guide_state matches 100 run tp @a 522.5 -42.0 381.5 180 0

# Reset state after 3 seconds (timer reaches 80)
execute if score #guide guide_state matches 21 if score #transition_timer guide_state matches 80 run scoreboard players set #guide guide_state 0
execute if score #guide guide_state matches 23 if score #transition_timer guide_state matches 80 run scoreboard players set #guide guide_state 2
execute if score #guide guide_state matches 25 if score #transition_timer guide_state matches 80 run scoreboard players set #guide guide_state 4
execute if score #guide guide_state matches 27 if score #transition_timer guide_state matches 80 run scoreboard players set #guide guide_state 6
execute if score #guide guide_state matches 29 if score #transition_timer guide_state matches 80 run scoreboard players set #guide guide_state 8

# Timer initializations
execute if score #guide guide_state matches 21..29 unless score #transition_timer guide_state matches 1..140 run scoreboard players set #transition_timer guide_state 140

# Sync states
execute if score #guide guide_state matches 21 unless score #current_guide_dest guide_state matches 21 run scoreboard players set #current_guide_dest guide_state 21
execute if score #guide guide_state matches 23 unless score #current_guide_dest guide_state matches 23 run scoreboard players set #current_guide_dest guide_state 23
execute if score #guide guide_state matches 25 unless score #current_guide_dest guide_state matches 25 run scoreboard players set #current_guide_dest guide_state 25
execute if score #guide guide_state matches 27 unless score #current_guide_dest guide_state matches 27 run scoreboard players set #current_guide_dest guide_state 27
execute if score #guide guide_state matches 29 unless score #current_guide_dest guide_state matches 29 run scoreboard players set #current_guide_dest guide_state 29

# === ACTION BAR LOCK HUD INDICATORS (Greenville - Bypassed if already completed) ===
# Level 3 (Sandbag Defense button at 611 -47 546)
execute if score #state sd_state matches 0 unless score #sd_won gp_completed matches 1 if entity @a[x=611,y=-47,z=546,distance=..8,tag=watched_sandbag_video] run title @a[x=611,y=-47,z=546,distance=..8] actionbar {"text":"Level Unlocked - Press the button to start!","color":"green"}
execute if score #state sd_state matches 0 unless score #sd_won gp_completed matches 1 if entity @a[x=611,y=-47,z=546,distance=..8,tag=!watched_sandbag_video] run title @a[x=611,y=-47,z=546,distance=..8] actionbar {"text":"Level Locked - Watch video to unlock!","color":"red"}


# === MULTI-NPC ACTIVE LEVEL SPAWN & CLEANUP SYSTEM (Greenville) ===

# --- LEVEL 1 (Save the Furniture) ---
# Active when sf_won is 0
execute if score #sf_won gp_completed matches 0 unless entity @e[tag=guide_l1] run summon easy_npc:chicken 709.5 -47.0 468.5 {CustomName:'"Guide L1"',Tags:["guide_l1"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},Rotation:[180f,0f]}
execute if score #sf_won gp_completed matches 1 if entity @e[tag=guide_l1] run kill @e[tag=guide_l1]

# --- LEVEL 2 (Storm Drains) ---
# Active when sf_won is 1 and sd2_won is 0
execute if score #sf_won gp_completed matches 1 if score #sd2_won gp_completed matches 0 unless entity @e[tag=guide_l2] run summon easy_npc:chicken 716.5 -47.0 458.5 {CustomName:'"Guide L2"',Tags:["guide_l2"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},Rotation:[-90f,0f]}
# Cleanup if not active
execute if score #sf_won gp_completed matches 0 if entity @e[tag=guide_l2] run kill @e[tag=guide_l2]
execute if score #sd2_won gp_completed matches 1 if entity @e[tag=guide_l2] run kill @e[tag=guide_l2]

# --- LEVEL 3 (Sandbag Defense) ---
# Active when sd2_won is 1 and sd_won is 0
execute if score #sd2_won gp_completed matches 1 if score #sd_won gp_completed matches 0 unless entity @e[tag=guide_l3] run summon easy_npc:chicken 613.5 -48.0 543.5 {CustomName:'"Guide L3"',Tags:["guide_l3"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},Rotation:[-90f,0f]}
# Cleanup if not active
execute if score #sd2_won gp_completed matches 0 if entity @e[tag=guide_l3] run kill @e[tag=guide_l3]
execute if score #sd_won gp_completed matches 1 if entity @e[tag=guide_l3] run kill @e[tag=guide_l3]

# --- LEVEL 4 (Tent City Rescue) ---
# Active when sd_won is 1 and wr_won is 0
execute if score #sd_won gp_completed matches 1 if score #wr_won gp_completed matches 0 unless entity @e[tag=guide_l4] run summon easy_npc:chicken 542.5 -42.0 343.5 {CustomName:'"Guide L4"',Tags:["guide_l4"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},Rotation:[-90f,0f]}
# Cleanup if not active
execute if score #sd_won gp_completed matches 0 if entity @e[tag=guide_l4] run kill @e[tag=guide_l4]
execute if score #wr_won gp_completed matches 1 if entity @e[tag=guide_l4] run kill @e[tag=guide_l4]

# --- LEVEL 5 (Relief Camp) ---
# Active when wr_won is 1
execute if score #wr_won gp_completed matches 1 unless entity @e[tag=guide_l5] run summon easy_npc:chicken 518.5 -41.0 382.5 {CustomName:'"Guide L5"',Tags:["guide_l5"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},Rotation:[-90f,0f]}
# Cleanup if not active
execute if score #wr_won gp_completed matches 0 if entity @e[tag=guide_l5] run kill @e[tag=guide_l5]
