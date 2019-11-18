'''
Created on 2019年11月18日

@author: lijianfei
'''
import requests
re = requests.get("https://api.github.com/events")
print(re.text)