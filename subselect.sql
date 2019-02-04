/* 21. Seleccionar los artículos cuyas existencias en almacén sean de menor cantidad, entre los que tienen existencias (no nulo). */

SELECT ARTICULO, PROVEEDOR, EXISTENCIAS
FROM ARTICULOS
WHERE EXISTENCIAS IS NOT NULL AND EXISTENCIAS = (SELECT MIN(EXISTENCIAS) FROM ARTICULOS)
/
/* 22. Seleccionar los artículos cuyo precio de costo sea inferior al precio de todos los artículos vendidos. */

SELECT ARTICULO, PROVEEDOR, PR_COST
FROM ARTICULOS
WHERE PR_COST < ALL(SELECT MIN(PRECIO) FROM LINEAS)
/
/* 23. Seleccionar los artículos que más beneficios nos proporcione su venta, así como dicho beneficio. */

SELECT ARTICULO, PROVEEDOR, PR_VENT - PR_COST "BENEFICIO MAXIMO"
FROM ARTICULOS
WHERE PR_VENT - PR_COST = (SELECT MAX(PR_VENT - PR_COST) FROM ARTICULOS)
/
/* 24. Obtener los clientes que posean los albaranes con fecha de pago más reciente. */


/* 25. Obtener los proveedores cuyos artículos tienen el mayor margen de existencias en el almacén (existencias – bajo_mínimo), dentro de los que pertenecen a las provincias que terminan con la letra D. */


/* 26. Seleccionar los proveedores que pertenezcan a alguna provincia que empiece por la letra G que a su vez contenga algún cliente con forma de pago al contado. */


/* 27. Obtener las provincias que tienen clientes y proveedores. */


/* 28. Presentar la lista de clientes que han realizado alguna compra que no pertenecen a ninguna provincia que empiece por ‘M’. */


/* 29. Mostrar los clientes que no hayan pagado al contado sus pedidos en el mes de marzo de 1988. */


/* 30. Mostrar los clientes que tengan alguna compra con forma de pago diferente a la que tienen asignada por defecto. */

 

/* 31. Mostrar los albaranes que no posean líneas. */


/* 32. Seleccionar los clientes que contengan los albaranes en el 1er trimestre de 1988. */


/* 33. Seleccionar las provincias que no posean clientes. */


/* 34. Seleccionar las provincias que posean clientes sin albaranes. */


/* 35. Obtener las provincias que contienen clientes y proveedores. */


/* 36. Obtener las provincias con clientes y con proveedores que nos suministren algún artículo. */



/* 37. Obtener las provincias que contengan todas las formas de pago entre todos sus clientes. */

/*  38. Seleccionar los proveedores que tengan entre sus articulos todas las unidades de medida. */
