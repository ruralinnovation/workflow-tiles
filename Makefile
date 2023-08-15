SHELL := bash
.ONESHELL:
.SHELLFLAGS := -euo pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables

include config.mk

# convert to geojson from DB
tiles : config.mk 
	mkdir -p temp/ 
	bash convert_to_geojson.sh $(MY_TABLE)

clean : 
	rm -rf temp/
.PHONY :clean