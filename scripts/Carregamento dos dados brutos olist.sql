/*
create table olist_customers_dataset (
customer_id varchar(32),
customer_unique_id varchar(32),
customer_zip_code_prefix char(5),
customer_city varchar(32),
customer_state char(2)
);

SET GLOBAL LOCAL_INFILE = 1;
LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_customers_dataset.csv'
INTO TABLE olist_clientes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
/*
create table olist_geolocation_dataset (
geolocation_zip_code_prefix char(5),
geolocation_lat double,
geolocation_lng double,
geolocation_city varchar(32),
geolocation_state char(2)
);

LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_geolocation_dataset.csv'
INTO TABLE olist_geolocalizacao
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
/*
create table olist_order_items_dataset (
order_id varchar(32),
order_item_id int,
product_id varchar(32),
seller_id varchar(32),
shipping_limit_date datetime,
price decimal(10,2),
freight_value decimal(10,2)
);

LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_order_items_dataset.csv'
INTO TABLE olist_pedido_itens
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
/*
create table olist_order_payments_dataset (
order_id varchar(32),
payment_sequential int,
payment_type varchar (32),
payment_installments int,
payment_value decimal(10,2)
);

LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_order_payments_dataset.csv'
INTO TABLE olist_pedido_pagamentos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
/*
create table olist_order_avaliacoes (
review_id varchar(32),
order_id varchar(32),
review_score varchar(32),
review_comment_title text,
review_comment_message text,
review_creation_date varchar(32),
review_answer_timestamp varchar(32)
);

LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_order_reviews_dataset.csv'
INTO TABLE olist_order_avaliacoes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
/*
create table olist_orders_dataset (
order_id  varchar(32),
customer_id varchar(32),
order_status varchar(32),
order_purchase_timestamp datetime,
order_approved_at datetime,
order_delivered_carrier_date datetime,
order_delivered_customer_date datetime,
order_estimated_delivery_date datetime
);

LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_orders_dataset.csv'
INTO TABLE olist_pedidos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
/*
create table olist_products_dataset (
product_id varchar(32),
product_category_name varchar(32),
product_name_lenght float,
product_description_lenght float,
product_photos_qty float,
product_weight_g float,
product_length_cm float,
product_height_cm float,
product_width_cm float
);

LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_products_dataset.csv'
INTO TABLE olist_produtos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
/*
create table olist_sellers_dataset (
seller_id varchar(32),
seller_zip_code_prefix char(5),
seller_city varchar(32),
seller_state char(2)
);

LOAD DATA LOCAL
INFILE 'C:\\temp\\olist_sellers_dataset.csv'
INTO TABLE olist_vendedores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
