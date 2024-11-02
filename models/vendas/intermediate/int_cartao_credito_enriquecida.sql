with 
    cartao_credito as  (
        select *
        from {{ref("stg_cartao_credito")}}
    )
    ,pessoas_cartao_credito as (
        select *
        from {{ref("stg_pessoas_cartao_credito")}}
    )

    ,cartao_credito_enriquecida as (
        select
            cartao_credito.pk_id_cartao_credito as ID_Cartao_de_Credito
            ,pessoas_cartao_credito.pk_id_pessoa_identidade_empresarial as ID_Identidade_Pessoal
            ,cartao_credito.cartao_tipo as "Tipo Cartão"
            ,cartao_credito.cartao_numero as "Núm Cartão"
            ,cartao_credito.cartao_mes_expiracao as "Mês Expiração"
            ,cartao_credito.cartao_ano_expiracao as "Ano Expiração"
            from cartao_credito
            left join pessoas_cartao_credito on pk_id_cartao_credito = fk_id_cartao_credito
    )

    select *
    from cartao_credito_enriquecida