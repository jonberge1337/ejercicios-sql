/* INDICES */
CREATE INDEX I1_CLIENTES ON CLIENTES(APELLIDOS, NOMBRE)
/

DROP INDEX I1_CLLIENTES
/

CREATE INDEX I1_CLIENTES ON CLIENTES(APELLIDOS DESC, NOMBRE DESC)
/

/* VISTAS */
CREATE VIEW CLI_MADRID
AS SELECT *
FROM CLIENTES
WHERE EXISTS (SELECT *
              FROM PROVINCIAS
              WHERE PROVINCIAS.PROVINCIA = CLIENTES.PROVINCIA
                AND UPPER(DESCRIPCION) = 'MADRID')
/

INSERT INTO EJEMPLO
VALUES (___________)
CREATE VIEW EJEMPLO
AS SELECT A.*, B.*, C.*
FROM A, B, C
/