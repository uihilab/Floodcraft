# check_drains.mcfunction
execute if score #drain1_cleared sd2_score matches 0 if block 762 -47 422 air if block 762 -47 423 air run function storm_drains:clear_drain1
execute if score #drain2_cleared sd2_score matches 0 if block 714 -47 462 air if block 714 -47 463 air run function storm_drains:clear_drain2
execute if score #drain3_cleared sd2_score matches 0 if block 669 -47 502 air if block 668 -47 502 air if block 668 -47 503 air if block 667 -47 503 air if block 667 -47 504 air run function storm_drains:clear_drain3
execute if score #drain4_cleared sd2_score matches 0 if block 653 -47 458 air if block 653 -47 457 air if block 653 -47 456 air run function storm_drains:clear_drain4
execute if score #drain5_cleared sd2_score matches 0 if block 677 -47 367 air if block 678 -47 367 air if block 679 -47 367 air if block 679 -47 366 air if block 679 -47 365 air run function storm_drains:clear_drain5