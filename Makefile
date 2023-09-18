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
tiling : config.mk 
	tippecanoe $(MAX_Z) $(MIN_Z) -o temp/$(MY_TABLE).mbtiles \
    --read-parallel \
    --full-detail=12 \
	--minimum-detail=10 \
	--low-detail=10 \
    temp/$(MY_TABLE).geojson

## pmtiling	: Convert mbtiles to pmtiles
pmtiling: config.mk
	pmtiles convert temp/$(MY_TABLE).mbtiles temp/$(MY_TABLE).pmtiles 

## export_to_MB	: Export to mapbox
export_to_MB : 
	Rscript send_to_mapbox.R $(MY_TABLE)

## clean 	: Delet temp/ directory
clean : 
	rm -rf temp/
.PHONY :clean

help : Makefile
	@sed -n 's/^##//p' $<
.PHONY : help