WITH drizzly_sales AS (
    SELECT 
        CASE WHEN (MONTH(DELIVERED_DATE) >= 10) 
            THEN (YEAR(DELIVERED_DATE)+1) 
            ELSE YEAR(DELIVERED_DATE) 
        END AS FISCALYEAR,
        YEAR(DELIVERED_DATE) AS CALANDERYEAR,
        MONTH(DELIVERED_DATE) AS CALANDERMONTH,
        DELIVERED_DATE,
        ORDER_ID,
        BRAND_NAME,
        CATALOG_ITEM_NAME,
        RAW_ITEM_NAME,
        TOP_LEVEL_CATEGORY,
        TOP_SUBCATEGORY,
        SUBCATEGORY,
        CATALOG_ITEM_ID,
        DELIVERY_STATE,
        DELIVERY_ZIPCODE,
        STORE_MARKET,
        CONTAINER_QTY,
        CONTAINER_TYPE,
        LIQUOR_VOLUME,
        VOLUME_UNITS,
        UNIT_PRICE,
        VERIFIED_UPC,
        FULFILLMENT_TYPE,
        NEW_VS_RETURNING,
        DEVICE,
        TOTAL_QUANTITY,
        TOTAL_GMV
    FROM {{ ref('Drizzly_sales') }}
), 
final_sales as (
    select * from drizzly_sales
    -- Unions or joins for future data sources
)
select * from final_sales where (FISCALYEAR is not null)