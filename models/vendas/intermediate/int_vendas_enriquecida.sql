with 
    vendas_detalhe as (
        select *
        from {{ref("stg_vendas_detalhe")}}
    )

    ,vendas_cabecalho as (
        select *
        from {{ref("stg_vendas_cabecalho")}}
    )

    ,produtos as (
        select *
        from {{ref("stg_produtos")}}
    )


    ,regra_negocio as (
        select 
            vendas_cabecalho.pk_id_ordem_de_venda
            ,vendas_cabecalho.fk_id_cliente
            ,vendas_cabecalho.fk_id_vendedor
            ,vendas_cabecalho.fk_id_territorio
            ,vendas_cabecalho.fk_id_endereco_fatura 
            ,vendas_cabecalho.fk_id_endereco_entrega
            ,vendas_cabecalho.fk_id_metodo_entrega
            ,vendas_cabecalho.fk_id_cartao_credito
            ,vendas_cabecalho.fk_id_taxa_moeda
            ,vendas_detalhe.fk_id_produto
            ,vendas_detalhe.fk_id_venda_oferta_especial
            ,vendas_cabecalho.cabecalho_venda_data
            ,vendas_cabecalho.cabecalho_venda_data_prazo_entrega
            ,vendas_cabecalho.cabecalho_venda_data_envio
            ,vendas_cabecalho.cabecalho_venda_valor_bruto
            ,vendas_cabecalho.cabecalho_venda_valor_taxa
            ,vendas_cabecalho.cabecalho_venda_valor_frete
            ,vendas_cabecalho.cabecalho_venda_valor_total
            ,vendas_detalhe.vendas_detalhe_quantidade
            ,vendas_detalhe.vendas_detalhe_preco_unitario
            ,vendas_detalhe.vendas_detalhe_perc_desconto
            ,produtos.produto_custo_padrao
            ,vendas_cabecalho.cabecalho_venda_numero_revisao 
            ,vendas_cabecalho.cabecalho_venda_status
            ,vendas_cabecalho.descricao_status
            ,vendas_cabecalho.cabecalho_venda_online
            ,vendas_cabecalho.cabecalho_venda_num_pedido_compra
            ,vendas_cabecalho.cabecalho_venda_numero_conta 
            ,vendas_cabecalho.cabecalho_venda_cod_aprov_cartao            
        from vendas_detalhe
        left join vendas_cabecalho on vendas_cabecalho.pk_id_ordem_de_venda = vendas_detalhe.fk_id_vendas_cabecalho
        left join produtos on produtos.pk_id_produto = vendas_detalhe.fk_id_produto
        order by vendas_cabecalho.cabecalho_venda_data, vendas_cabecalho.pk_id_ordem_de_venda
    )
    , metricas as (
        select 
            *
            , vendas_detalhe_quantidade * vendas_detalhe_preco_unitario as vendas_valor_bruto
            , vendas_detalhe_quantidade * (vendas_detalhe_preco_unitario * (1- vendas_detalhe_perc_desconto)) as vendas_valor_liquido
            , vendas_valor_liquido - (produto_custo_padrao * vendas_detalhe_quantidade) as vendas_margem_liquida
            , vendas_valor_bruto - (produto_custo_padrao * vendas_detalhe_quantidade) as vendas_margem_bruta    
        from regra_negocio
    )

select * from regra_negocio

