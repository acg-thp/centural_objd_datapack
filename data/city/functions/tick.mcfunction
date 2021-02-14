

execute if entity @p[tag=in_room] as @a[tag=in_room] at @s run function city:in_room/tick

execute if entity @p[scores={seat_action=1..}] as @a[scores={action_timer=1..}] run scoreboard players set @s action_timer 0


execute if entity @e[tag=seat] as @e[tag=seat] at @s run function city:seat/tick