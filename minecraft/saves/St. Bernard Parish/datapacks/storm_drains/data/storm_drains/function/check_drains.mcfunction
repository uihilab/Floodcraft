# check_drains.mcfunction - Checks if custom debris blocks at Z/X coordinates are broken to clear each drain

# Drain 1 Check
execute if score #drain1_cleared sd2_score matches 0 unless block 1070 -53 737 minecraft:dead_bush unless block 1071 -53 737 minecraft:fern unless block 1070 -53 738 minecraft:dead_bush unless block 1070 -53 739 minecraft:fern unless block 1070 -53 740 minecraft:short_grass run function storm_drains:clear_drain1

# Drain 2 Check
execute if score #drain2_cleared sd2_score matches 0 unless block 1094 -53 672 minecraft:fern run function storm_drains:clear_drain2

# Drain 3 Check
execute if score #drain3_cleared sd2_score matches 0 unless block 1139 -53 781 minecraft:short_grass unless block 1140 -53 781 minecraft:cobweb unless block 1140 -53 782 minecraft:fern run function storm_drains:clear_drain3

# Drain 4 Check
execute if score #drain4_cleared sd2_score matches 0 unless block 1155 -53 696 minecraft:cobweb unless block 1156 -53 696 minecraft:dead_bush unless block 1157 -53 696 minecraft:cobweb run function storm_drains:clear_drain4

# Drain 5 Check
execute if score #drain5_cleared sd2_score matches 0 unless block 1198 -53 754 minecraft:short_grass unless block 1198 -53 755 minecraft:fern run function storm_drains:clear_drain5
