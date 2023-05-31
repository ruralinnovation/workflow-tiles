#! /bin/bash

# -zg z is for zoom and g is for automatically detect maz zoom 

# cookbook 
 nohup tippecanoe -zg -o sch_broadband.bb_map_bl_2022june.mbtiles 
    --coalesce-densest-as-needed \
    --extend-zooms-if-still-dropping \
    --read-parallel \
    sch_broadband.bb_map_bl_2022june