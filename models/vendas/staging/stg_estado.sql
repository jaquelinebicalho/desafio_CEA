with 
    rename as (
        select
            cast(STATEPROVINCEID as int) as pk_id_estado
            ,cast(TERRITORYID as int) as fk_id_territorio
            ,cast(STATEPROVINCECODE as varchar) as estado_cod_provincia
            ,cast(COUNTRYREGIONCODE as varchar) as pais_codigo_regiao
            ,cast(ISONLYSTATEPROVINCEFLAG as varchar) as provincia_estado_flag
            ,cast(NAME as varchar) as estado_nome
            --,cast(MODIFIEDDATE as varchar) as estado_data_modificacao
        from  {{source('erp_adventure_works','STATEPROVINCE')}}
)

select * 
from rename