with 
    rename as (
        select
            cast(SALESORDERID as int ) as pk_id_ordem_de_venda
            ,cast(SALESREASONID as int ) as fk_id_motivo_venda
            --,cast(MODIFIEDDATE as date ) as motivo_venda_data_modificacao
        from  {{source('erp_adventure_works','SALESORDERHEADERSALESREASON')}}
)

select * 
from rename