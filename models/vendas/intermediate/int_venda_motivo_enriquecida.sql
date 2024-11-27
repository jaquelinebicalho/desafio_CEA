with 
    vendas_detalhe as(
        select *
        from {{ref("stg_vendas_detalhe")}}
    ) 
    ,relacao_vendas_motivos as  (
        select *
        from {{ref("stg_relacao_vendas_motivos")}}
    )
    ,venda_motivo as (
        select *
        from {{ref("stg_venda_motivo")}}
    )
    
    ,venda_motivo_enriquecida as (
        select 
             {{ dbt_utils.generate_surrogate_key(
                ['vendas_detalhe.fk_id_vendas_cabecalho', 'vendas_detalhe.fk_id_produto']
            ) }} as sk_produto_pedido
            ,vendas_detalhe.fk_id_vendas_cabecalho  as  Nota_Fiscal
            ,coalesce(venda_motivo.venda_motivo_nome, 'Não Informado') as Motivo_Venda
            ,coalesce(venda_motivo.venda_motivo_tipo, 'Não Informado') as Motivo_Tipo
        from vendas_detalhe
        left join relacao_vendas_motivos on relacao_vendas_motivos.pk_id_ordem_de_venda = vendas_detalhe.fk_id_vendas_cabecalho
        left join venda_motivo on venda_motivo.pk_id_venda_motivo = relacao_vendas_motivos.fk_id_motivo_venda
    )
select * from venda_motivo_enriquecida    
