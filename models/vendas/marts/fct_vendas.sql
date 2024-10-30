
with
    int_vendas as (
        select *
        from {{ ref('int_vendas_enriquecida') }}
    )

    , dim_produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , dim_vendedores as (
        select *
        from {{ ref('dim_vendedores') }}
    )

    , dim_clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , dim_cartao_credito as (
        select *
        from {{ ref('dim_cartao_credito') }}
    )

     , dim_venda_motivo as (
        select *
        from {{ ref('dim_venda_motivo') }}
    )

     , dim_regiao as (
        select *
        from {{ ref('dim_regiao') }}
    )

select *
from int_vendas
