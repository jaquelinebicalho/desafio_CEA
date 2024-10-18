with 
    lojas as (
        select * 
        from  {{source('erp_adventure_works','STORE')}}
    )

    ,renomeado as (
        select
            cast(BUSINESSENTITYID as varchar) as pk_id_loja
            ,cast(NAME as varchar) as loja_name
        from lojas
    )


select * 
from renomeado