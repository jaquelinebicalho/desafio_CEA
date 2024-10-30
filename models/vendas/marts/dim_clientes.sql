with
    fonte_clientes as (
        select *
        from {{ ref('int_clientes_enriquecida') }}
    )

select *
from fonte_clientes