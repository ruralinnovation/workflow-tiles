# Date Mai 2023
# Author Olivier Leroy
# Goal: push to mapbox the tiles created
# the access tokens is stored in ~/.Renviron 
# see 
mapboxapi::get_mb_access_token()

library("mapboxapi")

path="/Users/olivierleroy/data_swamp/tiles/tr/tr_25_3_2022_z11z9.mbtiles"

mapboxapi::upload_tiles(
    input = path,
    username = "ruralinno",
    #access_token = tokens,
    tileset_id = "tr_25_3_2022_z11z9",
    tileset_name = "tr_25_3_2022_z11z9",
    multipart = TRUE
)
