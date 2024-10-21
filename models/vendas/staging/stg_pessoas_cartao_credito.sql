with 
    renomeado as (
        select 
            cast(BUSINESSENTITYID as int) as pk_id_pessoa_identidade_empresarial
            ,cast(CREDITCARDID as int) as fk_id_cartao_credito
           -- ,cast(MODIFIEDDATE as date) as cartao_data_modificacao
        from  {{source('erp_adventure_works','PERSONCREDITCARD')}}
)

select * from renomeado