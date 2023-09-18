query <- "select 
	           * 
            from 
              sch_broadband.bb_map_bl_2022decarea
            where state_abbr = 'AR';"


load_data <- function(query){
    username <- Sys.getenv("DB_USER")
    password <- Sys.getenv("DB_PWD")
  
  con <- DBI::dbConnect(drv = RPostgres::Postgres(),
                        user = username,
                        password = password,
                        host = "cori-risi.c6zaibvi9wyg.us-east-1.rds.amazonaws.com",
                        port = 5432,
                        dbname = "data",
                        options = "-c search_path=sch_broadband"
                        )
  

  
  bob <- sf::read_sf(con, "sch_broadband.bb_map_bl_2022decarea")
  DBI::dbDisconnect(con)
  return(bob)
}

AR <- load_data(query)