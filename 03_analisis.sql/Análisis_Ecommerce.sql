-- Análisis
-- Ventas por cliente
select
	customers.id as customer_id,
    customers.first_name,
	customers.last_name,
    count(orders.id) as total_orders,
    sum(orders.total_amount) as total_spent
from customers
left join orders on customers.id = orders.customer_id
group by customers.id
order by total_spent desc;

-- Ventas promedio por pedido
select avg(total_amount) as venta_promedio
from orders;

-- Promedio por gasto de pedido
select
	orders.id as order_id,
    customers.first_name,
    customers.last_name,
    sum(orders_items.price) / count(distinct orders_items.id) as precio_promedio_producto,
    sum(orders_items.price) as total_order_amount
from orders
join customers on orders.customer_id = customers.id
join orders_items on orders.id = orders_items.order_id
group by orders.id, customers.first_name, customers.last_name
order by total_order_amount desc;

-- Top clientes por categoría de producto
select
	customers.id as customer_id,
    customers.first_name,
    customers.last_name,
    products.category,
    sum(orders_items.quantity) as total_quantity,
    sum(orders_items.price) as total_spent
from customers
join orders on customers.id = orders.customer_id
join orders_items on orders.id = orders_items.order_id
join products on orders_items.product_id = products.id
group by customers.id, customers.first_name, customers.last_name, products.category
order by products.category, total_spent desc;

-- Clientes más activos
select
	customers.id as customer_id,
	customers.first_name,
	customers.last_name,
	count(orders.id) as num_pedidos,
	sum(orders.total_amount) as total_gastado
from orders
join customers on orders.customer_id = customers.id
group by customers.id, customers.first_name, customers.last_name
order by total_gastado desc;

-- Cantidad de pedidos por fecha
select
	order_date,
    count(*) as num_pedidos,
    sum(total_amount) as total_ventas
from orders
group by order_date
order by order_date;

-- Stock restante vs unidades vendidas
select
	products.product_name,
    products.stock_qty as stock_actual,
    sum(orders_items_clean.total_quantity) as unidades_vendidas,
    (products.stock_qty - sum(orders_items_clean.total_quantity)) as stock_restante
from orders_items_clean
join products on orders_items_clean.product_id = products.id
group by products.product_name, products.stock_qty
order by  stock_restante desc;

-- Top productos por cantidad vendida
select
	products.product_name,
    sum(orders_items_clean.total_quantity) as unidades_vendidas
from orders_items_clean 
join products on orders_items_clean.product_id = products.id
group by products.product_name
order by unidades_vendidas desc;

-- Top productos por ingresos
select
	products.product_name,
    sum(orders_items_clean.total_price) as total_vendido
from orders_items_clean
join products on orders_items_clean.product_id = products.id
group by products.product_name
order by total_vendido desc;