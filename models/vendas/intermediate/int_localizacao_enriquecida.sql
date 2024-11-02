with 
    cidade as  (
        select *
        from {{ref("stg_cidade")}}
    )
    ,estado as (
        select *
        from {{ref("stg_estado")}}
    )
    ,pais as (
        select *
        from {{ref("stg_regiao_pais")}}
    )

    ,localizacao_enriquecida as (
        select
            cidade.pk_id_endereco as ID_Endereco
            ,cidade.endereco_cidade as "Cidade"
            ,cidade.endereco_descricao as "Endereco Completo"
            ,estado.estado_nome as "Estado"
            ,pais.pais_nome as "Pais"
            ,pais.pais_codigo_regiao as "Cod Pais"
            from cidade 
            left join estado on pk_id_estado = fk_id_estado 
            left join pais on estado_codigo_regiao = pais_codigo_regiao
    )

    select *
    from localizacao_enriquecida