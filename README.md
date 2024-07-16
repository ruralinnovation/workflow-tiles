![lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)

Here you find a set of scripts moving spatial data in Postgis to a MapBox account. 

They have been put together into a makefile. You can find more about this one with `make help`. 

The top rule of the makefile will build it up to `.mbtiles`, after that it is your choice to send this tiles to Mapbox (`make export_to_MB`). 

`config.mk` is used to specify the table you want to tiles and both zoom level (min and max, by default 11 and 9). 

We are using (hence you need to have them install):

1.  GDAL's `ogr2ogr` to  convert PG to geojson (`convert_to_geosjon.sh`)

2.  `tippecanoe` -> convert geojson to mbtiles  

Here you an have option for polygons (`make tiling`) and another one for points (`make point_tiles`) 

3. R with the `mapboxapi` wrapper to send tiles to mapbox

4. Optional pmtiles can be used and stored in s3 (`make pmtiling`) 

### Resources: 

R mapboxapi: [https://walker-data.com/mapboxapi/](https://walker-data.com/mapboxapi/)

On tippecanoe: https://github.com/mapbox/tippecanoe

Useful bits of knowledge: 

- `-P` or `--read-parallel` is only an option when using line-delimited JSON

- 50,000 features in the densest tile is the default

- 500K size limit per tile

- `-ab` or `--detect-shared-borders` can be used to reduce the size of polygon by using same simplification on shared borders 

#### pmtiles: https://protomaps.com/

I moved the pmtiles binary to `/usr/local/bin` 

see pmtiles --help for more

Blog post from Miles Mcbain: 

- https://www.milesmcbain.com/posts/vector-tiles/

- https://github.com/qfes/mapbox-tile-server the repo of their server 

More on mbtiles/geojson : https://ckochis.com/create-custom-vector-tiles

Mabpbox documentation : https://docs.mapbox.com/data/tilesets/guides/vector-tiles-standards/#encoding-attributes

this repo has a lot going on: https://github.com/mapbox/awesome-vector-tiles/