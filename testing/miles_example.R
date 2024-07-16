# source: https://www.milesmcbain.com/posts/vector-tiles/ 


library(sf)
library(dplyr)
library(magrittr)

# "https://www.abs.gov.au/statistics/standards/australian-statistical-geography-standard-asgs-edition-3/jul2021-jun2026/access-and-down

mb_shapes <- read_sf("data/MB_2021_AUST_SHP_GDA2020/MB_2021_AUST_GDA2020.shp")

mb_shapes %>%
  st_transform(4326) %>% # standard lon lat 
  mutate(
    random_attribute = sample(
      1:7,
      nrow(cur_data()),
      replace = TRUE
    )
  ) %>%
  select(
    geometry,
    random_attribute,
    MB_CODE21,
    MB_CAT21,
    SA2_NAME21
  ) %>%
  st_write(
    "data/mb_shapes.geojson"
  )