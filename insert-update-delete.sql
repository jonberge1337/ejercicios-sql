/* 0. Crear una tabla de nombre provinciasXX a imagen de provincias pero sin filas. */

CREATE TABLE PROVINCIASXX
AS SELECT *
FROM PROVINCIAS
WHERE 1 = 0
/
/* 1. Insertar una provincia nueva en provincias e insertar un cliente (tabla Clientes) y un proveedor (tabla Proveedores) nuevo para la provincia que habéis dado de alta. */

SELECT *
FROM PROVINCIAS
/

INSERT INTO PROVINCIAS(PROVINCIA, DESCRIPCION, PREFIJO)
VALUES(51, 'CEUTA', 952)
/

SELECT *
FROM PROVINCIAS
WHERE PROVINCIA = 51
/

SELECT *
FROM PROVINCIAS
WHERE PREFIJO = 952
/

SELECT *
FROM CLIENTES
/

INSERT INTO CLIENTES(CLIENTE, EMPRESA, APELLIDOS, NOMBRE, DIRECCION1, DIRECCION2, POBLACION, PROVINCIA, DISTRITO, TELEFONO, FORMPAGO, TOTAL_FACTURA)
VALUES(102, 'DULZIA GOXOKITOKI', 'BERGERANDI LOIDI', 'JON', 'SAN FRANTZISKO KALEA, 17', 'TRINIDADE KALEA 1', 'CEUTA', 51, 0, '(   )-6452018', 'C', 0)
/

SELECT *
FROM CLIENTES
WHERE CLIENTE = 102
/

SELECT *
FROM PROVEEDORES
/

INSERT INTO PROVEEDORES(PROVEEDOR, EMPRESA, APELLIDOS, NOMBRE, DIRECCION1, DIRECCION2, POBLACION, PROVINCIA, DISTRITO, TELEFONO)
VALUES(146, 'FRIT RAVICH', 'URTUBIA PERURENA', 'LUCIO', 'AVENIDA LIBERTAD, 24', 'PLAZA DEL SOL', 'CEUTA', '51', '0', '(   )-2304152')
/

SELECT *
FROM PROVEEDORES
WHERE PROVEEDOR = 146
/

/* 2. Insertar dos nuevos artículos (tabla Articulos) del nuevo proveedor. */

SELECT *
FROM ARTICULOS
/

INSERT INTO ARTICULOS(ARTICULO, PROVEEDOR, DESCRIPCION, PR_VENT, PR_COST, EXISTENCIAS, SOBRE_MAXIMO, BAJO_MINIMO, FEC_ULT_ENT, FEC_ULT_SAL, UNIDAD)
VALUES(300, 146, 'FACUNDO 85GR', 1.10, 0.70, 59, 125, 30, TO_DATE('20/12/2018', 'DD/MM/YYYY'), TO_DATE('20/02/2019', 'DD/MM/YYYY'), 'Un')
/

INSERT INTO ARTICULOS(ARTICULO, PROVEEDOR, DESCRIPCION, PR_VENT, PR_COST, EXISTENCIAS, SOBRE_MAXIMO, BAJO_MINIMO, FEC_ULT_ENT, FEC_ULT_SAL, UNIDAD)
VALUES(301, 146, 'FACUNDO 190GR', 1.90, 1.10, 69, 125, 30, TO_DATE('28/12/2018', 'DD/MM/YYYY'), TO_DATE('20/01/2019', 'DD/MM/YYYY'), 'Un')
/

SELECT *
FROM ARTICULOS
WHERE PROVEEDOR = 146
/
/* 3. Insertar un nuevo albarán (tabla Albaran) para el nuevo cliente con dos líneas en las que figuren los nuevos artículos. */

SELECT *
FROM ALBARANES
/

INSERT INTO ALBARANES(ALBARAN, CLIENTE, FECHA_ALBARAN, FECHA_ENVIO, FECHA_PAGO, FORMPAGO, ESTADO)
VALUES(69, 102, TO_DATE('28/01/2019', 'DD/MM/YYYY'), TO_DATE('29/01/2019', 'DD/MM/YYYY'), TO_DATE('28/01/2019', 'DD/MM/YYYY'), 'C', 'S')
/

INSERT INTO ALBARANES(ALBARAN, CLIENTE, FECHA_ALBARAN, FECHA_ENVIO, FECHA_PAGO, FORMPAGO, ESTADO)
VALUES(70, 102, TO_DATE('18/02/2019', 'DD/MM/YYYY'), TO_DATE('19/02/2019', 'DD/MM/YYYY'), TO_DATE('18/02/2019', 'DD/MM/YYYY'), 'C', 'S')
/
    
/* 4. Insertar en ‘provinciasXX’ las provincias que estén en la tabla clientes. */

SELECT *
FROM PROVINCIASXX
/

DELETE FROM PROVINCIASXX
/

INSERT INTO PROVINCIASXX
SELECT *
FROM PROVINCIAS
WHERE EXISTS(SELECT *
             FROM CLIENTES
             WHERE PROVINCIAS.PROVINCIA = CLIENTES.PROVINCIA)
/
/* 5. Insertar en ‘provinciasXX’ las provincias que aparecen en proveedores y no aparecen en clientes. */

INSERT INTO PROVINCIASXX
SELECT *
FROM PROVINCIAS
WHERE EXISTS(SELECT *
             FROM PROVEEDORES
             WHERE PROVEEDORES.PROVINCIA = PROVINCIAS.PROVINCIA)
  AND NOT EXISTS(SELECT *
                 FROM CLIENTES
                 WHERE CLIENTES.PROVINCIA = PROVINCIAS.PROVINCIA)
/

SELECT *
FROM PROVINCIASXX
/
/* 6. Borrar de la tabla ‘provinciasXX’ las provincias cuya descripción sea de más de 8 letras y contenga alguna L. */

DELETE FROM PROVINCIASXX
WHERE UPPER(DESCRIPCION) LIKE '%L%'
  AND LENGTH(DESCRIPCION) > 8
/

SELECT *
FROM PROVINCIASXX
/
/* 7. Borrar de la tabla ‘provinciasXX’ la provincia con mayor número de clientes. */
SELECT *
FROM PROVINCIASXX
/

DELETE FROM PROVINCIASXX
WHERE PROVINCIA = (SELECT PROVINCIA
                   FROM CLIENTES
                   GROUP BY PROVINCIA
                   HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                                      FROM CLIENTES, PROVINCIASXX
                                      WHERE CLIENTES.PROVINCIA = PROVINCIASXX.PROVINCIA
                                      GROUP BY CLIENTES.PROVINCIA))
/
/* 8. Borrar las provincias de ‘provinciasXX’ que tengan prefijo impar. */

/* 9. Crear una tabla de nombre provincias0XX, que sea reflejo de la tabla provinciasXX, pero modificando sus nombres de columnas para que sean cod, descrip y pref. */

/* 10. Crear la tabla ‘articulosXX’ a partir de artículos con todas sus filas. */

/* 11. Generar la instrucción que actualice el precio de venta de los artículos incrementado en un 5%. (Tabla articulosXX) */

/* 12. Incrementar el precio de costo en un 30%, para aquellos artículos cuyo beneficio en la venta sea el menor entre todos. (Tabla articulosXX) */

/* 13. Añadir a la tabla articulosXX la columna total_facturado y posteriormente actualizar dicha columna con las ventas realizadas para cada articulo. */

/* 14. Asignar al precio costo y de venta de los artículos de la tabla articulosXX el valor nulo. */

/* 15. Actualizar el precio de costo y de venta de los artículos de la tabla articulosXX con los valores que les correspondan en la tabla artículos. */
