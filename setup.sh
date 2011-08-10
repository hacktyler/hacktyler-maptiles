HERE=`pwd`
DATABASE=tylercensus

ogr2ogr -f "PostgreSQL" PG:dbname=$DATABASE -nln blocks2010 -nlt multipolygon -t_srs EPSG:900913 -overwrite tl_2010_48423_tabblock10

psql -q $DATABASE -c "DROP TABLE p5;"

CREATE_P5='
CREATE TABLE p5 (
    geoid VARCHAR(16) NOT NULL, 
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
	"D017" INTEGER NOT NULL
);
'
echo $CREATE_P5 | psql $DATABASE

psql -q $DATABASE -c "COPY p5 FROM '${HERE}/p5/clean.csv' WITH CSV HEADER;"

psql -q $DATABASE -c "DROP TABLE race;"

RACE='
CREATE TABLE race AS
SELECT
    geoid,
    "D003"::float / NULLIF("D001"::float, 0) AS nhwhitepct,
    "D004"::float / NULLIF("D001"::float, 0) AS nhblackpct,
    "D006"::float / NULLIF("D001"::float, 0) AS nhasianpct,
    "D010"::float / NULLIF("D001"::float, 0) AS hisppct
FROM p5;
'
echo $RACE | psql $DATABASE

psql -q $DATABASE -c "DROP TABLE race_shapes;"

CREATE_RACE_SHAPES="
CREATE TABLE race_shapes AS
SELECT
    race.*,
    blocks2010.wkb_geometry
FROM race, blocks2010
WHERE race.geoid = blocks2010.geoid10;
"
echo $CREATE_RACE_SHAPES | psql $DATABASE 

