create table staging.vt_ny as
  select * from sch_brodband where geoid_st = '50' or geoid_st = '33';