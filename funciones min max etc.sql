-- 1. Contar las filas de la tabla formpagos que contengan por lo menos una L en su código.
SELECT COUNT(*)
FROM FORMPAGOS
WHERE FORMPAGO LIKE'%L%'

-- 2. Devuelve el número de provincias distintas al que pertenecen nuestros proveedores.
SELECT COUNT(DISTINCT PROVINCIA)
FROM PROVEEDORES

-- 3. Sumar los precios de costo de los artículos
SELECT SUM(PR_COST) "PRECIO COSTO TOTAL"
FROM ARTICULOS

-- 4. Obtener la suma total de las cantidades vendidas de los articulos en todos los albaranes.
SELECT SUM(CANTIDAD)
FROM LINEAS

-- 5. Obtener la suma total pero solo de las cantidades de valor diferente.
SELECT SUM(DISTINCT CANTIDAD)
FROM LINEAS

-- 6. Obtener el promedio de los precios de costo y de venta de los artículos,
--cuyo código de unidad de medición es ‘Unidades’.
SELECT TO_NUMBER(TO_CHAR(AVG(PR_COST), '9999999999D99')) "MEDIA PRECIO COSTO", 
TO_NUMBER(TO_CHAR(AVG(PR_VENT), '9999999999D99')) "MEDIA PRECIO VENTA"
FROM ARTICULOS
WHERE UPPER(UNIDAD) = 'UN'

-- 7. Obtener el stock máximo existente en nuestro almacén de entre todos los artículos.
SELECT MAX(EXISTENCIAS)
FROM ARTICULOS

-- 8. Construir la instrucción que devuelve el nº de artículos grabados, así como los precios de venta máximos y mínimos de entre todos los artículos.
SELECT COUNT(ARTICULO), MAX(PR_VENT) "PRECIO MAXIMO", MIN(PR_VENT) "PRECIO MINIMO"
FROM ARTICULOS

-- 9. Obtener el n º de formas de pago existentes.
SELECT COUNT(FORMPAGO)
FROM FORMPAGOS

-- 10. Obtener el n º de albaranes diferentes desde la tabla de albaranes.
SELECT COUNT(*)
FROM ALBARANES


-- 11. Obtener el n º de albaranes diferentes desde la tabla líneas.
SELECT COUNT(DISTINCT ALBARAN)
FROM LINEAS

-- 12. Obtener cuantos nombres de clientes diferentes existen.
SELECT COUNT(DISTINCT NOMBRE)
FROM CLIENTES


-- 13. Listar los artículos del almacén, su precio de costo y su precio de venta incrementado en un 5%.
SELECT ARTICULO, PROVEEDOR, DESCRIPCION, PR_VENT * 1.05 PR_VENT, PR_COST * 1.05 PR_COST
FROM ARTICULOS

-- 14. Obtener el máximo margen de ganancia en la venta de un articulo.
SELECT MAX(PR_VENT - PR_COST)
FROM ARTICULOS

-- 15. Obtener el 15% de I.V.A. para cada artículo.
SELECT *, PR_VENT * 0.15 IVA
FROM ARTICULOS


-- 16. Obtener el numero de albaranes que tienen fecha de pago en marzo.
SELECT COUNT(*)
FROM ALBARANES
WHERE TO_CHAR(FECHA_PAGO, 'MM') = '03'

-- 17. El precio máximo de venta de los artículos del almacén (MAXIMA_VENTA).
SELECT MAX(PR_VENT)
FROM ARTICULOS

-- 18. Obtener mediante una sentencia SQL:

-- · El menor precio de costo (MINIMO_COSTO).

-- · El promedio del número de existencias (PROMEDIO_EXIST).
SELECT MIN(PR_COST), ROUND(AVG(EXISTENCIAS), 2)
FROM ARTICULOS

-- 19. Obtener el promedio de la longitud de las descripciones de las provincias que empiecen con la letra ‘B’ (PROMEDIO_B).
SELECT ROUND(AVG(LENGTH(DESCRIPCION)), 2)
FROM PROVINCIAS
WHERE DESCRIPCION LIKE 'B%'