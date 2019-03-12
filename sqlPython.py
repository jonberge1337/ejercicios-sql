import cx_Oracle


def leerSql(archivo):

    con = cx_Oracle.connect('almacen1/almacen1@localhost/xe')
    cur = con.cursor()
    with open(archivo) as f:
        sql = f.read()
        sqlSentencias = sql.split("/")
        for sentencia in sqlSentencias:
            cur.execute(sentencia)
            for linea in cur:
                print(linea)
    cur.close()
    con.close()


def main():
    print("""
            A continuacion elige una opcion para ejecutar:
            1- altas
            2- bajas
            3- consultas
            """)
    try:
        opcion = int(input("tu opcion elige un numero del menu: "))
    except ValueError:
        opcion = 0

    while opcion not in [1, 2, 3]:
        try:
            opcion = int(input("opcion invalida recuerda 1, 2 o 3: "))
        except ValueError:
            opcion = 0

    if opcion == 1:
        leerSql("altas.sql")
    elif opcion == 2:
        leerSql("bajas.sql")
    else:
        leerSql("consultas.sql")


if __name__ == "__main__":
    main()
