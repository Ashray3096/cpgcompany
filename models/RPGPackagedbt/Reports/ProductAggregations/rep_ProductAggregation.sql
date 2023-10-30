WITH totalSaleinUSD AS (
    SELECT 
        totalSalesAllVendors.*, 
        (totalSalesAllVendors.CONTAINER_QTY * totalSalesAllVendors.TOTAL_QUANTITY * totalSalesAllVendors.UNIT_PRICE) as totalSaleinUSD 
    FROM {{ ref('totalSalesAllVendors') }} AS totalSalesAllVendors
), productAggregation as (
    select
        CALANDERYEAR as "year",
        CALANDERMONTH as "month",
        TOP_LEVEL_CATEGORY,
        TOP_SUBCATEGORY,
        SUBCATEGORY,
        DELIVERY_STATE,
        CONTAINER_QTY,
        CONTAINER_TYPE,
        LIQUOR_VOLUME,
        VOLUME_UNITS,
        UNIT_PRICE,
        totalSaleinUSD,
        CONCAT(LIQUOR_VOLUME,VOLUME_UNITS,CONTAINER_TYPE) as volumeType
        FROM totalSaleinUSD
)
select * from productAggregation