# date januaray 2024
# author olivier leroy
# goal: test a bit Mbtiles
# source: https://www.milesmcbain.com/posts/vector-tiles/ 

### Miles workflow

library(mvtview)
library(rdeck)

path_to_mbtiles <- "data/abs_mesh_blocks.mbtiles"

# Fire up the server
serve_mvt("data/abs_mesh_blocks.mbtiles", port = 8765)
# Serving your tile data from http://0.0.0.0:8765/abs_mesh_blocks.json.
# Run clean_mvt() to remove all server sessions.

# Map the data
rdeck() |>
  add_mvt_layer(
    data = tile_json("http://0.0.0.0:8765/abs_mesh_blocks.json"),
    get_fill_color = scale_color_linear(
      random_attribute
    ),
    opacity = 0.6
  )

rdeck() |>
  add_mvt_layer(
    data = tile_json(
      "http://0.0.0.0:4576/proj_bead.new_england_msft_v3.json"))

rdeck() |>
  add_mvt_layer(
    data = "http://0.0.0.0:8765/proj_bead.vt_test/{z}/{x}/{y}.vector.pbf",
    get_fill_color = scale_color_linear(
      cnt_100_20,
      limits = c(0, 300)
    ),
    opacity = 0.6
  )


# clean_mvt()
