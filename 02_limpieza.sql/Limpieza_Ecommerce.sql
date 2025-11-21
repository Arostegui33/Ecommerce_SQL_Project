-- Detección nulos
-- Customers
select
	sum(
		case 
			when id is null or id = '' then 1 
		end
	) as null_id,
    
    sum(
		case 
			when first_name is null or first_name = '' then 1 
		end
	) as null_first_name,
    
    sum(
		case when last_name is null or last_name = '' then 1 
        end
	) as null_last_name,
    
    sum(
		case 
			when email is null or email = '' then 1 
		end
	) as null_email,
    
    sum(
		case 
			when phone_number is null or phone_number = '' then 1 
		end
	) as null_phone_number
from customers;

-- Customers: 1 nulo en last_name
	-- Corrección: actualizar last_name vacío con 'Smith'
update customers
set last_name = 'Smith'
where last_name is null or last_name = '';

select id, first_name, last_name, phone_number, email
from customers
where last_name is null or last_name = '';

-- Orders
select
	sum(
		case 
			when id is null or id = '' then 1 
		end
	) as null_id,
    
    sum(
		case 
			when customer_id is null or customer_id = '' then 1 
		end
	)as null_customer_id,
    
    sum(
		case 
			when order_date is null or order_date = '' then 1 
		end
	) as null_order_date,
    
    sum(
		case 
			when total_amount is null or total_amount = '' then 1 
		end
	) as null_total_amount
from orders;

-- Orders: No hay nulos

-- Orders_items
select
	sum(
		case
			when id is null or id = '' then 1
		end
	) as null_id,
    
    sum(
		case
			when order_id is null or order_id = '' then 1
		end
	) as null_order_id,
    
    sum(
		case
			when product_id is null or product_id = '' then 1
		end
	) as null_product_id,
    
    sum(
		case
			when quantity is null or quantity = '' then 1
		end
	) as null_quantity,
    
    sum(
		case
			when price is null or price = '' then 1
		end
	) as null_price
from orders_items;

-- Orders_items: No hay nulos

-- Products
select
	sum(
		case
			when id is null or id = '' then 1
		end
	) as null_id,
    
    sum(
		case
			when product_name is null or product_name = '' then 1
		end
	) as null_product_name,
    
    sum(
		case
			when category is null or category = '' then 1
		end
	) as null_category,
    
	sum(
		case 
			when price is null or price = '' then 1
		end
	) as null_price,
    
    sum(
		case
			when stock_qty is null or stock_qty = '' then 1
		end
	) as null_stock_qty
from products;

-- Products: No hay nulos

-- Detección duplicados
-- Customers
select id, count(*)
from customers
group by id
having count(*) > 1;

select email, count(*)
from customers
group by email
having count(*) > 1;

-- Customers: No hay duplicados

-- Orders
select id, count(*)
from orders
group by id
having count(*) > 1;

select customer_id, order_date, count(*) as repeticiones
from orders
group by customer_id, order_date
having count(*) > 1;

-- Orders: No hay duplicados

-- Orders_items
select id, count(*)
from orders_items
group by id
having count(*) > 1;

select order_id, product_id, count(*) as repeticiones
from orders_items
group by order_id, product_id
having count(*) > 1;

-- Orders_items: 3 combinaciones de order_id + product_id duplicadas
	-- order_id 1, product_id 4: 3 repeticiones
    -- order_id 6, product_id 4: 2 repeticiones
    -- order_id 10, product_id 5: 2 repeticiones

-- Corrección:
select
	order_id,
    product_id,
    sum(quantity) as total_quantity,
    sum(price) as total_price
from orders_items
group by order_id, product_id;

-- Orders_items: No hay duplicados

-- Products
select id, count(*)
from products
group by id
having count(*) >1;

select product_name, count(*)
from products
group by product_name
having count(*) > 1;

select product_name, category, count(*)
from products
group by product_name, category
having count(*) > 1;

-- Products: No hay duplicados

-- Cambiar tipo de datos
alter table orders modify total_amount decimal(10,2);

alter table orders_items modify price decimal(10,2);

alter table products modify price decimal(10,2);

-- Crear nueva tabla 'orders_items_cleaned' con duplicados corregidos
create table orders_items_clean as
select
    order_id,
    product_id,
    sum(quantity) as total_quantity,
    sum(price) as total_price
from orders_items
group by order_id, product_id;

-- Añadir Primary Key a nueva tabla
alter table orders_items_clean
add primary key (order_id, product_id);