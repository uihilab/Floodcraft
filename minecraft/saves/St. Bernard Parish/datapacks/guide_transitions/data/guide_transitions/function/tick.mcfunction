# === DETECT CRIMSON BUTTON PRESS (Level 1 Sandbags) ===
execute if block 1220 -52 701 minecraft:crimson_button[powered=true] unless score #sb_btn guide_state matches 1 as @p[x=1220,y=-52,z=701,distance=..6] run function game_progression:print_video_link
execute if block 1220 -52 701 minecraft:crimson_button[powered=true] run scoreboard players set #sb_btn guide_state 1
execute unless block 1220 -52 701 minecraft:crimson_button[powered=true] run scoreboard players set #sb_btn guide_state 0

# === CONVERSE LOCK SYSTEM ===
# Revoke the ice_breaker advancement unconditionally at the end of the tick so it is always cleared
execute as @a[advancements={creaturechat:ice_breaker=true}] run advancement revoke @s only creaturechat:ice_breaker

# tick.mcfunction - Runs every tick in St. Bernard Parish

# 1. Tag Guide in case of reloads/chunk loads
# Dynamic tagging of the Guide NPC based on name
execute as @e[type=easy_npc:humanoid,name="Guide"] run tag @s add ai_guide
execute as @e[type=easy_npc:humanoid_slim,name="Guide"] run tag @s add ai_guide
execute as @e[type=easy_npc:villager,name="Guide"] run tag @s add ai_guide
team join ai_guide_team @e[tag=ai_guide]


# 2. Enforce guide attributes
execute as @e[tag=ai_guide] run attribute @s minecraft:follow_range base set 2048
execute as @e[tag=ai_guide] run attribute @s minecraft:movement_speed base set 0.4

# 3. Handle Teleport and Guide Run Delay on Victory
# Decrement timer (total 240 ticks = 12 seconds)
execute if score #transition_timer guide_state matches 1..240 run scoreboard players remove #transition_timer guide_state 1

# Teleports (after 2 seconds / 40 ticks pass, timer reaches 200)
# L1 won -> teleport back to Sandbag Defense start
execute if score #guide guide_state matches 11 if score #transition_timer guide_state matches 200 run tp @a 1218.5 -53.0 707.5 180 0
# L2 won -> teleport back to Storm Drains start
execute if score #guide guide_state matches 13 if score #transition_timer guide_state matches 200 run tp @a 1206.5 -53.0 759.5 -90 0
# L3 won -> teleport back to Wildlife Rescue start
execute if score #guide guide_state matches 15 if score #transition_timer guide_state matches 200 run tp @a 1259.5 -53.0 762.5 -90 0
# L4 won -> teleport back to Save the Furniture start
execute if score #guide guide_state matches 17 if score #transition_timer guide_state matches 200 run tp @a 1306.5 -53.0 769.5 -90 0
# L5 won -> teleport back to Spillway Repair start (Game finished)
execute if score #guide guide_state matches 19 if score #transition_timer guide_state matches 200 run tp @a 1263.5 -52.0 679.5 90 0

# Transition activations & titles (after 3 seconds / 60 ticks pass, timer reaches 180)
# L1 won -> L2 transition active (State 11 -> 1)
execute if score #guide guide_state matches 11 if score #transition_timer guide_state matches 180 run title @a title {"text":"FOLLOW THE PATH","color":"green","bold":true}
execute if score #guide guide_state matches 11 if score #transition_timer guide_state matches 180 run title @a subtitle {"text":"Follow the Guide to Storm Drains!","color":"yellow"}
execute if score #guide guide_state matches 11 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 1

# L2 won -> L3 transition active (State 13 -> 3)
execute if score #guide guide_state matches 13 if score #transition_timer guide_state matches 180 run title @a title {"text":"FOLLOW THE PATH","color":"green","bold":true}
execute if score #guide guide_state matches 13 if score #transition_timer guide_state matches 180 run title @a subtitle {"text":"Follow the Guide to Wildlife Rescue!","color":"yellow"}
execute if score #guide guide_state matches 13 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 3

