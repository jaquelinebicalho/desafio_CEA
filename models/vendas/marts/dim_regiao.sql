with
    int_regiao as (
        select *
        from {{ ref('int_localizacao_enriquecida') }}
    )

select *
from int_regiao