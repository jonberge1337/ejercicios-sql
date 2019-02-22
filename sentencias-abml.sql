/* 0.    Crea una tabla de nombre copiaprovincias a imagen de provincias pero sin filas. */

CREATE TABLE COPIA_PROVINCIAS
AS SELECT *
FROM PROVINCIAS
WHERE 1 = 0
/

SELECT *
FROM COPIA_PROVINCIAS
/

ROLLBACK
/
/* 1.    Inserta las filas de la tabla provincias en la tabla copiaprovincias. */

INSERT INTO COPIAPROVINCIAS
SELECT *
FROM PROVINCIAS
/
/* 2.    Borra la provincia de copiaprovincias de código 5. */

DELETE FROM COPIAPROVINCIAS
WHERE PROVINCIA = 5
/
/* 3.    Borra la provincia de Albacete de copiaprovincias. */

DELETE FROM COPIAPROVINCIAS
WHERE UPPER(DESCRIPCION) = 'ALBACETE'
/
/* a.     Compruébalo. */

SELECT *
FROM COPIAPROVINCIAS
WHERE UPPER(DESCRIPCION) = 'ALBACETE'
/
/* 4.    Actualiza la provincia de Guipuzcoa con el nombre de Gipuzkoa en la tabla copiaprovincias. */

UPDATE COPIAPROVINCIAS
SET DESCRIPCION = 'GIPUZKOA'
WHERE UPPER(DESCRIPCION) = 'GUIPUZCOA'
/
/* a.     Compruébalo. */

SELECT *
FROM COPIAPROVINCIAS
WHERE UPPER(DESCRIPCION) = 'GIPUZKOA' 
/
/* 5.    Actualiza de la provincia número 1, su prefijo a 949 y su descripción a Araba en la tabla creada. */

UPDATE COPIAPROVINCIAS
SET PREFIJO = 949, DESCRIPCION = 'ARABA'
WHERE PROVINCIA = 1
/
/* a.     Compruébalo. */

SELECT *
FROM COPIAPROVINCIAS
WHERE PROVINCIA = 1
/
/* 6.    Crea la tabla copiaclientes a imagen de la tabla clientes y con todas sus filas. */

CREATE TABLE COPIACLIENTES
AS SELECT *
FROM CLIENTES
/
/* a.     Compruébalo. */

SELECT *
FROM COPIACLIENTES
/
/* 7.    Borra de copiaclientes los clientes de la población de Barcelona y Badalona. */

DELETE FROM COPIACLIENTES
WHERE UPPER(POBLACION) IN('BARCELONA', 'BADALONA') 
/
/* 8.    Actualiza en la tabla copiaclientes la direccion2 con el valor de la direccion1. */

UPDATE COPIACLIENTES
SET DIRECCION2 = DIRECCION1
/
/* a.     Compruébalo. */

SELECT *
FROM COPIACLIENTES
WHERE DIRECCION1 != DIRECCION2
/
/* 9.    Borra de la tabla copiaprovincias aquellas que no aparezcan en la tabla copiaclientes. */

DELETE FROM COPIAPROVINCIAS
WHERE PROVINCIA NOT IN(SELECT PROVINCIA
                       FROM COPIACLIENTES)
/
/* a.     Compruébalo. */

SELECT *
FROM COPIAPROVINCIAS
WHERE PROVINCIA NOT IN(SELECT PROVINCIA
                       FROM COPIACLIENTES)
/
/* 10.  Actualiza los prefijos de todas las provincias de copiaprovincias a nulo. */

UPDATE FROM COPIAPROVINCIAS
SET PREFIJO = NULL
/
/* a.     Compruébalo. */

SELECT *
FROM COPIAPROVINCIAS
WHERE PREFIJO IS NOT NULL
/
/* 11.  Actualiza los prefijos de copiaprovincias con los prefijos correspondientes asignados en la tabla provincias. */

UPDATE FROM COPIAPROVINCIAS
SET PREFIJO = (SELECT PREFIJO
               FROM PROVINCIAS
               WHERE PROVINCIAS.PROVINCIA = COPIAPROVINCIAS.PROVINCIA)
/
/* a.     Compruébalo. */

SELECT *
FROM COPIAPROVINCIAS
WHERE PREFIJO NOT IN (SELECT PREFIJO
                      FROM PROVINCIAS
                      WHERE PROVINCIAS.PROVINCIA = COPIAPROVINCIAS.PROVINCIA) 
/
/* 12.  Crea la tabla copialbaranes a imagen de la tabla albaranes pero sin filas filas. */

CREATE TABLE COPIALBARANES
AS SELECT *
   FROM ALBARANES
   WHERE 1 = 0
/
/* preguntar lo de filas filas */
/* 13.  Inserta las filas de albaranes en copialbaranes del año 1988. */

INSERT INTO COPIALBARANES
SELECT *
FROM ALBARANES
WHERE TO_CHAR(FECHA_ALBARAN, 'YYYY') = '1988'
/
/* a.     Compruébalo. */

SELECT *
FROM COPIALBARANES
WHERE TO_CHAR(FECHA_ALBARAN, '1988') = '1988'
/
/* 14.  Actualiza la fecha de albarán de cada albarán de copia albaranes con la fecha de hoy truncada. */

UPDATE FROM COPIALBARANES
SET FECHA_ALBARAN = TRUNC(SYSDATE)
/
/* 15.  Borra los clientes de copiaclientes que no aparecen en copialbaranes. */

DELETE FROM COPIACLIENTES
WHERE CLIENTE NOT IN(SELECT CLIENTE
                     FROM COPIALBARANES
                     WHERE CLIENTES IS NOT NULL)
/
/* a.     Compruébalo. */

SELECT *
FROM COPIACLIENTES
WHERE CLIENTE NOT IN(SELECT CLIENTE
                     FROM COPIALBARANES)
/
