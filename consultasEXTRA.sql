-- 1. Seleccionar los albaranes cuya fecha de pago se encuentre entre la 1ª quincena de Marzo de
-- 1988 y la fecha de albaran sea de la 2ª quincena de Febrero del mismo año.
SELECT ALBARAN, FECHA_PAGO, FECHA_ALBARAN
FROM ALBARANES
WHERE FECHA_PAGO BETWEEN TO_DATE('1/3/1988', 'DD/MM/YYYY') AND TO_DATE('15/3/1988', 'DD/MM/YYYY')
	AND FECHA_ALBARAN BETWEEN TO_DATE('15/02/1988', 'DD/MM/YYYY') AND LAST_DAY(TO_DATE('1/02/1988', 'DD/MM/YYYY'))
/

-- 2. Seleccionar los proveedores cuyas provincias estén en el rango 8 a 18 y cumplan a su vez que su código esté entre 30 y 60.
SELECT PROVEEDOR, EMPRESA
FROM PROVEEDORES
WHERE PROVINCIA BETWEEN 8 AND 18 AND PROVEEDOR BETWEEN 30 AND 60
/

-- 3. Seleccionar las formas de pago cuyo código sea ‘C’ o ‘L3’.
SELECT FORMPAGO, DESCRIPCION
FROM FORMPAGOS
WHERE FORMPAGO IN('C', 'L3')
/

-- 4. Seleccionar los proveedores catalanes (código de proveedor y empresa).
SELECT PROVEEDOR, EMPRESA
FROM PROVEEDORES
WHERE PROVINCIA = 8
/

-- 5. Obtener los albaranes cuyas fechas de pago estén dentro de los meses impares de los años 1988 y 1990.
SELECT ALBARAN
FROM ALBARANES
WHERE MOD(TO_NUMBER(TO_CHAR(FECHA_PAGO, 'MM')),2) != 0 AND TO_CHAR(FECHA_PAGO, 'YYYY') IN('1988', '1990')
/

-- 6. Obtener los clientes cuyas formas de pago sean ‘Contado’, ‘30’ ó ‘30/60’.
SELECT CLIENTE, EMPRESA
FROM CLIENTES
WHERE FORMPAGO IN('C', 'L1', 'L2')
/

-- 7. Seleccionar las provincias que comienzan con la letra ‘Z’ y su cuarta letra sea la ‘A’.
SELECT PROVINCIA, DESCRIPCION
FROM PROVINCIAS
WHERE UPPER(DESCRIPCION) LIKE 'Z__A%' 
/

-- 8. Buscar las empresas de clientes que sean sociedades anónimas ó sociedades limitadas.
SELECT CLIENTE, EMPRESA
FROM CLIENTES
WHERE SUBSTR(EMPRESA, LENGTH(EMPRESA) - 3, 3) = 'S.A' OR SUBSTR(EMPRESA, LENGTH(EMPRESA) - 3, 3) = 'S.L'
/

-- 9. Seleccionar las provincias que comiencen por las letras ‘P’,’T’ ó ‘C’, y contengan la vocal ‘A’.
SELECT PROVINCIA, DESCRIPCION
FROM PROVINCIAS
WHERE UPPER(DESCRIPCION) LIKE 'P%A%' OR UPPER(DESCRIPCION) LIKE 'T%A%' OR UPPER(DESCRIPCION) LIKE 'C%A%'
/

-- 10. Obtener los códigos de cliente sin duplicar que contienen albaranes en el mes de Mayo o Setiembre de 1988.
SELECT DISTINCT CLIENTE
FROM ALBARANES
WHERE TO_CHAR(FECHA_ALBARAN, 'MM/YYYY') IN('05/1988', '09/1988')
/

-- 11. Obtener los artículos cuya unidad de medida no sea Unidad.
SELECT ARTICULO, PROVEEDOR, DESCRIPCION
FROM ARTICULOS
WHERE UPPER(UNIDAD) != 'UN'
/

-- 12. Obtener el precio de venta de cada uno de los artículos de los proveedores de código par, aplicando una subida del 15% de IVA.
SELECT ARTICULO, PROVEEDOR, DESCRIPCION, PR_VENT * 1.15
FROM ARTICULOS
WHERE MOD(PROVEEDOR, 2) = 0
/

-- 13. Obtener la diferencia entre el máximo de existencias y el existente en el almacén para cada artículo.
SELECT ARTICULO, PROVEEDOR, DESCRIPCION, SOBRE_MAXIMO - EXISTENCIAS "DIFERENCIA"
FROM ARTICULOS
/

-- 14. Obtén los artículos que superan en más del doble el valor del precio de venta al de costo.
SELECT ARTICULO, PROVEEDOR, DESCRIPCION
FROM ARTICULOS
WHERE PR_VENT > PR_COST * 2
/

-- 15. Seleccionar los albaranes cuya fecha de pago pertenece a la segunda quincena.
SELECT ALBARAN, TO_NUMBER(TO_CHAR(FECHA_PAGO))
FROM ALBARANES
WHERE TO_NUMBER(TO_CHAR(FECHA_PAGO, 'DD')) > 15
/

-- 16. Calcular para el albarán de código 1, el total de cada línea, aplicado el descuento.
SELECT ALBARAN, SUM(PRECIO*(1-(DESCUENTO/100))) "PRECIO CON DESCUENTO"
FROM LINEAS
WHERE ALBARAN = 1
GROUP BY ALBARAN
/

-- 17. Calcular el beneficio por venta unitaria de cada artículo.
SELECT ARTICULO, PROVEEDOR, DESCRIPCION, PR_VENT - PR_COST "BENEFICIO"
FROM ARTICULOS
WHERE UPPER(UNIDAD) = 'UN'
/


-- 18. Calcular el beneficio total de todos los artículos por venta unitaria.
SELECT SUM(PR_VENT - PR_COST) "BENEFICIO TOTAL"
FROM ARTICULOS
WHERE UPPER(UNIDAD) = 'UN'
/

-- 19. Contar el número de proveedores madrileños y barceloneses.
SELECT COUNT(POBLACION) "MADRILEÑOS Y BARCELONESES"
FROM PROVEEDORES
WHERE UPPER(POBLACION) IN('MADRID', 'BARCELONA')
/

-- 20. Calcular la media de existencias en almacén de los artículos.
SELECT ROUND(SUM(EXISTENCIAS) / COUNT(EXISTENCIAS), 2) "MEDIA DE EXISTENCIAS"
FROM ARTICULOS