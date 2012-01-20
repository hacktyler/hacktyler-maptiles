HERE=`pwd`
DATABASE=tylercensus
HOST=localhost

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln blocks2010 -nlt multipolygon -t_srs EPSG:900913 -overwrite tl_2010_48423_tabblock10

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln tiger_lines -nlt multilinestring -t_srs EPSG:900913 -overwrite  tl_2010_48423_edges

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln water -nlt multipolygon -t_srs EPSG:900913 -overwrite texas_water

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln tyler2010 -nlt multipolygon -t_srs EPSG:900913 -overwrite tyler

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln smith2010 -nlt multipolygon -t_srs EPSG:900913 -overwrite smith

psql -q $DATABASE -c "DROP TABLE p12;"

CREATE_P12='
CREATE TABLE p12 (
    geoid VARCHAR(24) NOT NULL, 
	geoid2 VARCHAR(24) NOT NULL, 
	name VARCHAR(66) NOT NULL, 
	"D001" INTEGER NOT NULL, 
	"D002" INTEGER NOT NULL, 
	"D003" INTEGER NOT NULL, 
	"D004" INTEGER NOT NULL, 
	"D005" INTEGER NOT NULL, 
	"D006" INTEGER NOT NULL, 
	"D007" INTEGER NOT NULL, 
	"D008" INTEGER NOT NULL, 
	"D009" INTEGER NOT NULL, 
	"D010" INTEGER NOT NULL, 
	"D011" INTEGER NOT NULL, 
	"D012" INTEGER NOT NULL, 
	"D013" INTEGER NOT NULL, 
	"D014" INTEGER NOT NULL, 
	"D015" INTEGER NOT NULL, 
	"D016" INTEGER NOT NULL, 
	"D017" INTEGER NOT NULL,
	"D018" INTEGER NOT NULL,
	"D019" INTEGER NOT NULL,
	"D020" INTEGER NOT NULL,
	"D021" INTEGER NOT NULL,
	"D022" INTEGER NOT NULL,
	"D023" INTEGER NOT NULL,
	"D024" INTEGER NOT NULL,
	"D025" INTEGER NOT NULL,
	"D026" INTEGER NOT NULL,
	"D027" INTEGER NOT NULL,
	"D028" INTEGER NOT NULL,
	"D029" INTEGER NOT NULL,
	"D030" INTEGER NOT NULL,
	"D031" INTEGER NOT NULL,
	"D032" INTEGER NOT NULL,
	"D033" INTEGER NOT NULL,
	"D034" INTEGER NOT NULL,
	"D035" INTEGER NOT NULL,
	"D036" INTEGER NOT NULL,
	"D037" INTEGER NOT NULL,
	"D038" INTEGER NOT NULL,
	"D039" INTEGER NOT NULL,
	"D040" INTEGER NOT NULL,
	"D041" INTEGER NOT NULL,
	"D042" INTEGER NOT NULL,
	"D043" INTEGER NOT NULL,
	"D044" INTEGER NOT NULL,
	"D045" INTEGER NOT NULL,
	"D046" INTEGER NOT NULL,
	"D047" INTEGER NOT NULL,
	"D048" INTEGER NOT NULL,
	"D049" INTEGER NOT NULL
);
'
echo $CREATE_P12 | psql -h $HOST -q $DATABASE

psql -h $HOST -q $DATABASE -c "COPY p12 FROM '${HERE}/p12_county/clean.csv' WITH CSV HEADER;"

psql -h $HOST -q $DATABASE -c "DROP TABLE age;"

AGE='
CREATE TABLE age AS
SELECT
    geoid2 as geoid,
    "D003" + "D004" + "D005" + "D006" + "D027" + "D028" + "D029" + "D030" AS under18,
    ("D003" + "D004" + "D005" + "D006" + "D027" + "D028" + "D029" + "D030")::float / NULLIF("D001"::float, 0) AS under18pct,
    "D007" + "D008" + "D009" + "D010" + "D031" + "D032" + "D033" + "D034" AS under25,
    ("D007" + "D008" + "D009" + "D010" + "D031" + "D032" + "D033" + "D034")::float / NULLIF("D001"::float, 0) as under25pct,
    "D011" + "D012" + "D013" + "D035" + "D036" + "D037" AS under40,
    ("D011" + "D012" + "D013" + "D035" + "D036" + "D037")::float / NULLIF("D001"::float, 0) as under40pct,
    "D014" + "D015" + "D016" + "D017" + "D018" + "D019" + "D038" + "D039" + "D040" + "D041" + "D042" + "D043" AS under65,
    ("D014" + "D015" + "D016" + "D017" + "D018" + "D019" + "D038" + "D039" + "D040" + "D041" + "D042" + "D043")::float / NULLIF("D001"::float, 0) as under65pct,
    "D020" + "D021" + "D022" + "D023" + "D024" + "D025" + "D044" + "D045" + "D046" + "D047" + "D048" + "D049" AS gte65,
    ("D020" + "D021" + "D022" + "D023" + "D024" + "D025" + "D044" + "D045" + "D046" + "D047" + "D048" + "D049")::float / NULLIF("D001"::float, 0) as gte65pct
FROM p12;
'
echo $AGE | psql -h $HOST -q $DATABASE

psql -h $HOST -q $DATABASE -c "DROP TABLE age_shapes;"

CREATE_AGE_SHAPES="
CREATE TABLE age_shapes AS
SELECT
    age.*,
    blocks2010.wkb_geometry
FROM age, blocks2010
WHERE age.geoid = blocks2010.geoid10;
"
echo $CREATE_AGE_SHAPES | psql -h $HOST -q $DATABASE 

