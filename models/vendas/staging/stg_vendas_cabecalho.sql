with 
    renomeado as (
        select
            cast (SALESORDERID as int) as pk_id_ordem_de_venda
            ,cast (CUSTOMERID as int) as fk_id_cliente 
            ,cast (SALESPERSONID as int) as fk_id_vendedor 
            ,cast (TERRITORYID as int) as fk_id_territorio
            ,cast (BILLTOADDRESSID as int) as fk_id_endereco_fatura 
            ,cast (SHIPTOADDRESSID as int) as fk_id_endereco_envio
            ,cast (SHIPMETHODID as int) as fk_id_metodo_entrega
            ,cast (CREDITCARDID as int) as fk_id_cartao_credito
            ,cast (CURRENCYRATEID as int) as fk_id_taxa_moeda 
            ,cast (ORDERDATE as date) as ordem_venda_data
            ,cast (DUEDATE as date) as ordem_venda_data_prazo_entrega
            ,cast (SHIPDATE as date) as ordem_venda_data_envio
            ,cast (MODIFIEDDATE as date) as ordem_venda_data_modificacao
            ,cast (SUBTOTAL as number(18,2)) as ordem_venda_valor_subtotal
            ,cast (TAXAMT as number(18,2)) as ordem_venda_valor_taxa
            ,cast (FREIGHT as number(18,2)) as ordem_venda_valor_frete 
            ,cast (TOTALDUE as number(18,2)) as ordem_venda_valor_total 
            ,cast (REVISIONNUMBER as varchar) as ordem_de_venda_numero_revisao 
            ,cast (STATUS as varchar) as ordem_venda_status 
            --,cast (ONLINEORDERFLAG as varchar) as ordem_de_venda_venda_online   -- 0 se for colocado por vendedor  1 se entrou online pelo cliente  
            ,case 
                when ONLINEORDERFLAG = '1' then 'Venda Loja'
                when ONLINEORDERFLAG = '0' then 'Venda Online'
                end as ordem_de_venda_tipo_venda
            ,cast (PURCHASEORDERNUMBER as varchar) as ordem_de_venda_num_pedido_compra
            ,cast (ACCOUNTNUMBER as varchar) as ordem_venda_numero_conta 
            ,cast (CREDITCARDAPPROVALCODE as varchar) as ordem_de_venda_cod_aprov_cartao 
            ,cast (COMMENT as varchar) as ordem_de_venda_observacoes
        from  {{source('erp_adventure_works','SALESORDERHEADER')}}
    )

select * 
from renomeado