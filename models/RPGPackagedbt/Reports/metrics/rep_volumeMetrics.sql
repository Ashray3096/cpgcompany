with salesmetrics as (
    SELECT fiscalyear,
       totalVolumecy,
       (coalesce(totalVolumecy, 0) - coalesce(totalVolumepy, 0)) AS volumediff,
       round((((totalVolumecy - totalVolumepy) / totalVolumecy) * 100), 2) AS volumediffpercent
FROM {{ ref('rep_totalVolumefyoy') }}
)
select * from salesmetrics
