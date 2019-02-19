/* 53. Construir una tabla derivada compuesta por los nombres de empresa, de clientes y de proveedores con sus respectivas direcciones, distritos y descripción de provincia. */
/* Ordenarlo para que primero salgan los clientes y luego los proveedores, ordenados por empresa. */
SELECT PROVEEDOR, EMPRESA, APELLIDOS, NOMBRE
FROM PROVEEDORES
UNION ALL
SELECT CLIENTE, EMPRESA, APELLIDOS, NOMBRE
FROM CLIENTES
/* order by al poner proveedor saca al poner cliente falla y las dos a la vez tambien falla */
ORDER BY 2
/

/* 54. Obtener por cada descripción de provincia el nº de clientes y de proveedores que contiene. */
/* Ordenar para que salgan primero el nº de proveedores descendentemente y luego los clientes de la misma forma. */
  
/* 55. Obtener la tabla derivada que obtenga los nombres de las provincias que tengan más de 5 clientes y las que tengan más de 2 proveedores. */
/* Ordenarlo por nº de clientes o proveedores de forma descendente. */
  
/* 56. Mostrar las provincias que tienen igual nº de clientes que de proveedores. */
/* (Incluir los que tienen cero clientes y cero proveedores) */
  
/* 57. Sin cláusula INTERSECT. */
  
/* 58. Mostrar los clientes, con su empresa, población, provincia y forma de pago exceptuando aquellos que tengan realizada alguna compra y además la forma de pago que tienen asignada por defecto no coincida con alguna forma de pago existente entre sus albaranes. */
