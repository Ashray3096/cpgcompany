select * from (select
    brand,
    brand_family,
    bev_segment,
    category,
    SUBCATEGORY,
    state,
    geography,
    geo_classification,
    dom_vs_imp_value,
    PACKAGE,
    SEGMENT,
    SUPPLIER,
    flavor,
    item_description,
    week_name,
    sales,
    sales_ya,
    NULL as avg_750ml_price,
    price_segement,
    cbi_flg,
    _AB_SOURCE_FILE_LAST_MODIFIED
    from 
    {{ ref('iri_beer_sales') }})
Union
select * from (select 
    brand,
    brand_family,
    bev_segment,
    category,
    NULL as SUBCATEGORY,
    NULL as state,
    geography,
    geo_classification,
    dom_vs_imp_value,
    NULL as PACKAGE,
    NULL as SEGMENT,
    NULL as SUPPLIER,
    flavor,
    item_description,
    NULL as week_name,
    sales,
    sales_ya,
    NULL as avg_750ml_price,
    NULL as price_segement,
    cbi_flg,
    _AB_SOURCE_FILE_LAST_MODIFIED
    from 
    {{ ref('iri_wine_sales') }})
Union
select * from (select 
    brand,
    brand_family,
    bev_segment,
    category,
    SUBCATEGORY,
    state,
    geography,
    geo_classification,
    dom_vs_imp_value,
    PACKAGE,
    SEGMENT,
    SUPPLIER,
    flavor,
    item_description,
    week_name,
    sales,
    sales_ya,
    avg_750ml_price,
    price_segement,
    cbi_flg,
    _AB_SOURCE_FILE_LAST_MODIFIED
    from 
    {{ ref('iri_spirits_sales') }})