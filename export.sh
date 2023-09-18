#! /bin/bash
# shellcheck source=streetcred.sh
# credential are store in an other file: streetcred.sh
# it takes an argument: name of the table with schema
# ex ./convert_to_geojson.sh staging.vt_test 

MY_PATH="/Users/olivierleroy/data_swamp/tiles/tr"

source streetcred.sh

echo "Working on $1"
ogr2ogr -f "GeoJSONSeq" $MY_PATH/"$1" \
        PG:"host=$HOST dbname=data user=$PGUSER password=$PGPWD port=5432" "$1" \
        -t_srs EPSG:4326 

ls "$MY_PATH"