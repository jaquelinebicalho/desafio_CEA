with 
    clientes as (
        select * 
        from  {{source('erp_adventure_works','CUSTOMER')}}
    )
    ,renomeado as (
        select
            cast(CUSTOMERID as int) as pk_id_cliente
            ,cast(PERSONID as int) as fk_id_pessoa
            ,cast(STOREID as int) as fk_id_loja
            ,cast(TERRITORYID as int) as fk_id_territorio
            --,cast(ROWGUID as varchar) as ROWGUID
            ,cast(MODIFIEDDATE as date) as cliente_data_modificacao
        from clientes
)

select * 
from renomeado