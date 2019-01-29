-- 1. Obtener el nombre de empresa de cada uno de los clientes junto al nombre de la provincia a la que pertenece.

SELECT EMPRESA, DESCRIPCION
FROM PROVINCIAS, CLIENTES
WHERE CLIENTES.PROVINCIA = PROVINCIAS.PROVINCIA

-- 2. Obtener los nombres de los proveedores junto con los artículos que nos suministran.

SELECT PROVEEDORES.EMPRESA, ARTICULO
FROM ARTICULOS, PROVEEDORES
WHERE PROVEEDORES.PROVEEDOR = ARTICULOS.ARTICULO

-- 3. Obtener todos los proveedores junto con sus artículos (si los tienen) seleccionando la descripción del artículo y el beneficio correspondiente de su venta.

SELECT PROVEEDORES.PROVEEDOR, ARTICULO, DESCRIPCION, PR_VENT - PR_COST BENEFICIO
FROM PROVEEDORES, ARTICULOS
WHERE PROVEEDORES.PROVEEDOR = ARTICULOS.PROVEEDOR

SELECT PROVEEDOR, ARTICULO, DESCRIPCION, PR_VENT - PR_COST BENEFICIO
FROM ARTICULOS

-- 4. Obtener de los artículos que han sido vendidos alguna vez (los que aparecen en los albaranes), su código, nombre y el número de existencias del artículo en el almacén actualmente.

SELECT ARTICULOS.ARTICULO, ARTICULOS.PROVEEDOR, DESCRIPCION, EXISTENCIAS
FROM ARTICULOS, LINEAS
WHERE LINEAS.ARTICULO = ARTICULOS.ARTICULO

-- 5. Obtener el nombre y apellidos de los clientes madrileños y con forma de pago al ‘Contado’.

SELECT NOMBRE, APELLIDOS
FROM PROVINCIAS, CLIENTES, FORMPAGOS
WHERE UPPER(PROVINCIAS.DESCRIPCION) = 'MADRID' AND UPPER(FORMPAGOS.DESCRIPCION) =  'CONTADO' AND CLIENTES.PROVINCIA = PROVINCIAS.PROVINCIA AND CLIENTES.FORMPAGO = FORMPAGOS.FORMPAGO

-- 6. Obtener la descripción de las provincias que contengan clientes y proveedores.

SELECT DESCRIPCION
FROM PROVEEDORES, PROVINCIAS, CLIENTES
WHERE CLIENTES.PROVINCIA = PROVINCIAS.PROVINCIA AND PROVINCIAS.PROVINCIA = PROVEEDORES.PROVINCIA
GROUP BY DESCRIPCION

-- 7. Obtener la descripción de las provincias que contengan clientes o proveedores.

SELECT DESCRIPCION
FROM PROVEEDORES, PROVINCIAS, CLIENTES
WHERE CLIENTES.PROVINCIA = PROVINCIAS.PROVINCIA AND PROVINCIAS.PROVINCIA = PROVEEDORES.PROVINCIA
GROUP BY DESCRIPCION

-- 8. Obtener los artículos cuyo precio de venta esté entre 50000 y 60000 Euros. y la provincia del proveedor que lo suministra sea BARCELONA.

SELECT ARTICULOS.ARTICULO, ARTICULOS.PROVEEDOR
FROM PROVEEDORES, ARTICULOS, PROVINCIAS
WHERE PR_VENT BETWEEN 50000 AND 60000
    AND PROVEEDORES.PROVINCIA = PROVINCIAS.PROVINCIA
    AND ARTICULOS.PROVEEDOR = PROVEEDORES.PROVEEDOR
-- 9. Obtener los albaranes que contengan algún artículo que sea suministrado por algún proveedor vasco y a su vez que las existencias superen en el almacén el stock mínimo (bajo_mínimo) en más de 10 unidades.

SELECT ALBARANES.ALBARAN, PROVINCIAS.DESCRIPCION
FROM ALBARANES, LINEAS, ARTICULOS, PROVEEDORES, PROVINCIAS
WHERE PROVINCIAS.DESCRIPCION IN('ALAVA', 'VIZCAYA', 'GUIPUZCOA')
    AND LINEAS.ARTICULO = ARTICULOS.ARTICULO
    AND LINEAS.PROVEEDOR = ARTICULOS.PROVEEDOR
    AND ARTICULOS.PROVEEDOR = PROVEEDORES.PROVEEDOR
    AND PROVEEDORES.PROVINCIA = PROVEEDORES.PROVINCIA
    AND ALBARANES.ALBARAN = LINEAS.ALBARAN

-- 10. Seleccionar los albaranes cuya fecha de pago se encuentre en la 1ª quincena de marzo de 1988 y la fecha de albarán sea de la 2ª quincena de febrero del mismo año.


11. Seleccionar los proveedores cuyas provincias estén en el rango 15 a 30 y cumpla a su vez que su código esté entre 20 y 40.


12. Seleccionar los proveedores vascos y madrileños.


13. Obtener los albaranes cuyas fechas de pago estén dentro de los meses impares de los años 1988 y 1990.


14. Obtener los clientes cuyas formas de pago sean al ‘Contado’, ‘30’ días o ‘30/60’ días.


15. Seleccionar las provincias que comiencen con la letra ‘Z’ y su cuarta letra sea la ‘A’.


16. Buscar las empresas proveedoras que sean sociedades anónimas o sociedades limitadas.

17. Seleccionar las provincias que comiencen por la letra ‘B’,’M’, o ‘V’ y contengan la vocal ‘A’.


18. Seleccionar los clientes, cuya empresa contenga la cadena de caracteres ‘TALLER’ en su descripción y pertenezca a alguna provincia que contenga la letra ‘C’.


19. Seleccionar los proveedores cuyo prefijo de provincia comience por 94 y no tengan 2ª dirección.


20. Contar los albaranes que de los clientes cuyo distrito sea nulo y su nombre de empresa contenga la letra ‘M’ y la vocal ‘A’.
