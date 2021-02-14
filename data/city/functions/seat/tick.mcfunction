
execute unless entity @p[distance=..6] run kill @s[tag=seat,type=minecraft:armor_stand]
execute if entity @p[distance=..3,scores={seat_action=1..},tag=!sitting] as @p[distance=..3,scores={seat_action=1..},tag=!sitting] run gamemode spectator

execute if entity @p[distance=..3,scores={seat_action=1..},tag=!sitting] as @p[distance=..3,scores={seat_action=1..},tag=!sitting] run spectate @s @p[distance=..3,scores={seat_action=1..},tag=!sitting]
execute if entity @p[distance=..3,scores={seat_action=1..},tag=!sitting] as @p[distance=..3,scores={seat_action=1..},tag=!sitting] run tag @p[distance=..3,scores={seat_action=1..},tag=!sitting] add sitting


execute if entity @s[tag=west] run function city:seat/west/tick