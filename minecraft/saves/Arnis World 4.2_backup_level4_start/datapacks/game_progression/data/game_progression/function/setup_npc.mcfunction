# 0. Ensure game difficulty allows the custom human NPC (Piglin) to exist, but disable natural spawning
difficulty easy
gamerule doMobSpawning false

# 1. Kill existing NPC command removed to prevent deleting configured NPCs on reload
# kill @e[tag=ai_npc]

# 2. Summon Guide NPC command removed completely (handled manually by player)

# 3. Clean up the selection wall at Z=930 and Z=931
# Replace command blocks with stone bricks
fill 605 -53 930 609 -53 930 minecraft:stone_bricks replace

# Replace signs and buttons with air at Z=931
fill 605 -52 931 609 -53 931 minecraft:air replace

# Clear any temporary blocks at 611..614
fill 611 -53 930 614 -54 930 minecraft:stone_bricks replace

# 4. Configure CreatureChat removed (NPC deleted)
# 5. Notify player removed
