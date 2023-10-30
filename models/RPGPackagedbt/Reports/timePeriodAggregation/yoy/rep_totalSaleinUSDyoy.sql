WITH totalSaleinUSD AS (
    SELECT 
        totalSalesAllVendors.*, 
        (totalSalesAllVendors.CONTAINER_QTY * totalSalesAllVendors.TOTAL_QUANTITY * totalSalesAllVendors.UNIT_PRICE) as totalSaleinUSD 
    FROM {{ ref('totalSalesAllVendors') }} AS totalSalesAllVendors
),
totalSaleinUSDfyoy AS (
    SELECT 
        CALANDERYEAR AS CALANDERYEAR, 
        SUM(totalSaleinUSD) AS totalsalescy, 
        LAG(SUM(totalSaleinUSD),2) OVER (ORDER BY CALANDERYEAR ASC) AS totalsales2yp, 
        LAG(SUM(totalSaleinUSD),1) OVER (ORDER BY CALANDERYEAR ASC) AS totalsalespy 
    FROM totalSaleinUSD 
    GROUP BY CALANDERYEAR
)
select * from totalSaleinUSDfyoy
