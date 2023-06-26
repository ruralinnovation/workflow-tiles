#! /bin/bash

# -zg z is for zoom and g is for automatically detect maz zoom 

# cookbook 
 nohup tippecanoe -z10 -o bb_map_co_2022areaz10.mbtiles \
    --read-parallel \
    bb_map_co_2022area.geojson

#