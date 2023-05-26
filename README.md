Here you find a set of scripts moving spatial data in Postgis to a mapbox account. 

We are using:

1.  gdal's `ogr2ogr` -> convert PG to geojson

2.  tippecanoe -> convert geojson to mbtiles 

3. R with the rmapboxapi wrapper to send tiles to mapbox

