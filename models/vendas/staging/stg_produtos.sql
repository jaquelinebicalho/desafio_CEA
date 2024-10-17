with 
    produto as (
        select * 
        from  {{source('erp_adventure_works','PRODUCT')}}

    )

    , renomeado as (
        select
            cast(PRODUCTID as int) as pk_id_produto
            ,cast(PRODUCTSUBCATEGORYID as int) as fk_id_produto_subcategoria
            ,cast(PRODUCTMODELID  as int) as fk_id_produto_modelo
            ,cast(SELLSTARTDATE as date) as produto_data_inicio_vendas
            ,cast(SELLENDDATE  as date) as produto_data_fim_vendas
            ,cast(STANDARDCOST as number(18,2)) as produto_custo_padrao
            ,cast(LISTPRICE  as number(18,2)) as produto_preco_listado 
            ,cast(MODIFIEDDATE as date) as produto_data_modificacao
            ,cast(NAME as string) as produto_nome
            ,cast(PRODUCTNUMBER as varchar) as produto_numero_serie
            ,cast(MAKEFLAG as boolean) as produto_make_flag
            ,cast(FINISHEDGOODSFLAG as boolean) as produto_make_flag_finalizado
            ,cast(COLOR as strig) as produto_cor
            ,cast(SAFETYSTOCKLEVEL as int) as produto_nivel_estoque_seguranca
            ,cast(REORDERPOINT as int) as produto_ordem_recompra       
            ,cast(SIZEUNITMEASURECODE as string) as produto_cod_medida_tamanho
            ,cast(WEIGHTUNITMEASURECODE as string) as produto_cod_medida_peso
            ,cast(WEIGHT as number(18,2)) as produto_peso
            ,cast(SIZE as varchar) as produto_tamanho
            ,cast(DAYSTOMANUFACTURE as int) as produto_dias_producao
            ,cast(PRODUCTLINE as varchar) as produto_linha
            ,cast(CLASS as varchar) as produto_classe
            ,cast(STYLE as varchar) as produto_estilo
            --,cast(DISCONTINUEDDATE
            --,cast(ROWGUID
        from produto
    )

select * 
from renomeado