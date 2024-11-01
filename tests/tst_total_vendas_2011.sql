/*  
    Este teste garante que as vendas de 2011 estão
    corretas com o valor auditado da contabilidade:
    $ 12.646.112,16
*/

with
    vendas_em_2011 as (
        select sum("Valor Total Bruto") as "Valor Total Bruto"
        from {{ ref('int_vendas_enriquecida') }}
        where "Data Emissão Venda" between '2011-01-01' and '2011-12-31'
    ) -- R$ 12646112.16

select 
"Valor Total Bruto"
from vendas_em_2011
where "Valor Total Bruto" not between 12646112.11 and 12646112.21