with 
    produtos as (
        select *
        from {{ref("stg_produtos")}}
    )

    ,categoria as (
        select *
        from {{ref("stg_produtos_categoria")}}
    )
        
    ,subcategoria as (
        select *
        from {{ref("stg_produtos_subcategoria")}}
    )
    
    ,renomeado as (
        select 
            produtos.pk_id_produto  as ID_Produto
            ,produtos.produto_nome as "Produto"
            ,categoria.categoria_nome as "Categoria"
            ,subcategoria.subcategoria_nome  as "Subcategoria"
            ,produtos.produto_data_inicio_vendas as "Início Vendas"
            ,produtos.produto_data_fim_vendas as "Fim das Vendas"
            ,produtos.produto_custo_padrao  as "Preço de Custo"
            ,produtos.produto_preco_listado as "Preço de Venda"
        from produtos
        left join subcategoria on produtos.fk_id_produto_subcategoria = subcategoria.pk_id_produto_subcategoria
        left join categoria on subcategoria.fk_id_produto_categoria = categoria.pk_id_produto_categoria
    )

select * 
from renomeado