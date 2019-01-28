-- 1 ========================================
SELECT CLIENTE, EMPRESA
FROM CLIENTES
WHERE UPPER(FORMPAGO) = 'C'
/

-- 2 ========================================
SELECT ALBARAN
FROM ALBARANES
WHERE FECHA_ALBARAN BETWEEN TO_DATE('1/1/1988', 'DD/MM/YYYY') AND 
	TO_DATE('31/03/1988', 'DD/MM/YYYY')
/

-- 3 ========================================
SELECT ARTICULO, PROVEEDOR, DESCRIPCION
FROM ARTICULOS
WHERE DESCRIPCION LIKE 'A%' OR DESCRIPCION LIKE 'D%' OR DESCRIPCION LIKE 'W%'
/

-- 4 ========================================
SELECT ARTICULO, PROVEEDOR
FROM ARTICULOS
WHERE UPPER(DESCRIPCION) LIKE 'SUPER%' AND EXISTENCIAS > 50
/

-- 5 ========================================
SELECT ARTICULO, PROVEEDOR
FROM ARTICULOS
WHERE PR_COST * 2 < PR_VENT
/

-- 6 ========================================
SELECT PROVINCIA
FROM PROVINCIAS
WHERE UPPER(DESCRIPCION) LIKE '__LEN%'
/

-- 7 ========================================
SELECT PROVEEDOR
FROM PROVEEDORES
WHERE LENGTH(NOMBRE) > 6 AND DIRECCION2 IS NULL
/

-- 8 ========================================
SELECT ARTICULO, PROVEEDOR
FROM ARTICULOS
WHERE PR_VENT BETWEEN 40000 AND 70000 AND PR_VENT - 30000 > PR_COST
/

-- 9 ========================================
SELECT DISTINCT UNIDAD
FROM ARTICULOS
/

-- 10 =======================================
SELECT ALBARAN
FROM ALBARANES
WHERE FECHA_PAGO > FECHA_ENVIO
/

-- 11 =======================================
SELECT ALBARAN
FROM ALBARANES
WHERE FECHA_ALBARAN > TO_DATE('1/10/1988', 'DD/MM/YYYY')
/

-- 12 =======================================
SELECT FORMPAGO
FROM ALBARANES
WHERE FECHA_PAGO BETWEEN TO_DATE('01/05/1988', 'DD/MM/YYYY') AND
						TO_DATE('31/06/1988', 'DD/MM/YYYY')
/

-- 13 =======================================
SELECT DISTINCT TO_CHAR(FECHA_PAGO, 'YYYY')
FROM ALBARANES
/

-- 14 =======================================
SELECT ALBARAN, FECHA_ALBARAN
FROM ALBARANES
WHERE MOD(TO_NUMBER(TO_CHAR(FECHA_ALBARAN, 'MM')), 2) != 0
/

-- 15 =======================================
SELECT ARTICULO, PROVEEDOR
FROM ARTICULOS
WHERE ADD_MONTHS(FEC_ULT_ENT, 3) < FEC_ULT_SAL 
/

-- 16 =======================================
SELECT COUNT(*)
FROM CLIENTES
WHERE UPPER(POBLACION) IN('MADRID')
/

-- 17 =======================================
SELECT SUM(PRECIO)
FROM LINEAS
/

-- 18 =======================================
SELECT MIN(PR_VENT), MAX(PR_VENT)
FROM ARTICULOS
WHERE DESCRIPCION IS NOT NULL
/