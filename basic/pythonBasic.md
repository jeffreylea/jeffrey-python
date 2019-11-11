**资料列表**  
[python在线手册](http://docs.pythontab.com)   
[廖雪峰 Python教程](https://www.liaoxuefeng.com/wiki/1016959663602400/1017032074151456)

**hello world**
print()方法
**python 注释**
单行注释#号标注  
多行注释需要三对引号，单引号双引号都行
**用户输入**
input()

常量：用全部大写名表示常量，例如PI
除法：/计算结果是浮点数 //地板除，结果是整数  %余数运算 
编码：python3中字符串以Unicode编码，因此python的字符串支持多语言。python中提供了ord()函数获取字符的整数表示，chr()函数把编码转化对应的字符。bytes类型的数据用带b的单引号或双引号表示。使用encode()函数把字符串转为bytes类型，decode（）函数把bytes类型转为字符串类型。len函数计算字符的长度。
当python解释器读取源码时，为了让它以utf8的编码读取，通常在文件开头加上两行：  
#！/usr/bin/env python3  
# -*- coding:utf-8 -*-  
第一行告诉系统这是一个python可执行程序，windows会忽略，第二行告诉解释器按照utf8的编码读取，否则可能出现乱码  
**格式化：使用%和format()函数格式化**  
占位符	替换内容
%d	整数
%f	浮点数
%s	字符串
%x	十六进制整数  
**list和tuple**  
list是一个可变的有序表，可以往list中追加元素。apend()方法追加元素，insert()方法插入元素，pop()方法删除最后一个元素，pop(i)删除指定元素，list中的数据类型可以不同;tuple是元组，tuple是不可变的。只有一个元素的tuple在定义是需要加上，号，如：t = (2,)
**循环**  
1.for in 循环
2.while 循环
**dict和set**  
dict相当于java中的map
**python语法采取缩进方式**

生成器：一边循环一边计算的机制
hex函数将数转为16进制;
用pass定义空函数;
python函数返回多值本质是返回一个tuple;
默认参数必须指向不变对象；
*nums表示把nums这个list中的所有元素作为可变参数传进去。
**nums关键字参数，自动组装成dict;
切片符号（：）
迭代：用for in完成迭代
列表生成式：把生成的元素放在循环前面
