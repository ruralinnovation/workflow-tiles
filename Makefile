SHELL := bash
.ONESHELL:
.SHELLFLAGS := -euo pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables

include config.mk



## import	: Import and convert PG table to geojson line delimited
import : config.mk convert_to_geojson 
	mkdir -p temp/ 
	bash convert_to_geojson.sh $(MY_TABLE)

## clean 	: Delet temp/ directory
clean : 
	rm -rf temp/
.PHONY :clean

help : Makefile
	@sed -n 's/^##//p' $<
.PHONY : help