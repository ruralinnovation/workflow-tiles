# Date May 2023
# Author Olivier Leroy
# Goal: push to mapbox the tiles created
# the access tokens is stored in ~/.Renviron

library("mapboxapi")

if (!is.character(mapboxapi::get_mb_access_token())) {
  print("see mapboxapi::mb_access_token() for help")
}

args <- commandArgs(trailingOnly = TRUE)
#print(args[1])

id <- gsub("\\.", "_", args[1])

path <- paste0(getwd(), "/temp/", args[1], ".mbtiles")
name <- unlist(strsplit(path, ".", fixed = TRUE))[2]

cat(sprintf("id is %s\n", id))

cat(sprintf("name is %s\n", name))

mapboxapi::upload_tiles(
    input = path,
    username = "ruralinno",
    #access_token = tokens,
    tileset_id = id,
    tileset_name = name,
    multipart = TRUE
)
