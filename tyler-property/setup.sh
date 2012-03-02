#!/bin/bash

HERE=`pwd`
DATABASE=tylerproperty
HOST=localhost

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln parcels -nlt multipolygon -t_srs EPSG:900913 -overwrite -skipfailures parcels

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln zoning -nlt multipolygon -t_srs EPSG:900913 -overwrite -skipfailures zoning 

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln tiger_lines tl_2010_48423_edges -overwrite -nlt multilinestring -t_srs EPSG:900913

ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DATABASE" -nln taxnet -overwrite TaxNetUSA_Smith_2011.csv

CREATE_PARCEL_CENTROIDS="
CREATE TABLE parcel_centroids AS
SELECT *, centroid(wkb_geometry) as centroid
FROM parcels;
"
echo $CREATE_PARCEL_CENTROIDS | psql -h $HOST -q $DATABASE

CREATE_ZONED_PARCELS="
CREATE TABLE zoned_parcels AS
SELECT parcel_centroids.*, zoning.zone from parcel_centroids
RIGHT JOIN zoning ON 
contains(zoning.wkb_geometry, parcel_centroids.centroid);
"
echo $CREATE_ZONED_PARCELS | psql -h $HOST -q $DATABASE

CREATE_TAXNET_SIMPLE="
CREATE TABLE taxnet_simple AS
SELECT
    geo_id,
    situs_address,
    owner_name,
    owner_addr_1,
    owner_addr_2,
    owner_addr_3,
    owner_city,
    owner_state,
    owner_zip,
    owner_zip_4,
    legal_desc,
    acreage,
    land_area,
    land_value::integer,
    improvement_value::integer,
    market_value::integer,
    assessed_value::integer,
    ag_use_value::integer,
    confidential_owner,
    non_res_owner,
    imprv_sptb,
    land_sptb,
    pers_sptb,
    prod_sptb,
    mnrl_sptb,
    deed_month,
    deed_year,
    year_built::integer
FROM taxnet;
"
echo $CREATE_TAXNET_SIMPLE | psql -h $HOST -q $DATABASE 

CREATE_TAXNET_PARCELS="
CREATE TABLE taxnet_parcels AS
SELECT
    taxnet_simple.*,
    zoned_parcels.wkb_geometry,
    zoned_parcels.zone
FROM taxnet_simple, zoned_parcels
WHERE taxnet_simple.geo_id = zoned_parcels.account;
"
echo $CREATE_TAXNET_PARCELS | psql -h $HOST -q $DATABASE

