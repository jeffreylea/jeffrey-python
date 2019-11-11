#!/usr/bin/env python3
# -*- coding: utf8 -*-
'this is python'

__author__="jeffrey"
#print("hello,world");
'''
print("hello","world");
print(100+20);
'''
# name=input()
# print("hello,",name)
# print(1024*768)
# PI = 3.1415926
# print(PI)
# print(10/6)
# print(10//6)
# print(10%6)
# print('qq')
from builtins import input
       
# print(ord('李'))//26446
# print(chr(26446))
# print(b'ww')
# print("ww".encode("ascii"))
# print("中文".encode("utf-8"))
# print(b'\xe4\xb8\xad\xe6\x96\x87'.decode("utf-8"))
# print("hello,%s,年龄：%d" % ("dafei",24))
# print('%2d-%02d' % (100,3))
# print('uu{0},oo{1}' .format(10, 11))
# list = [1,2,3]
# print(list)
# print(len(list))
# print(list[1]+list[2])
# print(list[len(list)-1])
# list.append(5)
# print(list)
# list.insert(2, 7)
# print(list)
# list.pop(2)
# print(list)
# list.pop()
# print(list)
# list.append("jeff")
# print(list)
# list1 = list.copy();
# list.append(list1)
# print(list)
# list.append(list)
# print(list)
#a = input();
# if a>'20':
#     print("you are adult")
#     
# elif a=='20':
#     print("you are 20")
# else:
#     print("you are too young")
# h = float(input())
# print(h)
# w = float(input())
# print(w)
# bmi = (w/(h*h))
# print(bmi)
# if bmi<18.5:
#     print("过轻")
# elif 25<bmi>=18.5:
#      print("正常")
# elif 28<bmi>=25:
#     print("过重")
# elif 32<bmi<=28:
#     print("肥胖")
# else:
#     print("严重肥胖")
# print(list(range(100)))
# sum = 0
# for i in range(101):
#     sum +=i
# print(sum)

# sum1 = 0
# n =0
# while 3>1:
#     sum1=sum1+n
#     n=n+1
# print(sum1)


# def triangles(max):
#     N=[1]
#     n=0
#     while n<max:
#         print(N)        #generator函数与普通函数的差别：在执行过程中，遇到yield就中断，下次又继续执行
#         N.append(0)
#         N=[N[i-1] + N[i] for i in range(len(N))]  #写法
#         n=n+1
# N=[1,2,1,0]
# print(N[-1])
# N=[N[i-1] + N[i] for i in range(len(N))]  #写法       
# # triangles(6)   
# 
# print(N)  
#    
# n = 0
# results = []
# for t in triangles():
#     results.append(t)
#     n = n + 1
#     if n == 3:
#         break
# 
# for t in results:
#     print(t)
from functools import reduce
# def charToNum(str):
#     return int(str)
# print(charToNum("1234"))

def charToNumber(s):
    def charToNum(str):
        return int(str)
    def numToNumber(x,y):
        return x+y
    return reduce(numToNumber,list(map(charToNum,s)))
def charToNum(str):
        return int(str)
s="123456"
print(list(map(charToNum,s)))

def normalize(name):
    name.lower()
    name[0].upper()
    return name[0]
print(normalize("jeffrey"))

print(normalize.__name__)
