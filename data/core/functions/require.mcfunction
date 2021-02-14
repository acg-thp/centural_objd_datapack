
#Reset Core Require Status
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REMOVE ] ","color":"red"},{"text":"data remove storage require:load status","clickEvent":{"action":"suggest_command","value":"/data remove storage require:load status"},"color":"light_purple"}]
data remove storage core:require status

#Status Loading
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ MODIFY ] ","color":"gold"},{"text":"data modify storage require:load status set value loading","clickEvent":{"action":"suggest_command","value":"/data modify storage core:load status set value loading"},"color":"light_purple"}]
data modify storage core:require status set value loading

#Teardown Pervious Scoreboard
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REMOVE ] ","color":"red"},{"text":"data remove storage core:require scoreboard","clickEvent":{"action":"suggest_command","value":"data remove storage core:require scoreboard"},"color":"light_purple"}]
data remove storage core:require scoreboard

execute store success storage core:require scoreboard byte 1 run function core:scoreboard/require
execute if data storage core:require {scoreboard:0b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ ERROR ] ","color":"red"},{"text":"Missing Core Function File core/functions/scoreboard/require","color":"white"}]

execute if data storage core:require {scoreboard:1b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REQUIRE ] ","color":"pink"},{"text":"function core:scoreboard/require","clickEvent":{"action":"suggest_command","value":"/function core:scoreboard/require"},"color":"light_purple"}]


#####


#Teardown Previous Plugin
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REMOVE ] ","color":"red"},{"text":"data remove storage core:require plugin","clickEvent":{"action":"suggest_command","value":"data remove storage core:require plugin"},"color":"light_purple"}]
data remove storage core:require plugin

execute store success storage core:require plugin byte 1 run function core:plugin/require
execute if data storage core:require {plugin:0b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ ERROR ] ","color":"red"},{"text":"Missing Core Function File core/functions/plugin/require","color":"white"}]

execute if data storage core:require {plugin:1b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REQUIRE ] ","color":"pink"},{"text":"function core:plugin/require","clickEvent":{"action":"suggest_command","value":"/function core:plugin/require"},"color":"light_purple"}]