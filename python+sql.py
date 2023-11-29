import mysql.connector
mayyadb = mysql.connector.connect(
    host = "localhost",
    user = "abc",
    password = "password"
)
mayya = mayyadb.cursor()
# mayya.execute("CREATE DATABASE if not exists sai")
# mayya.execute("CREATE TABLE if not exists sai.kiran(c1 int, c2 float, c3 VARCHAR(40))")
# mayya.execute("insert into sai.kiran values(1,2,'saikiran')")
# mayyadb.close()
# mayya.execute("SHOW DATABASES")
# for i in mayya:
#     print(i)
mayya.execute("insert into sai.kiran values(1,3.14,'sai')")
mayya.execute("select c1 from sai.kiran")
for i in mayya.fetchall():
    print(i)