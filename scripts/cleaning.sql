-- SELECÃO DE TABELA
select * from olist_order_avaliacoes;

-- DESATIVAÇÃO DO MODO DE SEGURANÇA
SET SQL_SAFE_UPDATES = 0;

-- CORREÇÃO DOS DADOS VAZIOS
update olist_order_avaliacoes
set review_answer_timestamp = null
where review_answer_timestamp = '';

-- VERIFICAÇÃO DAS LINHAS VAZIAS
select * from olist_vendedores
where vendedor_prefix_cep is null and vendedor_cidade is null and
vendedor_estado is null;

-- EXCLUSÃO DE LINHAS VAZIAS
delete from olist_vendedores;
select * from olist_vendedores
where vendedor_id is null;

-- VERIFICAÇÃO DO TIPO DE VARIAVEL
select max(length(geolocalizacao_lng)) from olist_geolocalizacao;

-- CRIAÇÃO DE INDEX
create index review_id
on olist_order_avaliacoes(review_id);

-- VERIFICAÇÃO DE LINHAS DUPLICADAS
select count(*), count(distinct review_id) from olist_order_avaliacoes;

-- VISUALIZAÇÃO DE LINHAS DUPLICADAS
select * from olist_order_avaliacoes
where review_id in (select review_id from olist_order_avaliacoes group by review_id having count(*)>1)
order by review_id;

-- EXCLUSÃO DE LINHAS DUPLICADAS(DEPOIS DE CRIAR UMA COLUNA AUXILIAR UNICA E AUTO-INCREMENTO)
delete t1 from olist_order_avaliacoes t1
join olist_order_avaliacoes t2
where t1.review_id = t2.review_id and t1.aux>t2.aux;

create index review_id
on olist_order_avaliacoes(review_id);

drop index review_id
on olist_order_avaliacoes;
