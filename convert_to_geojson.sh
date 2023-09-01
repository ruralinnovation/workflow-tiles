#!/bin/bash
# shellcheck source=streetcred.sh
# credential are store in an other file: streetcred.sh
# it takes an argument: name of the table with schema
# ex ./convert_to_geojson.sh staging.vt_test

set -e

source streetcred.sh

echo "Working on $1"
echo "Here: $DATA_PATH/$1"
ogr2ogr -f "GeoJSONSeq" $DATA_PATH/"$1.json" \
        PG:"host=$HOST dbname=data user=$PGUSER password=$PGPWD port=5432" "$1" \
        -t_srs EPSG:4326 

ls "$DATA_PATH"
