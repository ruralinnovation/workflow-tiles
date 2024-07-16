![lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)

Here you find a set of scripts (shell and R) for moving spatial data in Postgis to a MapBox account. 

## Dependencies

We have used: 

- GNU Make 3.81

- GDAL 3.8.5

- tippecanoe v2.53.0 (https://github.com/felt/tippecanoe)

- R version 4.3.3 with mapboxapi_0.6

- pmtiles 1.19.2

- `.pgpass` a pgpass file at the `~/` is needed to specify host, user and password to connect to the PG database

## Workflow

Shell and R scripts have been put together into a makefile. You can find more about this one with `make help`. 

The top rule of the makefile will build it up to `.mbtiles`, after that it is your choice to send this tiles to Mapbox (`make export_to_MB`). 

For the first run you will need to copy `config.mk.example` to `config.mk` and update the input arguments (table name, maximum zoom, and  minium zoon). 
The make file will use these values to specify the table you convert to tiles (`MY_TABLE`) and both zoom levels (`MAX_Z` and `MIN_Z`, by default 11 and 9). 

We are using (hence you need to have them install):

1.  GDAL's `ogr2ogr` to  convert PG to geojson (`convert_to_geosjon.sh`)

2.  `tippecanoe` -> convert geojson to mbtiles  

Here you an have option for polygons (`make tiling`) and an other one for points (`make point_tiles`) 

3. R with the `mapboxapi` wrapper to send tiles to mapbox

4. Optional pmtiles can be generated (`make pmtiling`) 

### Resources: 

R's mapboxapi: [https://walker-data.com/mapboxapi/](https://walker-data.com/mapboxapi/)

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