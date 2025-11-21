-- Seleccionar la basa de datos 'ecommerce'
use ecommerce;

-- Ver las primeras 10 filas de cada tabla
select * from customers limit 10;

select * from products limit 10;

select * from orders limit 10;

select * from orders_items limit 10;

-- Contar filas de cada tabla
select 'customers' AS Tabla, count(*) AS Filas from customers 
	union all
select 'orders', count(*) from orders
	union all
select 'orders_items', count(*) from orders_items
	union all
select 'products', count(*) from products;

-- Descripción columnas
describe customers;

describe orders;

describe orders_items;

describe products;

-- Comprobar Foreign Keys
select
	table_name,
    column_name,
    constraint_name,
    referenced_table_name,
    referenced_column_name
from
	information_schema.key_column_usage
where
	referenced_table_name is not null
    and table_schema = 'ecommerce';