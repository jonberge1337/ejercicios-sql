f = open('tabledefinition.sql')
full_sql = f.read()
sql_commands = full_sql.split(';')

for sql_command in sql_commands:
    curs.execute(sql_command)
