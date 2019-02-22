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
/* 4. Crear la tabla lineasXXX a imagen de la tabla lineas insertando las filas correspondientes a los albaranes cargados en albaranesXXX. */


/* 5. Crear una tabla de nombre alba_tot_XX que este conformado por tres campos (num_alba, cuan_lin, tot_alba) que guarde el número de albaran, el número de líneas que contiene y el total calculado del albaran calculado a partir de sus líneas. */


/* 6. Actualizar en la tabla albaranesXXX la fecha de pago de los albaranes del mes de Abril y Mayo de 1988, con la fecha de hoy truncada. */


/* 7. Actualizar la tabla lineasXXX, de tal forma que incremente en todas sus filas, la cantidad de articulos vendidos en cien unidades, y su precio en mil. */


/* 8. Incrementar en un 5 por ciento el descuento de la líneas de albaran de la tabla lineasXXX, de aquellos albaranes que fueran de Enero de 1988. */


/* 9. Borrar de albaranesXXX aquellos que no contengan filas en líneasXXX. */

/* 10. Borrar de líneasXXX aquellas filas que pertenezcan a albaranes pagados (Estado=’S’). */


/* 11. Borrar todas las filas de albaranesXXX y lineasXXX sin tener luego posibilidad de rollback. */



/* 12. Insertar una nueva unidad de medida en la tabla de unidades. */


/* 13. Insertar un nuevo artículo para esa unidad. */

/* 14. Insertar una nueva forma de pago en la tabla formpagos. */

/* 15. Inserta un nuevo cliente con esa forma de pago. */

/* 16. Insertar un albaran con esa forma de pago y ese cliente. */
