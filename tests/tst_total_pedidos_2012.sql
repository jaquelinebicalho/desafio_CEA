
 /*  
    Este teste garante que a quantidade de pedidos realizados em 2012 estão
    em conformidade com os dados encontrados no database adw: 3.915
    
*/

{{ config (
        severity = 'error'
    )
}}
 
 with
    qnt_pedidos_2012 as (
        select 
            COUNT(DISTINCT Nota_Fiscal) as total_pedidos
        from {{ ref('int_vendas_enriquecida') }}
        where "Data Emissão Venda" between '2012-01-01' and '2012-12-31'
        --3915
    )
select total_pedidos
from qnt_pedidos_2012
where total_pedidos != '3915'
