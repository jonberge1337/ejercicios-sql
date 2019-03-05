import cx_Oracle

def leerSql(archivo):

    with open(archivo) as fichero:
        return fichero


f = open('tabledefinition.sql')
full_sql = f.read()
sql_commands = full_sql.split(';')

for sql_command in sql_commands:
    curs.execute(sql_command)


with open("subselect.sql") as f:
    for i in f:
        print(i)
