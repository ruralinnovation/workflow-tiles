SHELL := bash
.ONESHELL:
.SHELLFLAGS := -euo pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables

include config.mk

# top level rule
build : import tiling

## import	: Import and convert PG table to geojson line delimited
import : config.mk convert_to_geojson.sh 
	mkdir -p temp/ 
	bash convert_to_geojson.sh $(MY_TABLE)

## tiling	: Convert geojson to mbtiles
tiling : config.mk $(MY_TABLE)
	tippecanoe $(MAX_Z) $(MIN_Z) -o temp/$(MY_TABLE).mbtiles \
    --read-parallel \
    --no-tile-size-limit \
    temp/$(MY_TABLE).geojson

## export_to_MB	: Export to mapbox
export_to_MB : 
	Rscript sent_to_mapbox $(MY_TABLE)

## clean 	: Delet temp/ directory
clean : 
	rm -rf temp/
.PHONY :clean

help : Makefile
	@sed -n 's/^##//p' $<
.PHONY : help