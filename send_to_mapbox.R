library("mapboxapi")

mapboxapi::upload_tiles(
    input = path,
    username = "ruralinno",
    #access_token = tokens,
    tileset_id = "bb_map_tr_100_20_2022june",
    tileset_name = "bcat_tr_100_20",
    multipart = TRUE
)