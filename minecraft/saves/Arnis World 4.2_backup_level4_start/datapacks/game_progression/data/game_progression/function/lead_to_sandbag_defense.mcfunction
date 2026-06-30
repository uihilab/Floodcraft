# Teleport player to Sandbag Defense start button
tp @a 1218.5 -53 704.5 180 0

# Reset the return to lobby trigger just in case
scoreboard players set @a return_to_lobby 0

# Print the Guide NPC introduction and video link
tellraw @a [{"text":"[Guide] ","color":"gold","bold":true},{"text":"Welcome to St. Bernard Parish! We need to protect this house from rising waters. Before we start, please watch this educational video on sandbagging: ","color":"white"},{"text":"[Watch Video]","color":"aqua","underlined":true,"clickEvent":{"action":"open_url","value":"https://sandbags.info/educational-videos/v/thursday-morning-flow-xay84-m7bt7"}},{"text":" (Press T and click!)","color":"gray","italic":true}]
tellraw @a [{"text":"[Guide] ","color":"gold","bold":true},{"text":"Are you ready to deploy the sandbags and start the flood simulation? ","color":"white"},{"text":"[Agree & Start]","color":"green","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/function sandbag_defense:start"}}]
