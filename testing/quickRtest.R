# date januaray 2024
# author olivier leroy
# goal: test a bit Mbtiles


library(DBI)
library(RSQLite)

con <- dbConnect(RSQLite::SQLite(),
    "temp/proj_bead.vt_test.mbtiles")

DBI::dbListTables(con)

DBI::dbGetQuery(con, 'select * from tiles limit 10')

### Miles workflow

library(mvtview)
library(rdeck)

serve_mvt("temp/proj_bead.vt_test3.mbtiles", port = 8765, .serve_mode = "disk")


rdeck() |>
  add_mvt_layer(
    data = tile_json("http://0.0.0.0:8765/proj_bead.vt_test.json"),
    get_fill_color = scale_color_linear(
      cnt_100_20
    ),
    opacity = 0.6
  )
    

rdeck() |>
  add_mvt_layer(
    data = "http://0.0.0.0:8765/proj_bead.vt_test/{z}/{x}/{y}.vector.pbf",
    get_fill_color = scale_color_linear(
      cnt_100_20,
      limits = c(0, 300)
    ),
    opacity = 0.6
  )


# Python3 -m http.server 8765

clean_mvt()