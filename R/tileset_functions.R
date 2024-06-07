t # Expects a local .Renviron file with: ----
# PGHOST='xxxx.us-east-1.rds.amazonaws.com'
# PGPASSWORD='xxxx'
# PGUSER='xxxx'
# DATA_PATH='xxx/xxx'


PGHOST <- Sys.getenv('PGHOST')
PGPASSWORD <- Sys.getenv('PGPASSWORD')
PGUSER <- Sys.getenv('PGUSER')
DATA_PATH <- Sys.getenv('DATA_PATH')

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

  # message(convert_cmd)
  system(convert_cmd)
}

convert_to_mbtile <- function (schema_name, table_name, max_z = 11, min_z = 3) {

  # tippecanoe -z11 -Z3 -o temp/$(MY_TABLE).mbtiles \
  #   --full-detail=12 \
  #   --minimum-detail=1 \
  #   --low-detail=9 \
  #   --no-tile-compression \  ## <= non-gzipped is easier to debug/inspect, BUT mvtview server will NOT work with this option
  #   --read-parallel \
  #   temp/$(MY_TABLE).geojson
  tile_cmd <- paste0('tippecanoe -z', max_z, ' -Z', min_z, ' -o ', data_path, '/', table_name,'.mbtiles  --full-detail=12 --minimum-detail=5 --low-detail=7 --read-parallel ', data_path, '/', table_name,'.json')
  
  message(tile_cmd)
  
  system(tile_cmd)
}
