{%- test checkemptymodel(model) -%}
with rowCount as 
(
    select 
        count(*) as rowCount
    from  
        {{ model }}    
)
select * from rowCount where rowCount = 0    
{%- endtest -%}