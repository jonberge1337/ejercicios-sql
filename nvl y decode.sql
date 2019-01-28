-- 1. Mostrar de todos los artículos, su código, descripción y nº de existencias en el almacén.
-- (Si el valor de existencias es nulo obtener “0”)

SELECT ARTICULO, PROVEEDOR, DESCRIPCION, NVL(EXISTENCIAS, 0) EXISTENCIAS
FROM ARTICULOS

-- 2. Mostrar todos los artículos y para aquellos cuyo nº de existencias sea nulo,
-- obtener el valor del campo “bajo_minimo”.

SELECT ARTICULO, PROVEEDOR, DESCRIPCION, NVL(EXISTENCIAS, BAJO_MINIMO) EXISTENCIAS
FROM ARTICULOS

-- 3. Obtener el nº de artículos que tienen un nº de existencias menor que el valor del campo “bajo_minimo”.

SELECT COUNT(*)
FROM ARTICULOS
WHERE EXISTENCIAS < BAJO_MINIMO

-- 4. Obtener información de los clientes y su forma de pago.
-- Sacar el valor al contado en el caso que no tengan asignada ninguna forma de pago.

SELECT CLIENTE, EMPRESA, NOMBRE, APELLIDOS, NVL(FORMPAGO, 'C') FORMPAGO
FROM CLIENTES

-- 5. Obtener los diez primeros clientes, y mostrar el código, empresa, nombre, y la segunda dirección.
-- (Si “direccion2” es nula indicar el valor ‘SIN DIRECCION’).

SELECT CLIENTE, EMPRESA, APELLIDOS, NOMBRE, NVL(DIRECCION2, 'SIN DIRECCION')
FROM CLIENTES
WHERE CLIENTE < 11

-- 6. Especificar para cada provincia la comunidad autónoma a la que pertenece.
SELECT DECODE(UPPER(DESCRIPCION), 'GUIPUZCOA', 'PAIS VASCO', 'ALAVA', 'PAIS VASCO', 'BARCELONA', 'CATALUÑA', 'RESTO')
FROM PROVINCIAS

-- 7. Mostrar los artículos del almacén, e indicar si su nº de existencias es PAR ó IMPAR. (Los valores nulos se toman como pares)

SELECT ARTICULOS.*, DECODE(MOD(NVL(EXISTENCIAS, 0),2), 0, 'PAR', 1, 'IMPAR') "EXISTENCIAS PAR O IMPAR"
FROM ARTICULOS

-- 8. Obtener información sobre los albaranes, y obtener para cada uno de ellos el IVA dependiendo de su forma de pago:

-- Forma de pago IVA

-- ‘C’ 7%

-- ‘L1’  15%

-- ‘L2’ 20%

-- todas las demás 25%

SELECT ALBARANES.*, DECODE(FORMPAGO, 'C', '7%', 'L1', '15%', 'L2', '20%', '25%') IVA
FROM ALBARANES

-- 9. Obtener información sobre los artículos vendidos, su descripción y su tipo de artículos dependiendo del descuento asociado, de la siguiente forma:

-- Descuento  Tipo Artículo

-- 4 Alimentación

-- 5 Perecedero

-- 10 Lujo

-- todas las demás Medio

-- (En caso de que sea nulo, asignarle el descuento 4)

SELECT LINEAS.*, DECODE(NVL(DESCUENTO, 4), 4, 'ALIMENTACION', 5, 'PERECEDERO', 10, 'LUJO', 'MEDIO') "TIPO ARTICULO"
FROM LINEAS

-- 10. Obtener información sobre los albaranes y para cada uno de ellos obtener:

 

                      -- Fecha Albaran  Siglo

-- <2000  XX

-- >2000  XXI

-- En otro caso Error 

SELECT FECHA_ALBARAN, DECODE(SUBSTR(TO_CHAR(FECHA_ALBARAN, 'YYYY'), 1, 1), '1', '<2000  XX', '2', '>2000  XXI', 'ERROR') SIGLO
FROM ALBARANES
