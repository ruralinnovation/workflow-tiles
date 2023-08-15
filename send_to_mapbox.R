# Date Mai 2023
# Author Olivier Leroy
# Goal: push to mapbox the tiles created
# the access tokens is stored in ~/.Renviron 
# see 
mapboxapi::get_mb_access_token()

library("mapboxapi")

#args <- commandArgs()

path="/Users/olivierleroy/data_swamp/tiles/tr/tr_100_20_dec2022v3_z11z9.mbtiles"

mapboxapi::upload_tiles(
    input = path,
    username = "ruralinno",
    #access_token = tokens,
    tileset_id = "tr_real100_20_dec2022v3_z11z9",
    tileset_name = "tr_rea100_20_dec2022v3_z11z9",
    multipart = TRUE
)
