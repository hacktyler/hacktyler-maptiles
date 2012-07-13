#!/bin/bash

HOST="localhost"
DATABASE="hacktyler-urban"
USER="onyxfish"

OGR_PG="host=$HOST dbname=$DATABASE user=$USER"
SRID="900913"

ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln sidewalks sidewalk -overwrite -nlt multilinestring -t_srs EPSG:$SRID
ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln bike_routes bike_routes -overwrite -nlt multilinestring -t_srs EPSG:$SRID
ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln structures structures -overwrite -nlt multilinestring -t_srs EPSG:$SRID
ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln centerline centerline -overwrite -nlt multilinestring -t_srs EPSG:$SRID
ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln parks parks -overwrite -nlt multipolygon -t_srs EPSG:$SRID
ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln tyler city_limits -overwrite -nlt multipolygon -t_srs EPSG:$SRID
ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln schools schools -overwrite -nlt multipolygon -t_srs EPSG:$SRID

ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln interact parks -overwrite -nlt geometry -t_srs EPSG:$SRID -sql "select NAME, 'park' as TYPE from Parks"
ogr2ogr -f "PostgreSQL" PG:"$OGR_PG" -nln interact schools -append -nlt geometry -t_srs EPSG:$SRID -sql "select FACILITY as NAME, 'school' as TYPE from Educational"

echo "CREATE TABLE centerline_merged AS SELECT ST_LineMerge(ST_Union(wkb_geometry)) as wkb_geometry, fullname FROM centerline GROUP BY fullname;" | psql -h $HOST -q hacktyler-urban -U onyxfish

echo "CREATE TABLE park_centroids AS SELECT ST_Centroid(ST_Union(wkb_geometry)) as wkb_geometry, name FROM parks GROUP BY name" | psql -h $HOST -q hacktyler-urban -U onyxfish

echo "CREATE TABLE school_centroids AS SELECT ST_Centroid(ST_Union(wkb_geometry)) as wkb_geometry, facility as name FROM schools GROUP BY facility" | psql -h $HOST -q hacktyler-urban -U onyxfish

