#!/bin/bash
# credential are store in an other file: streetcred.sh
# it takes an argument: name of the table with schema
# ex ./convert_to_geojson.sh staging.vt_test

set -o errexit
set -o nounset
set -o pipefail

export HOST=$(cut -d : -f 1  ~/.pgpass)
export PGUSER=$(cut -d : -f 4  ~/.pgpass)
export PGPWD=$(cut -d : -f 5  ~/.pgpass)

echo "Working on $1"
ogr2ogr -f "GeoJSONSeq" temp/"$1" \
        PG:"host=$HOST dbname=data user=$PGUSER password=$PGPWD port=5432" "$1" \
        -t_srs EPSG:4326

mv temp/"$1" temp/"$1".geojson

ls -lh temp
