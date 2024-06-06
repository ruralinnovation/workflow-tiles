# Date Mai 2023
# Author Olivier Leroy
# Goal: push to mapbox the tiles created
# the access tokens is stored in ~/.Renviron

library("mapboxapi")

if (!is.character(mapboxapi::get_mb_access_token())) {
  print("see mapboxapi::mb_access_token() for help")
}

args <- commandArgs(trailingOnly = TRUE)

name <- args[1]

path <- paste0(getwd(), "/temp/", args[1], ".mbtiles")
id <- unlist(strsplit(path, ".", fixed = TRUE))[2]

mapboxapi::upload_tiles(
  input = path,
  username = "ruralinno",
  tileset_id = id,
  tileset_name = name,
  multipart = TRUE
)
