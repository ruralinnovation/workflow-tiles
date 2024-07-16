#!/bin/bash
# PostgreSQL connection info is stored in ~/.pgpass
# it takes an argument: name of the table with schema
# ex ./convert_to_geojson.sh staging.vt_test

set -o errexit
set -o nounset
set -o pipefail

# Extract connection vars from the connection string in ~/.pgpass
export HOST=$(head -n 1 ~/.pgpass | cut -d : -f 1)
export PGUSER=$(head -n 1  ~/.pgpass | cut -d : -f 4)
export PGPWD=$(head -n 1 ~/.pgpass | cut -d : -f 5 )

echo "Working on $1"
ogr2ogr -f "GeoJSONSeq" temp/"$1" \
        PG:"host=$HOST dbname=data user=$PGUSER password=$PGPWD port=5432" "$1" \
        -t_srs EPSG:4326

mv temp/"$1" temp/"$1".geojson

ls -lh temp
