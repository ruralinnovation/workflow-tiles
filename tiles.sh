#! /bin/bash

# -zg z is for zoom and g is for automatically detect maz zoom 

# cookbook 
 nohup tippecanoe -z11 -Z9 -o tr_25_3_dec2022v3_z11z9.mbtiles \
    --read-parallel \
    --no-tile-size-limit \
    sch_broadband.bb_map_tr_25_3_2022decareav3b.geojson &

#