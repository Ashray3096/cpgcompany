WITH totalSaleinUSD AS (
    SELECT 
        totalSalesAllVendors.*, 
        (totalSalesAllVendors.CONTAINER_QTY * totalSalesAllVendors.TOTAL_QUANTITY * totalSalesAllVendors.UNIT_PRICE) as totalSaleinUSD 
    FROM {{ ref('totalSalesAllVendors') }} AS totalSalesAllVendors
),
totalSaleinUSDfmom AS (
    SELECT 
        CAST(CONCAT(FISCALYEAR, LPAD(CALANDERMONTH, 2, '0')) AS INTEGER) AS yearmonthdisplay, 
        FISCALYEAR AS FISCALYEAR, 
        SUM(totalSaleinUSD) AS totalsalescm, 
        LAG(SUM(totalSaleinUSD),2) OVER (PARTITION BY CALANDERMONTH ORDER BY FISCALYEAR ASC) AS totalsales2mp, 
        LAG(SUM(totalSaleinUSD),1) OVER (PARTITION BY CALANDERMONTH ORDER BY FISCALYEAR ASC) AS totalsalesmp 
    FROM totalSaleinUSD 
    GROUP BY FISCALYEAR, CALANDERMONTH ORDER BY FISCALYEAR, CALANDERMONTH
)
select * from totalSaleinUSDfmom