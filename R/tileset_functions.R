# Expects a local .Renviron file with: ----
# HOST='xxxx.us-east-1.rds.amazonaws.com'
# PGPWD='xxxx'
# PGUSER='xxxx'
# MY_PATH='xxx/xxx'


HOST <- Sys.getenv('HOST')
PGPWD <- Sys.getenv('PGPWD')
PGUSER <- Sys.getenv('PGUSER')
#DATA_PATH="$HOME/data_swamp/tr"
DATA_PATH <- Sys.getenv('MY_PATH')

data_path <- if (length(commandArgs(trailingOnly = TRUE)) > 0) {
  length(commandArgs(trailingOnly = TRUE))
} else {
  DATA_PATH
}
schema_name <- "bcat"
table_name <- "bcat_county_summary"

convert_to_geojson <- function (schema_name, table_name) {

  #convert_cmd <- paste0(system.file("convert_to_geojson.sh", package = "cori.data.api", mustWork = TRUE), " ", schema_table_name)
  #convert_cmd <- paste0("bash convert_to_geojson.sh", " ", schema_table_name)
  convert_cmd <- paste0('ogr2ogr -f "GeoJSONSeq" ', data_path, '/', table_name,'.geojson PG:"host=', HOST, ' dbname=data user=', PGUSER, ' password=', PGPWD, ' port=5432" "', schema_name, '.', table_name, '" -t_srs EPSG:4326')
  
  #cat(convert_cmd)
  system(convert_cmd)
}

convert_to_mbtile <- function (schema_name, table_name) {

  # nohup tippecanoe -z10 -o bb_map_co_2022areaz10.mbtiles \
  #   --read-parallel \
  #   bb_map_co_2022area.geojson
  tile_cmd <- paste0('tippecanoe -z10 -o ', data_path, '/', table_name,'.mbtiles --read-parallel ', data_path, '/', table_name,'.geojson')
  
  
  cat(tile_cmd)
  
  system(tile_cmd)
}
