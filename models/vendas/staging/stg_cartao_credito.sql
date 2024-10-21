with 
    renomeado as (
        select
            cast(CREDITCARDID as int) as pk_id_cartao_credito
            ,cast(CARDTYPE as varchar) as cartao_tipo
            ,cast(CARDNUMBER as varchar) as cartao_numero
            ,cast(EXPMONTH as int) as cartao_mes_expiracao
            ,cast(EXPYEAR as int) as cartao_ano_expiracao
            --,cast(MODIFIEDDATE as date) as cartao_data_modificacao
        from  {{source('erp_adventure_works','CREDITCARD')}}
)

select * from renomeado