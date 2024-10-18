with 
    rename as (
        select
            cast(SHIPMETHODID as int) as pk_id_metodo_envio
            ,cast(NAME as varchar) as nome_transportadora
            ,cast(SHIPBASE as float) as metodo_envio_taxa_minima
            ,cast(SHIPRATE as float) as metodo_envio_taxa_cobrada_kg
            --,cast(ROWGUID as varchar) as metodo_envio_GUID
            --,cast(MODIFIEDDATE as date) as metodo_envio_data_modificacao
        from  {{source('erp_adventure_works','SHIPMETHOD')}}
    )

select * from rename