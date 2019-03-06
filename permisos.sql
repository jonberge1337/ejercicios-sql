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
SPOOL TABLAS.SQL
SELECT *
FROM USER_TABLES
/
SPOOL OFF

ED TABLAS.SQL
START TABLAS.SQL

GRANT SELECT TABLAS.SQL TO MI_ROL_TABLASXX
/
/* 6. Añade a dicho rol el permiso de inserción sobre la tabla provincias. */
GRANT INSERT PROVINCIAS TO MI_ROL_TABLASXX
/
/* 7. Añade a dicho rol el permiso de borrado sobre la tabla formpagos. */
GRANT 
/* 8. Añade a dicho rol el permiso de actualización sobre la tabla clientes. */
/* 9. Suprime a dicho rol el permiso de lectura sobre la tabla unidades. */
/* 10. Añade a dicho rol todos los permisos sobre las tablas líneas y albaranes. */
/* 11. Asigna dicho rol a todos los usuarios de la base de datos. */
/* 12. Suprime dicho rol a todos los usuarios de la base de datos. */
/* 13. Crea un usuario de nombre otrousu. ¿Con que usuario lo debes crear? */
/* 14. Asígnale el role CONNECT y el RESOURCE. */
/* 15. Como usuario almacen asigna el rol creado anteriormente a otrousu. */
/* 16. Siendo el usuario sys. ¿Asigna al usuario otrousu el rol del sistema que te permita ser usuario administrador? */
/* 17. Suprime a dicho usuario el privilegio del sistema que te permite conectarte a la base de datos. */
/* 18. Suprime al usuario los privilegios del sistema que te permite crear tablas y vistas. */
/* 19. Vuelve a asignar los tres permisos recién suprimidos al usuario. */
/* 20. Conectado con el usuario almacen a la base de datos: */

/* 21. Visualiza a que usuarios has asignado el rol mi_rol_tablasXX. */
/* 22. Suprime la asignación de dicho rol a los usuarios. */
/* 23. Visualiza los permisos asociados al rol mi_rol_tablasXX. */
/* 24. Suprime dichos permisos sobre el rol. */
/* 25. Borra el rol. */
