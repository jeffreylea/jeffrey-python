'''
Created on 2019年11月29日

@author: lijianfei
'''
'''
python安装redis包：pip install redis
注意文件取名不要取redis.py,否则会报错
redis 初始安装没有密码，可以直接登录
redis-cli 命令即可登陆
config get requirepass 获取当前密码
config get requirepass -p 123456 设置当前密码 重启之后会设为默认
重新登录 redis-cli -h 127.0.0.1 -p 6379 -a 123456
redis 是一种高级的非关系型数据库，value支持5中数据类型：1、String，string可以存储string、int、float类型
2、list：表示有序列表，内容可以重复
3、set:元素无序，不可重复
4、hash：键值对存储，
5、sore set 有序字符串集合
'''
import redis
# con=redis.Redis(host='127.0.0.1',port=6379,password='123456')
# res=con.keys('*')
# print(res)

# redis_pool=redis.ConnectionPool(host='127.0.0.1',port=6379,password='123456')
# con1=redis.Redis(connection_pool=redis_pool)
# res1=con1.keys('*')
# print(res1)
class CRedisOP():
    def __init__(self,p):
        pass
    
    def test(self,ll):
        print(ll)
obj  = CRedisOP()
obj.test("hhh")