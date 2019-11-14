学习robotFramework  
资料  
https://www.jianshu.com/p/c3a9d20db4e5
https://www.cnblogs.com/leozhanggg/p/9643180.html
https://www.cnblogs.com/yigui/p/8687109.html
安装pip工具  
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py   # 下载安装脚本
python get-pip.py    # 运行安装脚本
pip和setuptools的安装  
python2.7.9以上是自带pip的，但如果没有pip可以手动安装。  
https://pypi.python.org/pypi/setuptools 
https://pypi.python.org/pypi/pip
安装 robotframework  
pip install robotframework
中间出现错误，提示没有对应的robotframework，因为我安装的python版本是python2.7.2，没有自带的pip，可能由于版本不对。后来换成python2.7.19版本才安装成功。

1.安装python2.7.19  
https://www.python.org/downloads/windows/
2.安装robotFramework  
pip install robotframework
3.安装robotframework-selenium2library  
pip install  robotframework-selenium2library

下载Chrome驱动，
4. 打开ride，运行ride.py,弹出图形界面
5.简单运行案例  
https://blog.csdn.net/weixin_34088838/article/details/93893078

6.log关键字 在 robot Framework 中通过“Set variable”关键字来定义变量

+ Robot Framework Run运行界面，没有打印出日志  
用例执行完，run界面执行完，日志没有打印东西，report和log也不能点击，这是因为浏览器驱动没有关闭导致
https://www.jianshu.com/p/0b9207d2c882

+ 自动化测试工具  
https://blog.csdn.net/qq_36396763/article/details/97944411

+ 标准库是Robot Framework可以直接导入使用的库，包含以下几类：  
https://www.cnblogs.com/yrxns/p/6676645.html
Screenshot、Remote、Collections

https://www.cnblogs.com/pachongshangdexuebi/p/7112347.html

