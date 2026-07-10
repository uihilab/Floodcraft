# save_blueprint.mcfunction - Saves the decorative grass/ferns before water breaks them
clone 649 -47 452 657 -47 460 649 -60 452 replace force
setblock 649 -61 452 minecraft:bedrock replace
clone 666 -47 499 671 -47 505 666 -60 499 replace force
setblock 666 -61 499 minecraft:bedrock replace
clone 711 -47 459 717 -47 466 711 -60 459 replace force
setblock 711 -61 459 minecraft:bedrock replace
clone 758 -47 419 765 -47 427 758 -60 419 replace force
setblock 758 -61 419 minecraft:bedrock replace
clone 676 -47 363 683 -47 371 676 -60 363 replace force
setblock 676 -61 363 minecraft:bedrock replace
tellraw @a [{"text":"[Storm Drains] ","color":"green"},{"text":"Blueprints for all 5 street zones saved!","color":"white"}]