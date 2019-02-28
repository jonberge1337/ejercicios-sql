/* 1.    Crear para la tabla artículos lo siguiente: */

CREATE TABLE ARTICULOSXXX
AS SELECT *
FROM ARTICULOS
/
/* a)    Un índice sobre la columna descripción. */

CREATE INDEX I1_ARTICULOSXXX ON ARTICULOSXXX(DESCRIPCION)
/

DROP INDEX I1_DESCRIPCION
/
/* b)    Un índice por la columna artículo. */

CREATE INDEX I2_ARTICULOSXXX ON ARTICULOSXXX(ARTICULO)
/

/* c)    Un índice por la columna proveedor (desc). */

CREATE INDEX I3_ARTICULOSXXX ON ARTICULOSXXX(PROVEEDOR DESC)
/
 


 

/* 2.    Crear para la tabla clientes: */

CREATE TABLE CLIENTESXXX
AS SELECT *
FROM CLIENTES
/
/* a)    Un índice único por los campos apellidos y nombre. */

CREATE INDEX I1_CLIENTESXXX ON CLIENTES(APELLIDOS, NOMBRE)
/
 


 

/* 3.    Crear para la tabla albaranes: */

CREATE TABLE ALBARANESXXX
AS SELECT *
FROM ALBARANES
/
/* a)    Un índice por el campo fecha de albarán en modo descendente. */

CREATE INDEX I1_ALBARANESXXX ON ALBARANESXXX(FECHA_ALBARAN DESC)
/
/* b)    Un índice por el campo fecha de envío en modo descendente. */

CREATE INDEX I2_ALBARANESXXX ON ALBARANESXXX(FECHA_ENVIO DESC)
/
 


 

/* 4.    Crear para la tabla líneas: */

CREATE TABLE LINEASXXX
AS SELECT *
FROM LINEAS
/
/* a)    Un índice único por los campos albarán y línea. */

CREATE INDEX I1_LINEASXXX ON LINEASXXX(ALBARAN, LINEA)
/
/* b)    Un índice por los campos artículo y proveedor. */

CREATE INDEX I2_LINEASXXX ON LINEASXXX(ARTICULO, PROVEEDOR)
/

 


 

/* 5.    Borrar los índices definidos sobre la tabla artículos y clientes. */

DROP INDEX I1_ARTICULOSXXX
/

DROP INDEX I2_ARTICULOSXXX
/

DROP INDEX I3_ARTICULOSXXX
/

DROP INDEX I1_CLIENTESXXX
/
 
/* 6.    Crear una vista de nombre cli_barsa que contemple la información únicamente de los clientes de la provincia de Barcelona. */


 


 

/* 7.    Crear una vista de nombre top_albaran que contenga el código de albarán, fecha de envío e importe total de los albaranes del segundo semestre del 2000. */


 


 

/* 8.    Crea una vista de nombre <<art_facturado>>, compuesta por las columnas <<arti>>, <<prov>> y <<tot_lineas>> que calcule por cada artículo el importe vendido. */


 


 

/* 9.    Crear un sinónimo de nombre mis_prove para la tabla proveedores del usuario almacén. */


 


 

/* 10.  Crear un sinónimo público para la tabla albaránXX. */


 


 

/* 11.  Borrar los sinónimos creados. */
