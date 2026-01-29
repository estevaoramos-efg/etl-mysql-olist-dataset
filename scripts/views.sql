SELECT * FROM olist_pedidos;

SELECT timediff(pedido_hora_aprovacao, pedido_hora_compra) FROM olist_pedidos;


SELECT 
    IF(DAYOFWEEK(pedido_hora_compra) = 1, 'Domingo',
    IF(DAYOFWEEK(pedido_hora_compra) = 2, 'Segunda-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 3, 'Terça-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 4, 'Quarta-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 5, 'Quinta-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 6, 'Sexta-feira', 'Sábado')))))) AS dia_da_semana
FROM olist_pedidos;

select timestampdiff(day, pedido_data_entregue_transportadora, pedido_data_entregue_cliente) as tempo_de_entrega from olist_pedidos;


SELECT 
    IF(DAYOFWEEK(pedido_hora_compra) = 1, 'Domingo',
    IF(DAYOFWEEK(pedido_hora_compra) = 2, 'Segunda-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 3, 'Terça-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 4, 'Quarta-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 5, 'Quinta-feira',
    IF(DAYOFWEEK(pedido_hora_compra) = 6, 'Sexta-feira', 'Sábado')))))) AS dia_da_semana,
    count(*)
FROM olist_pedidos
group by dia_da_semana;



SELECT c.cliente_id_unico, 
	case 
		when count(*) = 1 then 'Cliente Novo'
        when count(*) between 2 and 5 then 'Recorrente'
        else 'Alto potencial'
	end as classificação_cliente
FROM olist_pedidos p
join olist_clientes c using(cliente_id)
group by c.cliente_id_unico;



select pedido_id, (i.preco + i.valor_frete) as valor_total_pedido, pg.pagamento_valor
from olist_pedidos p
join olist_pedido_itens i using(pedido_id) 
join olist_pedido_pagamentos pg using(pedido_id);