with totalVolume as (
    SELECT 
        totalSalesAllVendors.*, /* Need to choose only the fields needed */
        (totalSalesAllVendors.CONTAINER_QTY * totalSalesAllVendors.TOTAL_QUANTITY) as totalVolume  
    FROM {{ ref('totalSalesAllVendors') }} AS totalSalesAllVendors
),
totalVolumeAggregation AS (
    SELECT 
        FISCALYEAR,
        SUM(totalVolume) AS totalVolumecy, 
        LAG(sum(totalVolume), 2) OVER (ORDER BY FISCALYEAR ASC) AS totalVolume2py, 
        LAG(sum(totalVolume),1) OVER (ORDER BY FISCALYEAR ASC) AS totalVolumepy
    FROM totalVolume 
    GROUP BY FISCALYEAR
)
select * from totalVolumeAggregation
