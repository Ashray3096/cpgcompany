select 
    brand_family, 
    SALES 
    FROM {{ ref('iri_spirits_sales') }}
Union
select 
    brand_family, 
    SALES 
    FROM {{ ref('iri_beer_sales') }}
Union
select 
    brand_family, 
    SALES 
    FROM {{ ref('iri_wine_sales') }}