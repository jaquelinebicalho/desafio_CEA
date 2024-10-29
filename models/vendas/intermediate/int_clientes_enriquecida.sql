with 
    clientes as(
        select * 
        from {{ref("stg_clientes")}}
    )

    ,pessoas as (
        select*
        from {{ref("stg_pessoas")}} 
    )
    ,lojas as (
        select *
        from {{ref("stg_lojas")}}
    )

    ,clientes_enriquecida as (
        select
            clientes.pk_id_cliente
            ,pessoas.pk_id_pessoa_identidade_empresarial
            ,pessoas.pessoa_tipo
            ,pessoas.pessoa_tipo_desc
            ,pessoas.pessoa_nome
            ,pessoas.email_promocional
        from clientes
        left join pessoas on clientes.fk_id_pessoa = pessoas.pk_id_pessoa_identidade_empresarial
        left join lojas on lojas.pk_id_loja = clientes.fk_id_loja
   )

select * from clientes_enriquecida
