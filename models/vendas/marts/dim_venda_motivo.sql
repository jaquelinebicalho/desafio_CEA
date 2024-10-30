with
    venda_motivo as (
        select *
        from {{ ref('int_venda_motivo_enriquecida') }}
    )

select *
from venda_motivo