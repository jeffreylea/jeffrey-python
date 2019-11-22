'''
Created on 2019年11月18日

@author: lijianfei
'''
import requests
re = requests.get("https://api.github.com/events")
# print(re.status_code)#打印状态码
# print(re.url)#打印请求的url
# print(re.headers)#打印头信息
# print(re.content)#以字节流形式打印
# print(re.text)#以文本形式打印
#print(re.cookies)#打印cookies信息
print(re.json())#response.json()方法同json.loads(response.text)
with open('F://fengjing.txt','wb') as f:
    f.write(re.content)