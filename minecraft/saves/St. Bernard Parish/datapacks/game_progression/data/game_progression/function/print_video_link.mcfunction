# print_video_link.mcfunction
# Reset trigger
scoreboard players set @s watch_video 0

# Print the clickable educational video link in chat separately
tellraw @s [{"text":"[Guide] ","color":"gold","bold":true},{"text":"Click here to watch the educational video: ","color":"yellow"},{"text":"[Watch Video]","color":"aqua","underlined":true,"clickEvent":{"action":"open_url","value":"https://sandbags.info/educational-videos/v/thursday-morning-flow-xay84-m7bt7"}},{"text":" (Press T and click!)","color":"gray","italic":true}]
