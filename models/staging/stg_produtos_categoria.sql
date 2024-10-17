with 
    categoria as (
        select * 
        from  {{source('erp_adventure_works','PRODUCTCATEGORY')}}
    )
    ,rename as (
        select
            cast(PRODUCTCATEGORYID as int) as pk_id_produto_categoria
            ,cast(NAME as varchar) as categoria_nome
            ,cast(MODIFIEDDATE as date) as categoria_data_modificacao
        from categoria
    )

select * from rename