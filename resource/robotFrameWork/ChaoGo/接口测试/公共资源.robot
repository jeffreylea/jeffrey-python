*** Settings ***
Library           String
Library           DateTime
Library           DatabaseLibrary

*** Variables ***
${base_url}       http://retailcloud-gateway.10.110.25.75.xip.io
&{login_info}     account=admin    password=e10adc3949ba59abbe56e057f20f883e    target=0    grantType=password    # 登陆用户名密码参数
&{mysqldb_info}    host=10.110.25.75    port=37894    database=iscp    username=root    password=inspur123!@#    # 测试环境mysqldb信息

*** Keywords ***
create_global_session
    [Arguments]    ${alias}    ${base_url}
    [Documentation]    获取全局session
    ${session}    Create Session    ${alias}    ${base_url}
    [Return]    ${session}    # 全局session

登陆
    ${dict}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    create_global_session    global_session    ${base_url}
    Comment    ${data}    Create Dictionary    account=${login_info}['account']    password=${login_info}['password']    target=0    grantType=password
    ${response}    post request    global_session    /retailcloud-backend/login    data=${login_info}    headers=${dict}
    Comment    #通过http状态码检查被测环境是否正常运行
    Run Keyword If    ${response.status_code}==${401}    fatal error    权限认证失败，请找开发确认
    log    ${response.text}
    Should Be Equal    ${response.json()['code']}    000000
    ${token_headers}    Create Dictionary    authorization=Bearer ${response.json()['data']['accessToken']}
    [Return]    ${token_headers}

生成随机字符串
    [Arguments]    ${prefix}=${EMPTY}    ${length}=4
    ${random_string}    generate random string    ${length}    [NUMBERS]
    ${totle_random_string}    catenate    SEPARATOR=_    ${prefix}    ${random_string}
    [Return]    ${totle_random_string}    # 返回随机字符串

获取指定日期
    [Arguments]    ${increment}=0    ${date_formate}=%Y-%m-%d %H:%M:%S    ${exclude_millis}=False    # 增加时间|日期显示格式|是否包括毫秒部分
    [Documentation]    ${increment}=0 | ${date_formate}=%Y-%m-%d %H:%M:%S | ${exclude_millis}=False \ # 增加时间|日期显示格式|是否包括毫秒部分
    ${date}    get current date    increment=${increment}    result_format=${date_formate}    exclude_millis=${exclude_millis}
    [Return]    ${date}
