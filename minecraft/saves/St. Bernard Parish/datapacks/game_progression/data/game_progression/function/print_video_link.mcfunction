# print_video_link.mcfunction - saves
# Reset trigger
scoreboard players set @s watch_video 0

# Print the clickable educational video link to unlock Level 1
tellraw @s [{"text":"[Guide] ","color":"gold","bold":true},{"text":"To unlock Level 1 (Sandbag Defense), watch this educational video: ","color":"yellow"},{"text":"[Watch Video]","color":"aqua","underlined":true,"clickEvent":{"action":"open_url","value":"https://sandbags.info/educational-videos/v/thursday-morning-flow-xay84-m7bt7"}},{"text":" (Press T and click!)","color":"gray","italic":true}]

# Grant level unlock tag to player
tag @s add watched_sandbag_video
