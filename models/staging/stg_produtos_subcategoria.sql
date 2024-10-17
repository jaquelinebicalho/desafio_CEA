with 
    subcategoria as (
        select * 
        from  {{source('erp_adventure_works','PRODUCTSUBCATEGORY')}}

    )
    ,rename as(
        select 
             cast(PRODUCTSUBCATEGORYID as int) as pk_id_produto_subcategoria
            ,cast(PRODUCTCATEGORYID as int) as fk_id_produto_categoria
            ,cast(NAME as varchar) as subcategoria_nome
            ,cast(MODIFIEDDATE as date) as subcategoria_data_modificacao
        from subcategoria
)

select * from rename