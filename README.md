Here you find a set of scripts moving spatial data in Postgis to a mapbox account. 

We are using:

1.  gdal's `ogr2ogr` -> convert PG to geojson

2.  tippecanoe -> convert geojson to mbtiles 

3. R with the rmapboxapi wrapper to send tiles to mapbox

Resources on tippecanoe: https://github.com/mapbox/tippecanoe

Useful bit of knowledge: 

- `-P` or `--read-parallel` is only an option when using line-delimited JSON

- 50,000 features in the densest tile is the default

- 500K size limit per tile

- `-ab` or `--detect-shared-borders` can be used to reduce the size of polygon by using same simplification on shared borders 

TODO : Make them into either one script or one makefile
