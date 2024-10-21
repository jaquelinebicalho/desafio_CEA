with 
    rename as (
        select
            cast(COUNTRYREGIONCODE as varchar ) as pais_codigo_regiao
            ,cast(NAME as varchar ) as pais_nome
           -- ,cast(MODIFIEDDATE as varchar ) as pais_data_modificacao
        from  {{source('erp_adventure_works','COUNTRYREGION')}}
)

select * 
from rename