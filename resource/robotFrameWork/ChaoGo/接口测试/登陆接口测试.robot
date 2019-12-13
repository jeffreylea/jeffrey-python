*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           DatabaseLibrary

*** Variables ***
&{user}           account=admin    password=e10adc3949ba59abbe56e057f20f883e    target=0    grantType=password    # 登陆用户信息

*** Test Cases ***
登陆
    Create Session    api    http://localhost:8080
    ${re}    Get Request    api    /blocks/last
    Should Be Equal As Strings    ${re.status_code}    200
    log    ${re.content}

登陆测试
    ${dict}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    Create Session    api    http://retailcloud-gateway.10.110.25.75.xip.io    ${dict}
    ${data}    Create Dictionary    account=admin    password=e10adc3949ba59abbe56e057f20f883e    target=0    grantType=password
    ${re}    post request    api    /retailcloud-backend/login    data=${data}
    log    ${re.text}
    Should Be Equal    ${re.json()['code']}    000000
    log    ${re.json()['data']['accessToken']}

数据库连接测试
    Connect To Database Using Custom Params    pymysql    database='iscp', user='root', password='inspur123!@#', host='10.110.25.75', port=37894
    ${result}    query    select * from IVMP_LOCATION
    log    ${result}
    Disconnect From Database    # disconnects from current connection to the database
