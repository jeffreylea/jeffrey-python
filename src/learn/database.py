'''
Created on 2019年11月22日

@author: lijianfei
'''
# 安装pymysql模块 pip intall pymysql
import pymysql
#连接database
conn=pymysql.connect(host='127.0.0.1', user = "root", passwd="admin", db="leaf", port=3306, charset="utf8")
#得到可以执行sql语句的光标对象，可以理解为激活数据库
cursor=conn.cursor()
#定义sql语句
sql_select="select * from aa"
#执行sql语句
re=cursor.execute(sql_select)
print("查询aa表结果：",re)
print("查询aa表结果：",cursor.fetchall())
#插入一条数据
sql_insert="insert into aa (name) values (8)"
try:
    re=cursor.execute(sql_insert)
    #写操作时要提交
    conn.commit()
except:
    #发生错误时回滚
    conn.rollback()

re=cursor.execute(sql_select)
print("插入一条数据后重新查询：",re)
print("插入一条数据后重新查询：",cursor.fetchall())

sql_update="update aa set id=10 where name='8'"
try:
    cursor.execute(sql_update)
    conn.commit()
except:
    conn.rollback()
re=cursor.execute(sql_select)

print("修改成功重新查询：",re)
print("修改成功重新查询：",cursor.fetchall())

#删除时name是字符串要加上引号
sql_delete="delete from aa where name='8'"
try:
    cursor.execute(sql_delete)
    conn.commit()
    print("执行删除操作成功")
except Exception as e:
    print(e)
    conn.rollback()
    
re=cursor.execute(sql_select)
print("删除后重新查询结果：",re)
print("删除后重新查询结果：",cursor.fetchall())
# 关闭光标对象
cursor.close()
#关闭连接
conn.close