# L3 won -> L4 transition active (State 15 -> 5)
execute if score #guide guide_state matches 15 if score #transition_timer guide_state matches 180 run title @a title {"text":"FOLLOW THE PATH","color":"green","bold":true}
execute if score #guide guide_state matches 15 if score #transition_timer guide_state matches 180 run title @a subtitle {"text":"Follow the Guide to Save the Furniture!","color":"yellow"}
execute if score #guide guide_state matches 15 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 5

# L4 won -> L5 transition active (State 17 -> 7)
execute if score #guide guide_state matches 17 if score #transition_timer guide_state matches 180 run title @a title {"text":"FOLLOW THE PATH","color":"green","bold":true}
execute if score #guide guide_state matches 17 if score #transition_timer guide_state matches 180 run title @a subtitle {"text":"Follow the Guide to Spillway Repair!","color":"yellow"}
execute if score #guide guide_state matches 17 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 7

# L5 won -> Game finished (State 19 -> 9)
execute if score #guide guide_state matches 19 if score #transition_timer guide_state matches 180 run scoreboard players set #guide guide_state 9

# Timer initializations (set to 240 ticks)
execute if score #guide guide_state matches 11 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 13 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 15 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 17 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240
execute if score #guide guide_state matches 19 unless score #transition_timer guide_state matches 1..240 run scoreboard players set #transition_timer guide_state 240

# 4. Check if player has reached the guide at the destination (6 blocks proximity)
# Transition 1 -> 2 (Guiding to Storm Drains start at 1206 -53 760)
execute if score #guide guide_state matches 1 if entity @a[x=1206,y=-53,z=760,distance=..6] run function guide_transitions:reach_l2
# Transition 3 -> 4 (Guiding to Wildlife Rescue start at 1261 -53 760)
execute if score #guide guide_state matches 3 if entity @a[x=1261,y=-53,z=760,distance=..6] run function guide_transitions:reach_l3
# Transition 5 -> 6 (Guiding to Save the Furniture start at 1307 -53 769)
execute if score #guide guide_state matches 5 if entity @a[x=1307,y=-53,z=769,distance=..6] run function guide_transitions:reach_l4
# Transition 7 -> 8 (Guiding to Spillway Repair start at 1261 -52 677)
execute if score #guide guide_state matches 7 if entity @a[x=1261,y=-52,z=677,distance=..6] run function guide_transitions:reach_l5

# 5. Handle Guide Navigation on State Change
# L1 -> L2 (State 1): Guide to Storm Drains (Disabled for multi-NPC setup)
# execute if score #guide guide_state matches 1 unless score #current_guide_dest guide_state matches 1 run tp @e[tag=ai_guide,limit=1] 1206.5 -53.0 760.5 -90 0
# execute if score #guide guide_state matches 1 unless score #current_guide_dest guide_state matches 1 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 1206 -53 760
execute if score #guide guide_state matches 1 unless score #current_guide_dest guide_state matches 1 run scoreboard players set #current_guide_dest guide_state 1
# L2 -> L3 (State 3): Guide to Wildlife Rescue (Disabled for multi-NPC setup)
# execute if score #guide guide_state matches 3 unless score #current_guide_dest guide_state matches 3 run tp @e[tag=ai_guide,limit=1] 1261.5 -53.0 760.5 -90 0
# execute if score #guide guide_state matches 3 unless score #current_guide_dest guide_state matches 3 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 1261 -53 760
execute if score #guide guide_state matches 3 unless score #current_guide_dest guide_state matches 3 run scoreboard players set #current_guide_dest guide_state 3
# L3 -> L4 (State 5): Guide to Save the Furniture (Disabled for multi-NPC setup)
# execute if score #guide guide_state matches 5 unless score #current_guide_dest guide_state matches 5 run tp @e[tag=ai_guide,limit=1] 1307.5 -53.0 769.5 -90 0
# execute if score #guide guide_state matches 5 unless score #current_guide_dest guide_state matches 5 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 1307 -53 769
execute if score #guide guide_state matches 5 unless score #current_guide_dest guide_state matches 5 run scoreboard players set #current_guide_dest guide_state 5
# L4 -> L5 (State 7): Guide to Spillway Repair (Disabled for multi-NPC setup)
# execute if score #guide guide_state matches 7 unless score #current_guide_dest guide_state matches 7 run tp @e[tag=ai_guide,limit=1] 1261.5 -52.0 677.5 90 0
# execute if score #guide guide_state matches 7 unless score #current_guide_dest guide_state matches 7 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 1261 -52 677
execute if score #guide guide_state matches 7 unless score #current_guide_dest guide_state matches 7 run scoreboard players set #current_guide_dest guide_state 7
# Reset / Start (State 0): Guide back to Sandbag Defense start (Disabled for multi-NPC setup)
# execute if score #guide guide_state matches 0 unless score #current_guide_dest guide_state matches 0 run tp @e[tag=ai_guide,limit=1] 1223.5 -53.0 706.5 180 0
# execute if score #guide guide_state matches 0 unless score #current_guide_dest guide_state matches 0 run easy_npc navigation set pos @e[tag=ai_guide,limit=1] 1223 -53 706
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

