with 
    vendas_cabecalho as(
        select *
        from {{ref("stg_vendas_cabecalho")}}
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
            vendas_cabecalho.pk_id_ordem_de_venda  as  Nota_Fiscal
            ,coalesce(venda_motivo.venda_motivo_nome, 'Não Informado') as Motivo_Venda
            ,coalesce(venda_motivo.venda_motivo_tipo, 'Não Informado') as Motivo_Tipo
        from vendas_cabecalho 
        left join relacao_vendas_motivos on relacao_vendas_motivos.pk_id_ordem_de_venda = vendas_cabecalho.pk_id_ordem_de_venda
        left join venda_motivo on venda_motivo.pk_id_venda_motivo = relacao_vendas_motivos.fk_id_motivo_venda
    )
select * from venda_motivo_enriquecida    