BIZ_FILTER_CLAUSE="
zone LIKE 'R%' AND
NOT (
    -- Businesses
    owner_name LIKE '% INC' OR
    owner_name LIKE '% LP' OR
    owner_name LIKE '% DBA %' OR
    owner_name LIKE '% LLC' OR
    owner_name LIKE '% LLP' OR
    owner_name LIKE '% LLLP' OR
    owner_name LIKE '% DVM' OR
    owner_name LIKE '% CO' OR
    owner_name LIKE '% CORP' OR
    owner_name LIKE '% CORPORATION' OR
    owner_name LIKE '% COMPANY' OR
    owner_name LIKE '% PARTNERSHIP' OR
    owner_name LIKE '% PARTNER' OR
    owner_name LIKE '% PARTNERS' OR
    owner_name LIKE '% LTD' OR
    owner_name LIKE '% TECH' OR

    -- Real Estate
    owner_name LIKE '% PROPERTIES' OR
    owner_name LIKE '% APARTMENTS%' OR
    owner_name LIKE '% APTS' OR
    owner_name LIKE '% DEVELOPMENT' OR

    -- Organizations
    owner_name LIKE '% CLUB' OR
    owner_name LIKE '% FOUNDATION' OR
    owner_name LIKE '% ASSOCIATION' OR
    owner_name LIKE '% ASSN' OR
    owner_name LIKE '% COUNCIL' OR
    owner_name LIKE '% GROUP' OR
    owner_name LIKE '% CONFERENCE' OR

    -- Government
    owner_name LIKE '% DISTRICT' OR
    owner_name LIKE '% TEXAS' OR
    owner_name LIKE 'GOODMAN MUSEUM & PARK' OR
    owner_name = 'TYLER JUNIOR COLLEGE' OR
    owner_name = 'SMITH COUNTY' OR
    owner_name = 'UNITED STATES OF AMERICA' OR
    owner_name = 'CITY OF TYLER' OR
    owner_name = 'TYLER CITY OF' OR
    owner_name = 'TEXAS STATE OF' OR
    owner_name = 'PUBLIC SAFETY DEPT OF' OR

    -- Education
    owner_name LIKE '% ISD' OR
    owner_name LIKE '% I S D' OR
    owner_name LIKE 'UNIVERSITY%' OR
    owner_name LIKE '% COLLEGE' OR
    owner_name LIKE '% SCHOOL' OR
    owner_name LIKE '% SCH' OR --school
    owner_name LIKE 'BOARD OF REGENTS %' OR --school

    -- Medical
    owner_name LIKE '% HOSPITAL' OR
    owner_name LIKE '% REGIONAL' OR
    owner_name LIKE '% HEALTHCARE' OR
    owner_name LIKE '% CENTER' OR

    -- Religion
    owner_name LIKE '% CHURCH' OR
    owner_name LIKE '% CHUR' OR
    owner_name LIKE '% CHU' OR
    owner_name LIKE '% CH' OR
    owner_name LIKE '% CHRCH' OR
    owner_name LIKE '% GOD' OR
    owner_name LIKE '% CHRIST' OR
    owner_name LIKE '% FELLOWSHIP' OR
    owner_name LIKE '% UNITED' OR
    owner_name LIKE '% TABERNACLE' OR
    owner_name LIKE '% REFORMED' OR
    owner_name LIKE '% PENTECOSTAL %' OR
    owner_name LIKE '% ASAMBLEA %' OR
    owner_name LIKE '%BAPTIST' OR
	owner_name LIKE '%METHODIST%' OR
	owner_name LIKE '%LUTHERAN%' OR
	owner_name LIKE '%CATHOLIC%' OR
	owner_name LIKE '%EPISCOPAL%' OR
	owner_name LIKE '%NAZARENE%' OR
	owner_name LIKE '%PRESBYTERIAN%' OR
    owner_name LIKE 'CONGREGATION %' OR

    -- Miscellaneous
    owner_name LIKE '% CEMETERY' OR
    owner_name LIKE '% WHSE' OR --warehouse
    owner_name LIKE '% ETAL' OR --et al
    owner_name LIKE '% TRUST' OR
    owner_name LIKE '% TRUSTEE' OR
    owner_name LIKE '% TRUSTEE %' OR
    owner_name LIKE '% TRU' OR --trust
    owner_name LIKE '% ESTATE' OR
    owner_name LIKE '% ESTATES %' OR
    owner_name LIKE '% EST' OR --estate
    owner_name LIKE '% OF TYLER' OR
    owner_name LIKE 'CUMBERLAND ACADEMY %' OR
    owner_name LIKE 'Y M C A')
"

CREATE_NON_BIZ_ONLY="
CREATE TABLE non_biz_only AS
SELECT * FROM taxnet_parcels
WHERE ${BIZ_FILTER_CLAUSE};
"
echo $CREATE_BIZ_ONLY | psql -h $HOST -q $DATABASE 

CREATE_BIZ_ONLY="
CREATE TABLE biz_only AS
SELECT * FROM taxnet_parcels
WHERE NOT (${BIZ_FILTER_CLAUSE});"
echo $CREATE_NON_BIZ_ONLY | psql -h $HOST -q $DATABASE

CREATE_CHURCH_ONLY="
CREATE TABLE church_only AS
SELECT owner_name FROM taxnet_parcels
WHERE (
    owner_name LIKE '% CHURCH' OR
    owner_name LIKE '% CHUR' OR
    owner_name LIKE '% CHU' OR
    owner_name LIKE '% CH' OR
    owner_name LIKE '% CHRCH' OR
    owner_name LIKE '% GOD' OR
    owner_name LIKE '% CHRIST' OR
    owner_name LIKE '% FELLOWSHIP' OR
    owner_name LIKE '% UNITED' OR
    owner_name LIKE '% TABERNACLE' OR
    owner_name LIKE '% REFORMED' OR
    owner_name LIKE '% PENTECOSTAL %' OR
    owner_name LIKE '% ASAMBLEA %' OR
    owner_name LIKE '%BAPTIST' OR
	owner_name LIKE '%METHODIST%' OR
	owner_name LIKE '%LUTHERAN%' OR
	owner_name LIKE '%CATHOLIC%' OR
	owner_name LIKE '%EPISCOPAL%' OR
	owner_name LIKE '%NAZARENE%' OR
	owner_name LIKE '%PRESBYTERIAN%' OR
    owner_name LIKE 'CONGREGATION %'
);
"
echo $CREATE_CHURCH_ONLY | psql -h $HOST -q $DATABASE

