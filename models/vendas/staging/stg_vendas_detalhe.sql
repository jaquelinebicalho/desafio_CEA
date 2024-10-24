with 
    renomeado as (
        select
            cast(SALESORDERDETAILID as int) as pk_id_vendas_detalhe
            ,cast(SALESORDERID as int) as fk_id_vendas_cabecalho
            ,cast(PRODUCTID as int) as fk_id_produto
            ,cast(SPECIALOFFERID as int) as fk_id_venda_oferta_especial     
            ,cast(ORDERQTY as int) as vendas_detalhe_quantidade
            ,cast(UNITPRICE as float) as vendas_detalhe_preco_unitario
            ,cast(UNITPRICEDISCOUNT as float) as vendas_detalhe_perc_desconto
            ,cast(CARRIERTRACKINGNUMBER as varchar) as vendas_detalhe_numero_rastreamento   
        from  {{source('erp_adventure_works','SALESORDERDETAIL')}}
    )   

select * 
from renomeado