'''
Created on 2019年11月25日

@author: lijianfei
'''
'''
pip install selenium
selenium支持8种定位方式
1、id
2.name
3.class name
4.tag name
5.link text
6.xpath
7.css selector
8.partial link text
'''
from selenium import webdriver
#加载浏览器的驱动
#如果浏览器的驱动目录加入了环境变量，
#driver=webdriver.Chrome()
driver=webdriver.Chrome("D:\Python\Python37\chromedriver.exe")
