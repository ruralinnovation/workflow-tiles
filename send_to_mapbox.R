# Date Mai 2023
# Author Olivier Leroy
# Goal: push to mapbox the tiles created
# the access tokens is stored in ~/.Renviron 
# see mapboxapi::get_mb_access_token()

library("mapboxapi")

path="/Users/olivierleroy/data_swamp/tiles/bl/bb_map_co_2022areaz10.mbtiles"

mapboxapi::upload_tiles(
    input = path,
    username = "ruralinno",
    #access_token = tokens,
    tileset_id = "bb_map_tr_2022junez11coalesce",
    tileset_name = "bb_map_tr_2022junez11coalesce",
    multipart = TRUE
)