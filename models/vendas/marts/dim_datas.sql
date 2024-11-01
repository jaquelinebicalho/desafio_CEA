with 
    date_spine as (
        {{ dbt_utils.date_spine(
            datepart="day",
            start_date="'2000-01-01'",
            end_date="'2030-12-31'"
        ) }}
    ),

    date_range as (
        select 
            date_day as date_key,
            extract(year from date_day) as ano,
            extract(month from date_day) as mes,
            extract(day from date_day) as dia,
            extract(dayofweek from date_day) as dia_da_semana,
            extract(quarter from date_day) as trimestre,
           to_char(date_day, 'YYYY-MM-DD') as data_string,
            case
                when extract(dayofweek from date_day) in (1, 7) then 'weekend'
                else 'weekday'
            end as day_type
        from date_spine
    ),
    
    last_update as (
        select
            max(cabecalho_venda_data) as ultima_atualizacao
        from {{ ref('stg_vendas_cabecalho') }}
        where cabecalho_venda_data is not null
    ),

    enriched_date_range as (
        select
            date_key,
            ano,
            mes,
            dia,
            dia_da_semana,
            trimestre,
            data_string,
            day_type,
            (select ultima_atualizacao from last_update) as data_ultima_atualizacao
        from date_range
    )

select *
from enriched_date_range
