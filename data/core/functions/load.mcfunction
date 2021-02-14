#Garbage Collect (This should happen on close as well and perhaps be un needed during boot.)
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REMOVE ] ","color":"red"},{"text":"data remove storage core:load status","clickEvent":{"action":"suggest_command","value":"/data remove storage core:load status"},"color":"light_purple"}]
data remove storage core:load status

#Status Loading
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ MODIFY ] ","color":"gold"},{"text":"data modify storage core:load status set value loading","clickEvent":{"action":"suggest_command","value":"/data modify storage core:load status set value loading"},"color":"light_purple"}]
data modify storage core:load status set value loading


#Teardown
execute if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REMOVE ] ","color":"red"},{"text":"data remove storage core:require require","clickEvent":{"action":"suggest_command","value":"/data remove storage core:require require"},"color":"light_purple"}]
data remove storage core:require require

#Setup Require
execute store success storage core:require require byte 1 run function core:require
execute if data storage core:require {require:0b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ ERROR ] ","color":"red"},{"text":"function require:load required but not found.","color":"white"}]
execute if data storage core:require {require:1b} if entity @p[tag=verbose] as @a[tag=verbose] run tellraw @s [{"text":" [ REQUIRE ] ","color":"pink"},{"text":" function require:load","clickEvent":{"action":"suggest_command","value":"/function require:load"},"color":"light_purple"}]

#function load:load
function fairy:load
function music:death_song/load
function music:the_great_fairy_fountain/load

function music:to_a_waterfow/load
function music:song_of_healing/load

function music:as_the_world_falls_down/load

function city:load

function elevator:load
#function centural:load