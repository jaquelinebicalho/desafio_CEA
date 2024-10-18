with 
    vendedores as (
        select *
        from  {{ source('erp_adventure_works','SALESPERSON') }}
    )

    ,renomeado as (
        select 
            cast (BUSINESSENTITYID as int) as pk_id_vendedor_entidade_comercial
            ,cast (TERRITORYID as int) as fk_id_territorio
            ,cast (SALESQUOTA as float) as vendedor_meta
            ,cast (BONUS as float) as vendedor_bonus
            ,cast (COMMISSIONPCT as float) as vendedor_comissao
            ,cast (SALESYTD as float) as vendedor_vendas_acumuladas
            ,cast (SALESLASTYEAR as float) as vendedor_vendas_ano_anterior
            --,cast (ROWGUID as varchar) as vendedor_row_GUID
            --,cast (MODIFIEDDATE as date) as vendedor_data_modificacao
        from vendedores
    )

select * 
from renomeado