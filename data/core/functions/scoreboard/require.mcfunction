#Garbage Collect (This should happen on close as well and perhaps be un needed during boot.)
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REQUIRE ] ","color":"dark_green"},{"text":"data remove storage core:scoreboard/require status","clickEvent":{"action":"suggest_command","value":"/data remove storage core:scoreboard/require status"},"color":"light_purple"}]
data remove storage core:scoreboard/require status

#Status Loading
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REQUIRE ] ","color":"dark_green"},{"text":"data modify storage core:scoreboard/require status set value require","clickEvent":{"action":"suggest_command","value":"/data modify storage core:scoreboard/require status set value require"},"color":"light_purple"}]
data modify storage core:scoreboard/require status set value require

#Check For Required Scoreboard Files
execute store success storage core:scoreboard/require reset byte 1 run function core:scoreboard/reset
execute if data storage core:scoreboard/require {reset:0b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ ERROR ] ","color":"red"},{"text":"Missing Core Function File core/functions/scoreboard/reset","color":"white"}]
execute if data storage core:scoreboard/require {reset:1b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REQUIRE ] ","color":"dark_green"},{"text":"function core:scoreboard/reset","clickEvent":{"action":"suggest_command","value":"/function core:scoreboard/reset"},"color":"light_purple"}]