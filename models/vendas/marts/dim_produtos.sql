with
    fonte_produtos as (
        select *
        from {{ ref('int_produtos_enriquecida') }}
    )

select *
from fonte_produtos