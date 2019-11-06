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
**python语法采取缩进方式**

