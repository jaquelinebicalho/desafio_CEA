with 
    renomeado as (
        select
            cast (SALESORDERID as int) as pk_id_ordem_de_venda
            ,cast (CUSTOMERID as int) as fk_id_cliente 
            ,cast (SALESPERSONID as int) as fk_id_vendedor 
            ,cast (TERRITORYID as int) as fk_id_territorio
            ,cast (BILLTOADDRESSID as int) as fk_id_endereco_fatura 
            ,cast (SHIPTOADDRESSID as int) as fk_id_endereco_entrega
            ,cast (SHIPMETHODID as int) as fk_id_metodo_entrega
            ,cast (CREDITCARDID as int) as fk_id_cartao_credito
            ,cast (CURRENCYRATEID as int) as fk_id_taxa_moeda 
            ,cast (ORDERDATE as date) as cabecalho_venda_data
            ,cast (DUEDATE as date) as cabecalho_venda_data_prazo_entrega
            ,cast (SHIPDATE as date) as cabecalho_venda_data_envio
            ,cast (MODIFIEDDATE as date) as cabecalho_venda_data_modificacao
            ,cast (SUBTOTAL as number(18,2)) as cabecalho_venda_valor_bruto
            ,cast (TAXAMT as number(18,2)) as cabecalho_venda_valor_taxa
            ,cast (FREIGHT as number(18,2)) as cabecalho_venda_valor_frete 
            ,cast (TOTALDUE as number(18,2)) as cabecalho_venda_valor_total 
            ,cast (REVISIONNUMBER as varchar) as cabecalho_venda_numero_revisao 
            ,cast (STATUS as varchar) as cabecalho_venda_status 
            ,case
                when STATUS = '1' then 'Processando'
                when STATUS = '2' then 'Aprovada'
                when STATUS = '3' then 'Em espera'
                when STATUS = '4' then 'Recusada'
                when STATUS = '5' then 'Enviada'
                when STATUS = '6' then 'Cancelada'
                end as descricao_status
            --, ONLINEORDERFLAG  (0 pedido feito pelo vendedor, 1 pedido feito online pelo cliente)  
            ,case 
                when ONLINEORDERFLAG = '1' then 'Venda Online '
                when ONLINEORDERFLAG = '0' then 'Venda Loja'
                end as cabecalho_venda_online
            ,cast (PURCHASEORDERNUMBER as varchar) as cabecalho_venda_num_pedido_compra
            ,cast (ACCOUNTNUMBER as varchar) as cabecalho_venda_numero_conta 
            ,cast (CREDITCARDAPPROVALCODE as varchar) as cabecalho_venda_cod_aprov_cartao 
        from  {{source('erp_adventure_works','SALESORDERHEADER')}}
    )

select * 
from renomeado