with 
    pessoas as (
        select * 
        from  {{source('erp_adventure_works','PERSON')}}

    )

    ,renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_id_pessoa_identidade_empresarial
            ,cast(PERSONTYPE as varchar) as pessoa_tipo
            ,case
                when PERSONTYPE = 'SC' then 'Contato da Loja'
                when PERSONTYPE = 'IN' then 'Cliente Varejo'
                when PERSONTYPE = 'SP' then 'Vendedor'
                when PERSONTYPE = 'EM' then 'Funcionário (exceto vendedor)'
                when PERSONTYPE = 'VC' then 'Contato de Fornecedor'
                when PERSONTYPE = 'GC' then 'Contato Geral'
                else 'Verificar'
            end as pessoa_tipo_nome        
            ,cast(FIRSTNAME ||' '||LASTNAME as varchar) as pessoa_nome
            ,cast(EMAILPROMOTION as int) as email_promocional
            --,cast(MODIFIEDDATE as date) as person_data_att
            --,cast(NAMESTYLE as varchar) as NAMESTYLE
            --,cast(ADDITIONALCONTACTINFO as varchar) as ADDITIONALCONTACTINFO
            --,cast(TITLE as varchar) as TITLE
            --,cast(SUFFIX as varchar) as SUFFIX
            --,cast(DEMOGRAPHICS as varchar) as DEMOGRAPHICS
            --,cast(ROWGUID as varchar) as ROWGUID
        from pessoas 
    )

select * 
from renomeado    
