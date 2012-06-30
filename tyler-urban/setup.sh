#!/bin/bash

ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln sidewalks sidewalk -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln bike_routes bike_routes -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln structures structures -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln centerline centerline -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln parks parks -overwrite -nlt multipolygon -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln tyler city_limits -overwrite -nlt multipolygon -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln schools schools -overwrite -nlt multipolygon -t_srs EPSG:900913

ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln interact parks -overwrite -nlt geometry -t_srs EPSG:900913 -sql "select NAME, 'park' as TYPE from Parks"
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln interact schools -append -nlt geometry -t_srs EPSG:900913 -sql "select FACILITY as NAME, 'school' as TYPE from Educational"

echo "CREATE TABLE centerline_merged AS SELECT LineMerge(ST_Union(wkb_geometry)) as wkb_geometry, fullname FROM centerline GROUP BY fullname;" | psql -h localhost -q hacktyler-urban -U onyxfish

echo "CREATE TABLE park_centroids AS SELECT Centroid(ST_Union(wkb_geometry)) as wkb_geometry, name FROM parks GROUP BY name" | psql -h localhost -q hacktyler-urban -U onyxfish

echo "CREATE TABLE park_centroids AS SELECT Centroid(ST_Union(wkb_geometry)) as wkb_geometry, name FROM parks GROUP BY name" | psql -h localhost -q hacktyler-urban -U onyxfish

