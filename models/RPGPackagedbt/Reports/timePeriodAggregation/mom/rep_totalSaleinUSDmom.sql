WITH totalSaleinUSD AS (
    SELECT 
        totalSalesAllVendors.*, 
        (totalSalesAllVendors.CONTAINER_QTY * totalSalesAllVendors.TOTAL_QUANTITY * totalSalesAllVendors.UNIT_PRICE) as totalSaleinUSD 
    FROM {{ ref('totalSalesAllVendors') }} AS totalSalesAllVendors
),
totalSaleinUSDmom AS (
    SELECT 
        CAST(CONCAT(CALANDERYEAR, LPAD(CALANDERMONTH, 2, '0')) AS INTEGER) AS yearmonthdisplay, 
        CALANDERYEAR AS CALANDERYEAR, 
        SUM(totalSaleinUSD) AS totalsalescm, 
        LAG(SUM(totalSaleinUSD),2) OVER (PARTITION BY CALANDERMONTH ORDER BY CALANDERYEAR ASC) AS totalsales2mp, 
        LAG(SUM(totalSaleinUSD),1) OVER (PARTITION BY CALANDERMONTH ORDER BY CALANDERYEAR ASC) AS totalsalesmp 
    FROM totalSaleinUSD 
    GROUP BY CALANDERYEAR, CALANDERMONTH ORDER BY CALANDERYEAR, CALANDERMONTH
)
select * from totalSaleinUSDmom