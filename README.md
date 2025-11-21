# Ecommerce SQL Project

## Descripción
Proyecto de análisis de datos de un ecommerce ficticio. El objetivo es demostrar habilidades en SQL para tratamiento de datos, limpieza, agregación y análisis de información de clientes, pedidos y productos.

---

## Estructura de la base de datos
- **customers:** información de clientes (ID, nombre, correo, teléfono).  
- **products:** información de productos (ID, nombre, categoría, precio, stock).  
- **orders:** pedidos realizados por clientes (ID, cliente, fecha, total).  
- **orders_items:** productos incluidos en cada pedido (ID, pedido, producto, cantidad, precio).

---

## Procesos realizados
- Previsualización de datos (`SELECT * LIMIT 10`).  
- Conteo de filas y descripción de columnas.  
- Comprobación de claves primarias y foráneas.  
- Detección y corrección de valores nulos y duplicados.  
- Modificación de tipos de datos (`ALTER TABLE`).  
- Creación de tablas agregadas para limpieza de duplicados (`orders_items_clean`).  

---

## Consultas analíticas destacadas
- Ventas por cliente y gasto total.  
- Promedio de ventas por pedido y por producto.  
- Clientes más activos y top clientes por categoría de producto.  
- Cantidad de pedidos por fecha y stock restante vs unidades vendidas.  
- Top productos por cantidad vendida y por ingresos generados.  

---

## Objetivo del proyecto
Demostrar habilidades prácticas en SQL para el **preprocesamiento de datos, análisis de ventas y clientes**, y extracción de insights relevantes de un dataset de ecommerce.

---

## Cómo usarlo
1. Clonar el repositorio.  
2. Crear la base de datos `ecommerce` y las tablas según los scripts incluidos.  
3. Ejecutar las consultas paso a paso para reproducir los análisis.


