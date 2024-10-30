with
    vendedores as (
        select *
        from {{ ref('int_vendedores') }}
    )

select *
from vendedores