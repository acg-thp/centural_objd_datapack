scoreboard objectives add nbs_deathsong dummy
scoreboard objectives add nbs_deathsong_t dummy
scoreboard players set speed nbs_deathsong 80
scoreboard objectives add death_song minecraft.custom:minecraft.deaths "Death song plays if no fairys exist on player"
scoreboard objectives add death_song_end minecraft.custom:minecraft.time_since_death "Determines when to stop the song when above 0"