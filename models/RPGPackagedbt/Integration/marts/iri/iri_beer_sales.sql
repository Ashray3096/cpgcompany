select 
_AIRBYTE_RAW_ID,
_AIRBYTE_EXTRACTED_AT,
_AIRBYTE_META,
AAB,
SIZE as CONTAINER_SIZE,
TIME as WEEK_NAME ,
BRAND,
STATE,
STYLE,
FLAVOR,
try_cast(REPLACE(REPLACE("$ SALES",'$',''),',','') as integer) as SALES,
"CBI FLG" as cbi_flg,
PACKAGE,
SEGMENT,
CATEGORY,
SUPPLIER,
GEOGRAPHY,
try_cast("TIME WEEK" as integer) as time_week,
try_cast(REPLACE(REPLACE("$ SALES YA",'$',''),',','') as integer) as SALES_YA,
"BEV SEGMENT" as bev_segment,
SUBCATEGORY,
"BRAND FAMILY" as brand_family,
"UPC 13 DIGIT" as upc_13_digit,
"$ SALES % CHG" as sales_per_chg,
"PRICE SEGMENT" as price_segement,
"RMA_CROM FLAG" as RMA_CROM_FLG,
"IRI ASPIRA TIER" as iri_aspira_tier,
"DOM VS IMP VALUE" as dom_vs_imp_value,
"ITEM DESCRIPTION" as item_description,
try_cast(REPLACE("AVG PRICE PER CASE",'$','') as DOUBLE) as avg_price_per_case,
"PRODUCT DESCRIPTION" as product_desc,
_AB_SOURCE_FILE_URL,
"IRI PORTFOLIO SEGMENT" as iri_portfolio_segment,
"GEOGRAPHY CLASSIFICATION" as geo_classification,
"IRI BRAND PRIORITY GROUP" as iri_brang_grp,
"IRI FY NATIONAL FOCUS BRAND" as iri_fy_national_focus,
_AB_SOURCE_FILE_LAST_MODIFIED
    from 
{{ source('iri_raw_sources', 'IRI_SALES_DAILY_BEER') }}