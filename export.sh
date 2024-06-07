#! /bin/bash
# shellcheck source=.Renviron
# credential are store in an other file: .Renviron
# it takes an argument: name of the table with schema
# ex ./convert_to_geojson.sh staging.vt_test 

DATA_PATH=$DATA_PATH

source .Renviron

echo "Working on $1"
ogr2ogr -f "GeoJSONSeq" $DATA_PATH/"$1" \
        PG:"host=$PGHOST dbname=data user=$PGUSER password=$PGPWD port=5432" "$1" \
        -t_srs EPSG:4326 

ls "$DATA_PATH"
