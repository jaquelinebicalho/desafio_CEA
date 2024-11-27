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

    ,vendas_enriquecida as (
        select 
            {{ dbt_utils.generate_surrogate_key(
                ['vendas_cabecalho.pk_id_ordem_de_venda', 'vendas_detalhe.fk_id_produto']
            ) }} as sk_produto_pedido
            ,vendas_cabecalho.pk_id_ordem_de_venda
            ,vendas_detalhe.pk_id_vendas_detalhe
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
            , vendas_valor_bruto - (produto_custo_padrao * vendas_detalhe_quantidade) as vendas_margem_bruta 
            , vendas_valor_liquido - (produto_custo_padrao * vendas_detalhe_quantidade) as vendas_margem_liquida
            , cabecalho_venda_valor_frete / (count(*) over(partition by pk_id_ordem_de_venda)) as frete_rateado  
        from vendas_enriquecida
    )

 , final_select as (
        select
            sk_produto_pedido
            ,pk_id_ordem_de_venda as Nota_Fiscal
            ,pk_id_vendas_detalhe as ID_Ordem_Pedido
            ,fk_id_cliente as ID_cliente
            ,fk_id_vendedor as ID_Vendedor
            ,fk_id_territorio as ID_Territorio
            ,fk_id_endereco_fatura as ID_Endereco_Fatura
            ,fk_id_endereco_entrega as ID_Endereco_Entrega
            ,fk_id_metodo_entrega as ID_Metodo_Entrega
            ,fk_id_cartao_credito as ID_Cartao_de_Credito
            ,fk_id_taxa_moeda as ID_Taxa_de_Cambio
            ,fk_id_produto as ID_Produto
            ,fk_id_venda_oferta_especial as ID_Codigo_Promocional
            ,cabecalho_venda_data  as "Data Emissão Venda"
            ,cabecalho_venda_data_prazo_entrega as "Data Prazo de Entrega"
            ,cabecalho_venda_data_envio as "Data de Envio"
            ,cabecalho_venda_valor_bruto as "Valor Subtotal NF"
            ,cabecalho_venda_valor_taxa as "Valor Total Impostos"
            ,cabecalho_venda_valor_frete as "Valor Total Frete"
            ,cabecalho_venda_valor_total as "Valor Total NF" 
            ,vendas_detalhe_quantidade as "Quantidade Produto"
            ,vendas_detalhe_preco_unitario as "Preço Venda Unitário"
            ,vendas_detalhe_perc_desconto as "Percentual Desconto"
            ,produto_custo_padrao as "Valor Custo Produto" 
            ,cast(vendas_valor_bruto as numeric(18,4)) as "Valor Total Bruto" --sem desconto
            ,cast(vendas_valor_liquido as numeric(18,2)) as "Valor Total Líquido" -- com desconto
            ,cast(vendas_margem_bruta as numeric(18,2)) as "Margem Bruta" --sem desconto
            ,cast(vendas_margem_liquida as numeric(18,2)) as "Margem Líquida" -- com desconto
            ,cast(frete_rateado as decimal) as "Valor Frete Rateado"
            ,cabecalho_venda_numero_revisao as "Num Revisão"
            ,cabecalho_venda_status as "Cod Status"
            ,descricao_status as "Status"
            ,cabecalho_venda_online as "Tipo Venda"
            ,cabecalho_venda_num_pedido_compra as "Num Pedido Compra"
            ,cabecalho_venda_numero_conta as "Num Conta"
            ,cabecalho_venda_cod_aprov_cartao as "Cód Aprovação Cartão"
            from metricas
 )

select * 
from final_select