# 6. Render Particle Paths on Active Transitions
execute if score #guide guide_state matches 1 run function guide_transitions:show_path1
execute if score #guide guide_state matches 3 run function guide_transitions:show_path2
execute if score #guide guide_state matches 5 run function guide_transitions:show_path3
execute if score #guide guide_state matches 7 run function guide_transitions:show_path4

# === FAILURE TRANSITIONS LOGIC (St. Bernard) ===
# Ticks down transition_timer for failure states (21, 23, 25, 27, 29)
execute if score #guide guide_state matches 21..29 run scoreboard players remove #transition_timer guide_state 1

# Teleports (after 2 seconds / 40 ticks pass, timer reaches 100)
# L1 fail -> teleport back to L1 start (Sandbag)
execute if score #guide guide_state matches 21 if score #transition_timer guide_state matches 100 run tp @a 1218.5 -53.0 707.5 180 0
# L2 fail -> teleport back to L2 start (Drains)
execute if score #guide guide_state matches 23 if score #transition_timer guide_state matches 100 run tp @a 1206.5 -53.0 759.5 -90 0
# L3 fail -> teleport back to L3 start (Wildlife)
execute if score #guide guide_state matches 25 if score #transition_timer guide_state matches 100 run tp @a 1259.5 -53.0 762.5 -90 0
# L4 fail -> teleport back to L4 start (Furniture)
execute if score #guide guide_state matches 27 if score #transition_timer guide_state matches 100 run tp @a 1306.5 -53.0 769.5 -90 0
# L5 fail -> teleport back to L5 start (Spillway)
execute if score #guide guide_state matches 29 if score #transition_timer guide_state matches 100 run tp @a 1263.5 -52.0 679.5 90 0

# Reset state after 3 seconds / 60 ticks pass (timer reaches 80)
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

# === ACTION BAR LOCK HUD INDICATORS (St. Bernard - Bypassed if already completed) ===
# Level 1 (Sandbag Defense button at 1219 -52 701)
execute if score #state sd_state matches 0 unless score #sd_won gp_completed matches 1 if entity @a[x=1219,y=-52,z=701,distance=..8,tag=watched_sandbag_video] run title @a[x=1219,y=-52,z=701,distance=..8] actionbar {"text":"Level Unlocked - Press the button to start!","color":"green"}
execute if score #state sd_state matches 0 unless score #sd_won gp_completed matches 1 if entity @a[x=1219,y=-52,z=701,distance=..8,tag=!watched_sandbag_video] run title @a[x=1219,y=-52,z=701,distance=..8] actionbar {"text":"Level Locked - Watch video to unlock!","color":"red"}

# === MULTI-NPC ACTIVE LEVEL SPAWN & CLEANUP SYSTEM ===

