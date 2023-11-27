# Expects a local .Renviron file with: ----
# PGHOST='xxxx.us-east-1.rds.amazonaws.com'
# PGPASSWORD='xxxx'
# PGUSER='xxxx'
# MY_PATH='xxx/xxx'


PGHOST <- Sys.getenv('PGHOST')
PGPASSWORD <- Sys.getenv('PGPASSWORD')
PGUSER <- Sys.getenv('PGUSER')
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
  convert_cmd <- paste0('ogr2ogr -f "GeoJSONSeq" ', DATA_PATH, '/', table_name,'.json PG:"host=', PGHOST, ' dbname=data user=', PGUSER, ' password=', PGPASSWORD, ' port=5432" "', schema_name, '.', table_name, '" -t_srs EPSG:4326')

  #cat(convert_cmd)
  system(convert_cmd)
}

convert_to_mbtile <- function (schema_name, table_name, max_z = 11, min_z = 2) {

  # tippecanoe -z11 -Z3 -o temp/$(MY_TABLE).mbtiles \
  #   --read-parallel \
  #   --full-detail=12 \
  #   --minimum-detail=10 \
  #   --low-detail=10 \
  #   temp/$(MY_TABLE).geojson
  tile_cmd <- paste0('tippecanoe -z', max_z, ' -Z', min_z, ' -o ', data_path, '/', table_name,'.mbtiles  --full-detail=12 --minimum-detail=10 --low-detail=10 --read-parallel ', data_path, '/', table_name,'.json')
  
  cat(tile_cmd)
  
  system(tile_cmd)
}
