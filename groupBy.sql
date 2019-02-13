/* ejemplos de group by */
SELECT SYSDATE FROM DUAL
/

SELECT provincias.provincia, provincias.descripcion, COUNT(*) n_clientes
FROM clientes, provincias
WHERE clientes.provincia = provincias.provincia
GROUP BY provincias.descripcion, provincias.provincia
/

SELECT provincias.provincia, provincias.descripcion, COUNT(*) n_clientes
FROM clientes, provincias
WHERE clientes.provincia = provincias.provincia
GROUP BY provincias.descripcion, provincias.provincia
HAVING COUNT(*) > 5
/

SELECT provincias.provincia, provincias.descripcion, COUNT(*) n_clientes, MAX(cliente) maximo_cliente
FROM clientes, provincias
WHERE clientes.provincia = provincias.provincia
GROUP BY provincias.descripcion, provincias.provincia
HAVING COUNT(*) > 5
/

SELECT provincias.provincia, provincias.descripcion, COUNT(*) n_clientes, MAX(cliente) maximo_cliente
FROM clientes, provincias
WHERE clientes.provincia = provincias.provincia
GROUP BY provincias.descripcion, provincias.provincia
HAVING COUNT(*) > 1
ORDER BY provincias.descripcion DESC
/
SELECT provincias.provincia, provincias.descripcion, COUNT(*) n_clientes, MAX(cliente) maximo_cliente
FROM clientes, provincias
WHERE clientes.provincia = provincias.provincia
GROUP BY provincias.descripcion, provincias.provincia
HAVING COUNT(*) > 1
ORDER BY 3 DESC, 2 DESC
/
/* ejemplos de group by */

/* ejercicios de group by */
/* 38. Devolver el nº de líneas por albarán emitido. */

SELECT COUNT(*), ALBARAN
FROM LINEAS
GROUP BY ALBARAN
/

/* 39. Mostrar el total facturado por cada uno de los albaranes emitidos. */

SELECT ALBARAN, SUM((PRECIO - (PRECIO*DESCUENTO/100))*cantidad)
FROM LINEAS
GROUP BY ALBARAN
/

SELECT ALBARAN, SUM((PRECIO * CANTIDAD) - (PRECIO*CANTIDAD*DESCUENTO/100))
FROM LINEAS
GROUP BY ALBARAN
/
/* 40. Mostrar por cada cliente el nº de albaranes que le corresponden. */

SELECT CLIENTE, COUNT(*)
FROM ALBARANES
GROUP BY CLIENTE
/

/* 41. Mostrar para cada provincia la cantidad de artículos vendidos. */

SELECT PROVINCIAS.DESCRIPCION, COUNT(*)
FROM PROVEEDORES, LINEAS, PROVINCIAS
WHERE PROVEEDORES.PROVEEDOR = LINEAS.PROVEEDOR
  AND PROVEEDORES.PROVINCIA = PROVINCIAS.PROVINCIA
GROUP BY PROVINCIAS.DESCRIPCION
/
/* 42. Mostrar el nº de albaranes que se acogen a las distintas formas de pago existentes (por descripción). */

SELECT DESCRIPCION, COUNT(*)
FROM ALBARANES, FORMPAGOS
WHERE ALBARANES.FORMPAGO = FORMPAGOS.FORMPAGO
GROUP BY DESCRIPCION
/
/* 43. Mostrar por cada proveedor, el promedio del precio al que nos vende sus artículos. */

SELECT PROVEEDOR, AVG(PR_VENT)
FROM ARTICULOS
GROUP BY PROVEEDOR
/
/* 44. Mostrar la descripción de las provincias con menos de 10 clientes. */

SELECT DESCRIPCION, COUNT(*)
FROM PROVINCIAS, CLIENTES
WHERE PROVINCIAS.PROVINCIA = CLIENTES.PROVINCIA
GROUP BY DESCRIPCION
HAVING COUNT(*) < 10
/
/* 45. Mostrar el código y descripción de los artículos que han sido vendidos a los clientes más de 5 veces. */

