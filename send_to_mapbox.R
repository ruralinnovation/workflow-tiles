# Date Mai 2023
# Author Olivier Leroy
# Goal: push to mapbox the tiles created
# the access tokens is stored in ~/.Renviron 
# see mapboxapi::get_mb_access_token()

library("mapboxapi")

path="/Users/olivierleroy/data_swamp/sch_broadband.bb_map_bl_2022june"

mapboxapi::upload_tiles(
    input = path,
    username = "ruralinno",
    #access_token = tokens,
    tileset_id = "bb_map_bl_2022june",
    tileset_name = "bcat_bl_100_20",
    multipart = TRUE
)