/* 21. Seleccionar los artículos cuyas existencias en almacén sean de menor cantidad, entre los que tienen existencias (no nulo). */

SELECT ARTICULO, PROVEEDOR, EXISTENCIAS
FROM ARTICULOS
WHERE EXISTENCIAS IS NOT NULL AND EXISTENCIAS = (SELECT MIN(EXISTENCIAS) FROM ARTICULOS)
/
/* 22. Seleccionar los artículos cuyo precio de costo sea inferior al precio de todos los artículos vendidos. */

SELECT ARTICULO, PROVEEDOR, PR_COST
FROM ARTICULOS
WHERE PR_COST = (SELECT MIN(PRECIO) FROM LINEAS)
/

SELECT ARTICULO, PROVEEDOR, PR_COST
FROM ARTICULOS
WHERE PR_COST <= ALL(SELECT MIN(PR_VENT - PR_COST) FROM ARTICULOS)
/* 23. Seleccionar los artículos que más beneficios nos proporcione su venta, así como dicho beneficio. */

SELECT ARTICULO, PROVEEDOR, PR_VENT - PR_COST "BENEFICIO MAXIMO"
FROM ARTICULOS
WHERE PR_VENT - PR_COST = (SELECT MAX(PR_VENT - PR_COST) FROM ARTICULOS)
/

SELECT ARTICULO, PROVEEDOR, PR_VENT - PR_COST "BENEFICIO MAXIMO"
FROM ARTICULOS
WHERE PR_VENT - PR_COST) >= ALL(SELECT PR_VENT - PR_COST FROM ARTICULOS)
/
/* 24. Obtener los clientes que posean los albaranes con fecha de pago más reciente. */

SELECT *
FROM ALBARANES
WHERE FECHA_ALBARAN = (SELECT MAX(FECHA_ALBARAN) FROM ALBARANES)
/

SELECT *
FROM ALBARANES
WHERE FECHA_ALBARAN >= ALL(SELECT FECHA_ALBARAN FROM ALBARANES)
/
/* 25. Obtener los proveedores cuyos artículos tienen el mayor margen de existencias en el almacén (existencias – bajo_mínimo), dentro de los que pertenecen a las provincias que terminan con la letra D. */

SELECT PROVEEDORES.*
FROM PROVEEDORES, ARTICULOS
WHERE PROVINCIA IN(SELECT PROVINCIA FROM PROVINCIAS WHERE UPPER(DESCRIPCION) LIKE'%D')
     AND EXISTENCIAS - BAJO_MINIMO = (SELECT MAX(EXISTENCIAS - BAJO_MINIMO) FROM ARTICULOS)
     AND PROVEEDORES.PROVEEDOR = ARTICULOS.PROVEEDOR
/
/* 26. Seleccionar los proveedores que pertenezcan a alguna provincia que empiece por la letra G que a su vez contenga algún cliente con forma de pago al contado. */

SELECT *
FROM PROVEEDORES
WHERE PROVINCIA IN (SELECT PROVINCIA FROM PROVINCIAS WHERE DESCRIPCION LIKE 'G%')
AND PROVINCIA IN (SELECT PROVINCIA FROM CLIENTES WHERE FORMPAGO = 'C')
/
/* 27. Obtener las provincias que tienen clientes y proveedores. */

SELECT *
FROM PROVINCIAS
WHERE PROVINCIA IN (SELECT PROVINCIA FROM CLIENTES)
AND PROVINCIA IN (SELECT PROVINCIA FROM PROVEEDORES)
/
/* 28. Presentar la lista de clientes que han realizado alguna compra que no pertenecen a ninguna provincia que empiece por ‘M’. */

SELECT *
FROM CLIENTES
WHERE CLIENTE IN (SELECT CLIENTE FROM ALBARANES)
AND PROVINCIA IN (SELECT PROVINCIA FROM PROVINCIAS WHERE UPPER(SUBSTR(DESCRIPCION, 1, 1)) != 'M')
/
/* 29. Mostrar los clientes que no hayan pagado al contado sus pedidos en el mes de marzo de 1988. */

SELECT *
FROM CLIENTES
WHERE FORMPAGO IN(SELECT FORMPAGO FROM ALBARANES WHERE TO_CHAR(FECHA_ALBARAN, 'MM/YYYY') = '03/1988' AND UPPER(FORMPAGO) != 'C')
/* / falta corregir */
/* 30. Mostrar los clientes que tengan alguna compra con forma de pago diferente a la que tienen asignada por defecto. */

 SELECT *
FROM CLIENTES
WHERE FORMPAGO NOT IN(SELECT FORMPAGO FROM ALBARANES)
/
/* 31. Mostrar los albaranes que no posean líneas. */

SELECT *
FROM ALBARANES
WHERE ALBARAN NOT IN(SELECT ALBARAN FROM LINEAS)
/
/* 32. Seleccionar los clientes que contengan los albaranes en el 1er trimestre de 1988. */

SELECT *
FROM CLIENTES
WHERE CLIENTE IN(SELECT CLIENTE FROM ALBARANES WHERE FECHA_ALBARAN BETWEEN TO_DATE('1/1/1988', 'DD/MM/YYYY') AND TO_DATE('31/3/1988', 'DD/MM/YYYY'))
/
/* 33. Seleccionar las provincias que no posean clientes. */

SELECT *
FROM PROVINCIAS
WHERE PROVINCIA NOT IN(SELECT PROVINCIA FROM CLIENTES)
/* /revisar */
/* 34. Seleccionar las provincias que posean clientes sin albaranes. */

SELECT DISTINCT PROVINCIAS.*
FROM CLIENTES, PROVINCIAS
WHERE CLIENTES.PROVINCIA = PROVINCIAS.PROVINCIA
AND CLIENTE NOT IN(SELECT CLIENTE FROM ALBARANES)
/
/* 35. Obtener las provincias que contienen clientes y proveedores. */

SELECT *
FROM PROVINCIAS
WHERE PROVINCIA IN(SELECT PROVINCIA FROM CLIENTES)
     AND PROVINCIA IN(SELECT PROVINCIA FROM PROVEEDORES)
/
/* 36. Obtener las provincias con clientes y con proveedores que nos suministren algún artículo. */

SELECT PROVINCIAS.*
FROM PROVINCIAS
WHERE PROVINCIA IN(SELECT PROVINCIA FROM CLIENTES)
     AND PROVINCIA IN(SELECT PROVINCIA FROM PROVEEDORES
WHERE PROVEEDOR IN(SELECT PROVEEDOR FROM ARTICULOS))
/
/* 37. Obtener las provincias que contengan todas las formas de pago entre todos sus clientes. */
/* Obtener las provincias que cumplan que no existe ninguna forma de pago que no aparezca entre sus clientes */

SELECT *
FROM PROVINCIAS
WHERE NOT EXISTS(SELECT *
                 FROM FORMPAGOS
                 WHERE NOT EXISTS(SELECT *
                                  FROM CLIENTES
                                  WHERE CLIENTES.PROVINCIA=PROVINCIAS.PROVINCIA
                                      AND CLIENTES.FORMPAGO = FORMPAGOS.FORMPAGO))
/
/*  38. Seleccionar los proveedores que tengan entre sus articulos todas las unidades de medida. */
