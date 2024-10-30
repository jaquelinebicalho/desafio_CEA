with
    int_cartao_credito as (
        select *
        from {{ ref('int_cartao_credito_enriquecida') }}
    )

select *
from int_cartao_credito