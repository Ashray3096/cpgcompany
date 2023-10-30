with salesmetrics as (
    SELECT fiscalyear,
       totalsalescy,
       (coalesce(totalsalescy, 0) - coalesce(totalsalespy, 0)) AS saleusddiff,
       round((((totalsalescy - totalsalespy) / totalsalespy) * 100), 2) AS salesdiffpercent
FROM {{ ref('rep_totalSaleinUSDfyoy') }}
)
select * from salesmetrics
