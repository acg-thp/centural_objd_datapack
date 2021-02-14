execute if entity @e[tag=fairy] as @e[tag=fairy] at @s if entity @p[distance=..64,scores={fairy_movement=25}] run data modify entity @e[tag=fairy,limit=1] Motion set value [0.0,0.005,0.005]
execute if entity @e[tag=fairy] as @e[tag=fairy] at @s if entity @p[distance=..64,scores={fairy_movement=50}] run data modify entity @e[tag=fairy,limit=1] Motion set value [0.0,-0.005,0.005]
execute if entity @e[tag=fairy] as @e[tag=fairy] at @s if entity @p[distance=..64,scores={fairy_movement=75}] run data modify entity @e[tag=fairy,limit=1] Motion set value [0.0,-0.005,-0.005]
execute if entity @e[tag=fairy] as @e[tag=fairy] at @s if entity @p[distance=..64,scores={fairy_movement=100}] run data modify entity @e[tag=fairy,limit=1] Motion set value [0.0,0.005,-0.005]
execute if entity @p[scores={fairy_movement=101..}] as @a[scores={fairy_movement=101..}] run scoreboard players reset @s fairy_movement

execute as @a unless entity @s[scores={fairy_count=-2147483648..2147483647}] run scoreboard players set @s fairy_count 0
execute as @a unless entity @s[scores={fairy_count_max=-2147483648..2147483647}] run scoreboard players set @s fairy_count_max 1

execute if entity @e[type=experience_orb,tag=fairy,tag=!claimed] as @e[type=experience_orb,tag=fairy,tag=!claimed] at @s if entity @p[distance=..3] as @p[distance=..3] if score @s fairy_count = @s fairy_count_max run tag @s add fairy_heal

execute if entity @e[type=experience_orb,tag=fairy,tag=!claimed] as @e[type=experience_orb,tag=fairy,tag=!claimed] at @s if entity @p[tag=fairy_heal] run kill @s[type=experience_orb,tag=fairy,tag=!claimed]
execute if entity @e[type=experience_orb,tag=fairy,tag=!claimed] as @e[type=experience_orb,tag=fairy,tag=!claimed] at @s if entity @p[distance=..3] as @p[distance=..3] if score @s fairy_count < @s fairy_count_max run tag @s add fairy_add
execute if entity @e[type=experience_orb,tag=fairy,tag=!claimed] as @e[type=experience_orb,tag=fairy,tag=!claimed] at @s if entity @p[distance=..3] run tag @s add claimed
execute if entity @e[type=experience_orb,tag=fairy,tag=claimed] as @e[type=experience_orb,tag=fairy,tag=claimed] at @s if entity @p[distance=..3] at @p[distance=..3] run tp @s ~ ~ ~

execute if entity @p[tag=fairy_heal] as @a[tag=fairy_heal] run effect give @s minecraft:instant_health 10 10
execute if entity @p[tag=fairy_heal] as @a[tag=fairy_heal] run tag @s remove fairy_heal

execute if entity @p[tag=fairy_add] as @e[tag=fairy_add] run scoreboard players add @s fairy_count 1
execute if entity @p[tag=fairy_add] as @e[tag=fairy_add] run tag @s remove fairy_add

execute if entity @p[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] as @a[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] store result score @s fairy_death_x run data get entity @s Pos[0] 
execute if entity @p[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] as @a[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] store result score @s fairy_death_y run data get entity @s Pos[1] 
execute if entity @p[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] as @a[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] store result score @s fairy_death_z run data get entity @s Pos[2] 

execute if entity @p[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] as @a[tag=nbs_deathsong,scores={fairy_count=1..},tag=!fairy_coordinates_set] run tag @s add fairy_coordinates_set

execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 run setblock 0 0 0 minecraft:end_gateway replace
execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 store result block ~ ~ ~ ExitPortal.X int 1 run scoreboard players get @s fairy_death_x 
execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 store result block ~ ~ ~ ExitPortal.Y int 1 run scoreboard players get @s fairy_death_y 
execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 store result block ~ ~ ~ ExitPortal.Z int 1 run scoreboard players get @s fairy_death_z 

#execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 run setblock ~ ~1 ~ stone
#execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 run setblock ~ ~3 ~ air
execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 run tp @s ~ ~ ~
execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 run scoreboard players remove @s fairy_count 1
execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 run experience add @s -1 points

execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 run function music:song_of_healing/play
execute if entity @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=fairy_coordinates_set] positioned 0 0 0 if entity @s[distance=..1] run tag @s remove fairy_coordinates_set

execute if entity @p[tag=!nbs_deathsong,tag=!fairy_coordinates_set] as @p[tag=!nbs_deathsong,tag=!fairy_coordinates_set] positioned 0 0 0 unless entity @s[distance=..1] run setblock ~ ~ ~ air
#execute positioned 0 2 0 if entity @p[tag=!nbs_deathsong,tag=!fairy_coordinates_set,distance=..1] as @p[tag=!nbs_deathsong,tag=!fairy_coordinates_set,distance=..1] run setblock ~ ~-1 ~ air