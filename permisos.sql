/* 1. ¿Qué permiso del sistema necesita vuestro usuario para crear roles? */
CREATE ROLE mi_rol
/
/* 2. ¿Qué usuario debe dárselo? */
SYSTEM
/
/* 3. ¿Y cuál sería la sentencia de asignación correspondiente? */
GRANT CREATE ROLE TO USUARIO2
/
/* 4. Como usuario almacen, crea un rol de nombre mi_rol_tablasXX. */
CONNECT ALMACEN1/ALMACEN1@XE
/
CREATE ROLE MI_ROL_TABLASXX
/
/* 5. Asigna a dicho rol los permisos de lectura sobre todas tus tablas. */
/* SPOOL NOS EJECUTA TODO EL ARCHIVO Y CAPTURA TODA LA SALIDA */
SPOOL TABLAS.SQL
SELECT *
FROM USER_TABLES
/
SPOOL OFF

/* ED NOS ABRE EL ARCHIVO LUEGO HAY QUE QUITAR LA BASURA GENERADA CON SPOOL */
ED TABLAS.SQL
START TABLAS.SQL

GRANT SELECT ON TABLAS.SQL TO MI_ROL_TABLASXX
/
/* 6. Añade a dicho rol el permiso de inserción sobre la tabla provincias. */
GRANT INSERT ON PROVINCIAS TO MI_ROL_TABLASXX
/
/* 7. Añade a dicho rol el permiso de borrado sobre la tabla formpagos. */
GRANT DELETE ON FORMPAGOS TO MI_ROL_TABLASXX
/
/* 8. Añade a dicho rol el permiso de actualización sobre la tabla clientes. */
GRANT UPDATE ON CLIENTES TO MI_ROL_TABLASXX
/
/* 9. Suprime a dicho rol el permiso de lectura sobre la tabla unidades. */
REVOKE SELECT ON UNIDADES FROM MI_ROL_TABLASXX
/
/* 10. Añade a dicho rol todos los permisos sobre las tablas líneas y albaranes. */
GRANT ALL ON LINEAS, ALBARANES TO MI_ROL_TABLASXX
/
/* 11. Asigna dicho rol a todos los usuarios de la base de datos. */
GRANT MI_ROL_TABLASXX TO PUBLIC
/
/* 12. Suprime dicho rol a todos los usuarios de la base de datos. */
REVOKE MI_ROL_TABLASXX FROM PUBLIC
/
/* 13. Crea un usuario de nombre otrousu. ¿Con que usuario lo debes crear? */
CONNECT SYSTEM/MANAGER@XE
/

CREATE USER otrousu IDENTIFIED BY otrousu
/
/* 14. Asígnale el role CONNECT y el RESOURCE. */
GRANT CONNECT, RESOURCE TO OTROUSU
/
/* 15. Como usuario almacen asigna el rol creado anteriormente a otrousu. */
CONNECT ALMACEN1/ALMACEN1@XE
/

GRANT MI_ROL_TABLASXX TO OTROUSU
/
/* 16. Siendo el usuario sys. ¿Asigna al usuario otrousu el rol del sistema que te permita ser usuario administrador? */
CONNECT SYS as sysdba
/* password */
manager
/

GRANT DBA TO OTROUSU
/
/* 17. Suprime a dicho usuario el privilegio del sistema que te permite conectarte a la base de datos. */
REVOKE DBA FROM OTROUSU
/
/* 18. Suprime al usuario los privilegios del sistema que te permite crear tablas y vistas. */
REVOKE CREATE TABLE, CREATE VIEW FROM OTROUSU
/
/* 19. Vuelve a asignar los tres permisos recién suprimidos al usuario. */
GRANT CREATE TABLE, CREATE VIEW TO OTROUSU
/
/* 20. Conectado con el usuario almacen a la base de datos: */
CONNECT almacen1/almacen1@XE
/

/* 21. Visualiza a que usuarios has asignado el rol mi_rol_tablasXX. */
SELECT *
FROM USER_ROLE_PRIVS
/
/* 22. Suprime la asignación de dicho rol a los usuarios. */
REVOKE MI_ROL_TABLASXX FROM PUBLIC
/
/* 23. Visualiza los permisos asociados al rol mi_rol_tablasXX. */
SELECT *
FROM DBA_SYS_PRIVS
/
/* 24. Suprime dichos permisos sobre el rol. */
REVOKE ALL ON MI_ROL_TABLASXX FROM PUBLIC
/* 25. Borra el rol. */
DROP ROLE MI_ROL_TABLASXX
/
