
include config.mk

# convert to geojson from DB
.PHONY : tiles.mbtiles
tiles :
	mkdir -p $(MY_PATH)
	bash convert_to_geojson.sh $(MY_TABLE) $(MY_PATH)
# $(MY_PATH)/$(MY_TABLE)


clean : 
	rm -rf $(MY_PATH)