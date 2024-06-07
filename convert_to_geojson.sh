#!/bin/bash
# shellcheck source=.Renviron
# credential are store in an other file: .Renviron
# it takes an argument: name of the table with schema
# ex ./convert_to_geojson.sh staging.vt_test

# shellcheck source=.Renviron
source .Renviron

echo "Working on $1"
<<<<<<< HEAD
ogr2ogr -f "GeoJSONSeq" temp/"$1" \
        PG:"host=$PGHOST dbname=data user=$PGUSER password=$PGPASSWORD port=5432" "$1" \
        -t_srs EPSG:4326

mv temp/"$1" temp/"$1".geojson

ls -lh temp
