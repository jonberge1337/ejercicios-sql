/* 1. Crear la tabla albaranesXXX a imagen de albaranes pero sin filas. Comprueba que su número de líneas es cero. */

CREATE TABLE ALBARANESXXX
AS SELECT *
FROM ALBARANES
WHERE 1 = 0
/

/* 2. Insertar en la tabla albaranesXXX las filas de albaranes cuya fecha de albarán pertenezcan al primer trimestre de 1988. */

INSERT INTO ALBARANESXXX
SELECT *
FROM ALBARANES
WHERE TO_CHAR(FECHA_ALBARAN, 'MM/YYYY') IN('01/1988', '02/1988', '03/1988')
/
/* 3. Borrar de albaranesXXX las filas cuya fecha de albarán sea de Marzo de 1988. */
DELETE FROM ALBARANESXXX
WHERE TO_CHAR(FECHA_ALBARAN, 'MM/YYYY') = '03/1988'
/
/* 4. Crear la tabla lineasXXX a imagen de la tabla lineas insertando las filas correspondientes a los albaranes cargados en albaranesXXX. */

CREATE TABLE LINEASXXX
AS SELECT *
FROM ALBARANESXXX
WHERE 1 = 0
/
/* 5. Crear una tabla de nombre alba_tot_XX que este conformado por tres campos (num_alba, cuan_lin, tot_alba) que guarde el número de albaran, el número de líneas que contiene y el total calculado del albaran calculado a partir de sus líneas. */

CREATE TABLE ALBA_TOT_XX(NUM_ALBA, CUAN_LIN, TOT_ALBA)
AS SELECT ALBARAN, COUNT(LINEA), SUM(PRECIO * CANTIDAD)
FROM LINEAS
GROUP BY ALBARAN
/
/* 6. Actualizar en la tabla albaranesXXX la fecha de pago de los albaranes del mes de Abril y Mayo de 1988, con la fecha de hoy truncada. */

UPDATE ALBARANESXXX
SET FECHA_PAGO = TRUNC(SYSDATE)
WHERE TO_CHAR(FECHA_PAGO, 'MM/YYYY') IN('04/1988', '05/1988')
/
/* 7. Actualizar la tabla lineasXXX, de tal forma que incremente en todas sus filas, la cantidad de articulos vendidos en cien unidades, y su precio en mil. */

UPDATE LINEASXXX
SET CANTIDAD = CANTIDAD + 100, PRECIO = PRECIO + 1000
/
/* 8. Incrementar en un 5 por ciento el descuento de la líneas de albaran de la tabla lineasXXX, de aquellos albaranes que fueran de Enero de 1988. */

UPDATE LINEASXXX
SET DESCUENTO = DESCUENTO * (1 + 5 / 100)
WHERE ALBARAN IN (SELECT ALBARAN
                  FROM ALBARANES
                  WHERE TO_CHAR(FECHA_ALBARAN, 'MM/YYYY') = '01/1988')
/

UPDATE LINEASXXX
SET DESCUENTO = DESCUENTO * 1.05
WHERE ALBARAN IN (SELECT ALBARAN
                  FROM ALBARANES
                  WHERE TO_CHAR(FECHA_ALBARAN, 'MM/YYYY') = '01/1988')
/

/* 9. Borrar de albaranesXXX aquellos que no contengan filas en líneasXXX. */

DELETE FROM ALBARANESXXX
WHERE NOT EXISTS(SELECT *
                 FROM LINEASXXX
                 WHERE LINEASXXX.ALBARAN = ALBARANXXX.ALBARAN)
/
/* 10. Borrar de líneasXXX aquellas filas que pertenezcan a albaranes pagados (Estado=’S’). */

DELETE FROM LINEASXXX
WHERE ALBARAN IN (SELECT ALBARAN
                  FROM ALBARANES
                  WHERE ESTADO = 'S')
/

DELETE FROM LINEASXXX
WHERE EXISTS(SELECT *
             FROM ALBARANES
             WHERE ESTADO = 'S'
               AND ALBARANES.ALBARAN = LINEASXXX.ALBARAN)
/
/* 11. Borrar todas las filas de albaranesXXX y lineasXXX sin tener luego posibilidad de rollback. */

TRUNCATE TABLE LINEASXXX
/

TRUNCATE TABLE ALBARANESXXX
/
/* 12. Insertar una nueva unidad de medida en la tabla de unidades. */

INSERT INTO UNIDADES(UNIDAD, DESCRIPCION)
VALUES('ML', 'MILILITROS')
/

SELECT *
FROM UNIDADES
/
/* 13. Insertar un nuevo artículo para esa unidad. */

INSERT INTO ARTICULOS
VALUES(348, 65, 'GOTITAS', 5, 17, 5, 20, 2, TO_DATE('01/01/2019', 'DD/MM/YYYY'), TO_DATE('18/01/2019', 'DD/MM/YYYY') 'ML')
/* 14. Insertar una nueva forma de pago en la tabla formpagos. */

INSERT INTO FORMPAGOS
VALUES('L5', '30/60/90/120/150')
/
/* 15. Inserta un nuevo cliente con esa forma de pago. */

INSERT INTO CLIENTES
VALUES(179, 'IKOR', 'GARCIA', 'MANOLO', 'ZUHATZU KALEA', 'PLAZA DE LA MUSICA', 'ERREZIL', 20, 0, '521456201', 'L5', 151542354)
/
/* 16. Insertar un albaran con esa forma de pago y ese cliente. */

INSERT INTO ALBARANES
VALUES(176, 179, TO_DATE('02/05/1999', 'DD/MM/YYYY'), TO_DATE('02/07/1999', 'DD/MM/YYYY'), TO_DATE('02/08/1999', 'DD/MM/YYYY'), 'L5', 'S')
/
