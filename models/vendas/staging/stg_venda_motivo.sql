with 
    venda_motivo as (
        select *
        from  {{ source('erp_adventure_works','SALESREASON') }}
    )

    ,renomeado as (
        select
            cast(SALESREASONID as int) as pk_id_venda_motivo
            ,cast(NAME as string) as venda_motivo_nome
            ,cast(REASONTYPE as string) as venda_motivo_tipo
            ,cast(MODIFIEDDATE as date) as venda_motivo_data_modificacao
        from venda_motivo
)

select * 
from renomeado