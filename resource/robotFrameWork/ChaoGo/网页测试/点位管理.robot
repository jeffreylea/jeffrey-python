*** Settings ***
Library           Selenium2Library    timeout=30

*** Test Cases ***
登陆
    log    登陆测试
    Open Browser    http://ivmp-webapp.10.110.25.75.xip.io/    gc
    sleep    2 s
    log    成功打开页面
    Click Button    xpath: //*[@id="app"]/div/div[2]/div[2]/form/div[5]/button
    Input Text    xpath: //*[@id="app"]/div/div[2]/div[2]/form/div[2]/div/div/input    admin
    Input Text    xpath: //*[@id="app"]/div/div[2]/div[2]/form/div[3]/div/div/input    123456
    Wait Until Page Contains    验证成功
    log    手动验证成功
    sleep    1s
    Click Element    xpath: //*[@id="app"]/div/div[2]/div[2]/form/div[5]
    log    登陆成功
    Maximize Browser Window

点位查询_01_名称查询
    Wait Until Page Contains    点位管理
    Scroll Element Into View    xpath: //*[@id="app"]/div/div[1]/div/div[2]/div[1]/ul/li[14]/span
    Click Element    xpath://*[@id="app"]/div/div[1]/div/div[2]/div[1]/ul/li[14]/span
    Wait Until Page Contains Element    xpath://*[@id="app"]/div/div[2]/div[2]/div[1]/div/form/div[2]/div/input
    input text    xpath://*[@id="app"]/div/div[2]/div[2]/div[1]/div/form/div[2]/div/input    财务部子组织
    Click Element    xpath://*[@id="app"]/div/div[2]/div[2]/div[1]/div/div/div[2]/button[1]/span
    sleep    1s
    Capture Page Screenshot
    #选择查询条件
    Wait Until Page Contains Element    xpath://*[@id="app"]/div/div[2]/div[2]/div[1]/div/div/div[1]/div/div[2]/span/span/i
    Click Element    xpath://*[@id="app"]/div/div[2]/div[2]/div[1]/div/div/div[1]/div/div[2]/span/span/i
    Click Element    xpath:/html/body/div[4]/div[1]/div[1]/ul/li[3]
    Click Element    xpath:/html/body/div[4]/div[1]/div[1]/ul/li[3]
    Click Element    xpath:/html/body/div[4]/div[1]/div[1]/ul/li[4]
    Click Element    xpath:/html/body/div[4]/div[1]/div[1]/ul/li[5]
    Click Element    xpath:/html/body/div[4]/div[1]/div[1]/ul/li[6]
    Click Element    xpath://*[@iwaid="app"]/div/div[2]/div[2]/div[1]/div/div/div[1]/div/div[2]/span/span/i
    input text    xpath://*[@id="app"]/div/div[2]/div[2]/div[1]/div/form/div[3]/div/input    测试
    Click Element    xpath://*[@id="app"]/div/div[2]/div[2]/div[1]/div/div/div[2]/button[1]/span
    sleep    1s
    Capture Page Screenshot
