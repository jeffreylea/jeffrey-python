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
import math

# print(ord('李'))//26446
# print(chr(26446))
# print(b'ww')
# print("ww".encode("ascii"))
# print("中文".encode("utf-8"))
# print(b'\xe4\xb8\xad\xe6\x96\x87'.decode("utf-8"))
# print(abs(-1))
# print(max(1,2, 3))
# print(min(1,2,3,4))
# a=float
# print(a(1))
# print(hex(16))
# def abs1(x):
#     if x>=0:
#         return x
#     else:
#         return -x
# print(abs1('a'))
# print(abs('b'))
# 
# def noneF(x):
#     pass
# def quadratic(a, b, c):
#     x1=(-b+math.sqrt(b*b-4*a*c))/(2*a)
#     x2=(-b-math.sqrt(b*b-4*a*c))/(2*a)
#     return x1,x2
# print(quadratic(1, 2, 1))
# def my_function(a,**b):
#     print("a=",a,"b=",b)
# # my_function("qw",c="ff")
# d = {"c":"gg"}
# my_function("qw",**d)
# def fact(n):
#     if n==1:
#         return 1
#     return n*fact(n-1)
# print(fact(200))

print(x * x for x in range(1, 11) if x % 2 == 0)