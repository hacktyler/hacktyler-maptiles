#!/bin/bash

ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln sidewalks sidewalk -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln bike_routes bike_routes -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln structures structures -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln tiger_lines tl_2010_48423_edges -overwrite -nlt multilinestring -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln parks parks -overwrite -nlt multipolygon -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln tyler city_limits -overwrite -nlt multipolygon -t_srs EPSG:900913
ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=hacktyler-urban user=onyxfish" -nln bus_stops bus-stops -overwrite -nlt point -t_srs EPSG:900913
