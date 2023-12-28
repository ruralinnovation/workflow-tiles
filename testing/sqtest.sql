create table staging.jsont (
	id integer,
	bob jsonb,
	geom geometry
);

insert into staging.jsont 
values
(1, '{"ilecs": ["1234", "456"]}', 'POINT(0 0)'),
(2, '{"ilecs": ["1289"]}', 'POINT(0 1)'),
(3, '{"ilecs": []}', 'POINT(1 0)');