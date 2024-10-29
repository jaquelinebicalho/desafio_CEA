with 
    vendedores as (
        select *
        from  {{ref("stg_vendedores")}}
    )

    ,pessoas as (
        select *
        from {{ref("stg_pessoas")}}    
    )

    ,renomeado as (
        select 
            vendedores.pk_id_vendedor_entidade_comercial as "ID Identidade Pessoal"
            ,vendedores.fk_id_territorio as "ID localização"
            ,pessoas.pessoa_nome as "Nome"
            ,pessoas.pessoa_tipo as "Cód"
            ,pessoas.pessoa_tipo_desc as "Tipo Pessoa"
            ,vendedores.vendedor_meta as "Meta Vendedor"
            ,vendedores.vendedor_bonus as "Bônus Vendedor"
            ,vendedores.vendedor_comissao as "Comissão Vendedor"
            ,vendedores.vendedor_vendas_acumuladas as " Vendas Acumuladas"
            ,vendedores.vendedor_vendas_ano_anterior as "Vendas Ano Anterior"
            from vendedores
            left join pessoas on pk_id_pessoa_identidade_empresarial = pk_id_vendedor_entidade_comercial
    )
select *
from renomeado