SELECT LINEAS.ARTICULO, LINEAS.PROVEEDOR, DESCRIPCION
FROM ARTICULOS, LINEAS
WHERE ARTICULOS.ARTICULO = LINEAS.ARTICULO
  AND ARTICULOS.PROVEEDOR = LINEAS.PROVEEDOR
GROUP BY LINEAS.ARTICULO, LINEAS.PROVEEDOR, DESCRIPCION
HAVING COUNT(*) > 5
/

/* 46. Mostrar los albaranes y su facturación (precio*cantidad), pero sólo de aquellos cuyo 15 % de dicha facturación sea mayor a 100000 €. */

SELECT ALBARAN, SUM(PRECIO * CANTIDAD) FACTURACION
FROM LINEAS
GROUP BY ALBARAN
HAVING SUM(PRECIO * CANTIDAD * 0.15) > 100000
/
/* 47. Mostrar las provincias que contengan más de 4 clientes y además, más de 5 proveedores. */
/* DA ERROR */
SELECT PROVINCIAS.PROVINCIA, PROVINCIAS.DESCRIPCION, COUNT(CLIENTE), COUNT(PROVEEDOR)
FROM PROVINCIAS, PROVEEDORES, CLIENTES
WHERE PROVINCIAS.PROVINCIA = PROVEEDORES.PROVINCIA
  AND PROVINCIAS.PROVINCIA = CLIENTES.PROVINCIA
GROUP BY PROVINCIAS.PROVINCIA, PROVINCIAS.DESCRIPCION
HAVING COUNT(CLIENTE) > 4, COUNT(PROVEEDOR) > 5
/
/* 48. Hacer el mismo ejercicio con subselect. */

SELECT *
FROM PROVINCIAS
WHERE PROVINCIA IN (SELECT PROVINCIA
		    FROM CLIENTES
		    WHERE PROVINCIAS.PROVINCIA = CLIENTES.PROVINCIA
		    GROUP BY PROVINCIA
		    HAVING COUNT(*) > 4)
  AND PROVINCIA IN (SELECT PROVINCIA
		    FROM PROVEEDORES
		    WHERE PROVINCIAS.PROVINCIA = PROVEEDORES.PROVINCIA
		    GROUP BY PROVINCIA
		    HAVING COUNT(*) > 5)
/	

/* 49. Mostrar las provincias que contienen más de 4 proveedores y además tienen algún cliente que haya realizado alguna compra. */

SELECT *
FROM PROVINCIAS
WHERE PROVINCIA IN (SELECT PROVINCIA
		    FROM PROVEEDORES
		    WHERE PROVEEDORES.PROVINCIA = PROVINCIAS.PROVINCIA
		    GROUP BY PROVINCIA
		    HAVING COUNT(*) > 4)
 AND PROVINCIA IN (SELECT PROVINCIA
		   FROM CLIENTES, ALBARANES
		   WHERE PROVINCIAS.PROVINCIA = CLIENTES.PROVINCIA
		     AND CLIENTES.CLIENTE = ALBARANES.CLIENTE)	
/	
/* 50. Mostrar los artículos con su cantidad total vendida, de aquellos cuyo número de existencias sea mayor a la media y cuya fecha de última salida sea superior al 1er semestre de 1988. */

/* 51. Mostrar los artículos de nuestro almacén, así como su IVA al 16% y su nº de existencias. */

/* Ordenar por importe de IVA descendentemente y por nº de existencias de forma ascendente. */









/* 52. Mostrar los albaranes, con su total facturado, cliente y provincia de aquellos cuya fecha de facturación sea del segundo trimestre y la descripción de la provincia tenga mas de 6 letras. */

/* Ordenarlo por fecha de envío y por total facturado. */