# --- LEVEL 1 (Sandbag Defense) ---
# Active when sd_won is 0
execute if score #sd_won gp_completed matches 0 unless entity @e[tag=guide_l1] run summon easy_npc:chicken 1223.5 -53.0 706.5 {CustomName:'"Guide L1"',Tags:["guide_l1"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},Rotation:[180f,0f]}
execute if score #sd_won gp_completed matches 1 if entity @e[tag=guide_l1] run kill @e[tag=guide_l1]

# --- LEVEL 2 (Storm Drains) ---
# Active when sd_won is 1 and sd2_won is 0
execute if score #sd_won gp_completed matches 1 if score #sd2_won gp_completed matches 0 unless entity @e[tag=guide_l2] run summon easy_npc:chicken 1206.5 -53.0 760.5 {CustomName:'"Guide L2"',Tags:["guide_l2"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},ActionEventSet:{ON_INTERACTION:[{Type:"COMMAND",Cmd:"tag @p[distance=..6] add talked_to_guide",ExecAsUser:0b,PermLevel:4}]},ActionPermissionLevel:4,Rotation:[-90f,0f]}
# Cleanup if not active
execute if score #sd_won gp_completed matches 0 if entity @e[tag=guide_l2] run kill @e[tag=guide_l2]
execute if score #sd2_won gp_completed matches 1 if entity @e[tag=guide_l2] run kill @e[tag=guide_l2]

# --- LEVEL 3 (Wildlife Rescue) ---
# Active when sd2_won is 1 and wr_won is 0
execute if score #sd2_won gp_completed matches 1 if score #wr_won gp_completed matches 0 unless entity @e[tag=guide_l3] run summon easy_npc:chicken 1261.5 -53.0 760.5 {CustomName:'"Guide L3"',Tags:["guide_l3"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},ActionEventSet:{ON_INTERACTION:[{Type:"COMMAND",Cmd:"tag @p[distance=..6] add talked_to_guide",ExecAsUser:0b,PermLevel:4}]},ActionPermissionLevel:4,Rotation:[-90f,0f]}
# Cleanup if not active
execute if score #sd2_won gp_completed matches 0 if entity @e[tag=guide_l3] run kill @e[tag=guide_l3]
execute if score #wr_won gp_completed matches 1 if entity @e[tag=guide_l3] run kill @e[tag=guide_l3]

# --- LEVEL 4 (Save the Furniture) ---
# Active when wr_won is 1 and sf_won is 0
execute if score #wr_won gp_completed matches 1 if score #sf_won gp_completed matches 0 unless entity @e[tag=guide_l4] run summon easy_npc:chicken 1307.5 -53.0 769.5 {CustomName:'"Guide L4"',Tags:["guide_l4"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},ActionEventSet:{ON_INTERACTION:[{Type:"COMMAND",Cmd:"tag @p[distance=..6] add talked_to_guide",ExecAsUser:0b,PermLevel:4}]},ActionPermissionLevel:4,Rotation:[-90f,0f]}
# Cleanup if not active
execute if score #wr_won gp_completed matches 0 if entity @e[tag=guide_l4] run kill @e[tag=guide_l4]
execute if score #sf_won gp_completed matches 1 if entity @e[tag=guide_l4] run kill @e[tag=guide_l4]

# --- LEVEL 5 (Spillway Repair) ---
# Active when sf_won is 1
execute if score #sf_won gp_completed matches 1 unless entity @e[tag=guide_l5] run summon easy_npc:chicken 1261.5 -52.0 677.5 {CustomName:'"Guide L5"',Tags:["guide_l5"],ObjectiveData:{ObjectiveDataSet:{objectives:[{Type:"LOOK_AT_PLAYER",Priority:1},{Type:"FLOAT",Priority:0}]},HasObjectives:1b,HasPlayerTarget:1b},ActionEventSet:{ON_INTERACTION:[{Type:"COMMAND",Cmd:"tag @p[distance=..6] add talked_to_guide",ExecAsUser:0b,PermLevel:4}]},ActionPermissionLevel:4,Rotation:[90f,0f]}
# Cleanup if not active
execute if score #sf_won gp_completed matches 0 if entity @e[tag=guide_l5] run kill @e[tag=guide_l5]
