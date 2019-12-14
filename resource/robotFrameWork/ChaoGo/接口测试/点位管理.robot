*** Settings ***
Library           RequestsLibrary
Resource          公共资源.robot
Library           String
Library           DateTime
Library           Collections
Library           DatabaseLibrary

*** Variables ***
${location_list}    /retailcloud-backend/location/list    # 点位查询接口
${location_save}    /retailcloud-backend/location/save    # 点位保存接口
${location_delete}    /retailcloud-backend/location/delete    # 点位删除接口
${location_queryById}    /retailcloud-backend/location/queryById

*** Test Cases ***
点位查询接口test
    [Tags]    location
    ${dict}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${session}    Create Session    api    http://retailcloud-gateway.10.110.25.75.xip.io    ${dict}
    ${data}    Create Dictionary    account=admin    password=e10adc3949ba59abbe56e057f20f883e    target=0    grantType=password
    ${re}    post request    api    /retailcloud-backend/login    data=${data}
    log    ${re.text}
    Should Be Equal    ${re.json()['code']}    000000
    log    ${re.json()['data']['accessToken']}
    ${dict}    Create Dictionary    Content-Type=application/x-www-form-urlencoded    Content-Type=application/x-www-form-urlencoded
    ${headers}    Create Dictionary    authorization=Bearer ${re.json()['data']['accessToken']}
    Create Session    api    http://retailcloud-gateway.10.110.25.75.xip.io    ${dict}
    ${data}    Create Dictionary    limit=10    offset=0
    ${re}    post request    api    /retailcloud-backend/location/list    data=${data}    headers=${headers}

点位查询_01_正常查询
    ${token_headers}    登陆
    log    ${token_headers}
    ${data}    Create Dictionary    limit=10    offset=0    locationName=jeffrey    provinceId=112937193034481664    cityId=113338335786696704
    ...    districtId=113353656107008000
    ${response}    post request    global_session    ${location_list}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Integers    ${response.json()['code']}    000000

点位查询_02_用户未登录查询
    create_global_session    global_session    ${base_url}
    ${data}    Create Dictionary    limit=10    offset=0    locationName=jeffrey    provinceId=112937193034481664    cityId=113338335786696704
    ...    districtId=113353656107008000
    ${response}    post request    global_session    ${location_list}    data=${data}
    log    ${response.text}
    Should Be Equal As Integers    ${response.json()['code']}    600001    #无对应的token传入

点位查询_03_用户token过期查询
    create_global_session    global_session    ${base_url}
    ${data}    Create Dictionary    limit=10    offset=0    locationName=jeffrey    provinceId=112937193034481664    cityId=113338335786696704
    ...    districtId=113353656107008000
    ${token_headers}    Create Dictionary    authorization=Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NDA2ODYxNn0.b-dSfXWQ3BMOziThkrsq2HFehEkTOGiAK9ZsHsmGMSm6D1H8xfz3w4WPaNCU68OfOPCrb80fRM7eeRvhpFOLCw
    ${response}    post request    global_session    ${location_list}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Integers    ${response.json()['code']}    600002    #token过期

点位查询_04_主键查询
    [Tags]    location
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    #为点位主键查询添加数据
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=jeffrey-ceshi    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    log    ${response.json()['data']['locationId']}
    log    点位${response.json()['data']['locationId']}添加成功
    #点位主键查询
    ${data}    Create Dictionary    locationId=${response.json()['data']['locationId']}
    ${response_queryById}    get request    global_session    ${location_queryById}    params=${data}    headers=${token_headers}
    log    ${response_queryById.text}
    Should Be Equal As Strings    ${response_queryById.json()['code']}    000000
    #将新增的数据删除
    ${location_delete_data}    Create Dictionary    ids=${response.json()['data']['locationId']}
    ${location_delete_response}    post request    global_session    ${location_delete}    data=${location_delete_data}    headers=${token_headers}
    log    ${location_delete_response.text}
    Should Be Equal As Strings    ${location_delete_response.json()['code']}    000002
    log    点位${response.json()['data']['locationId']}删除成功

点位新增/修改/删除_01_正常点位新增
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    ${data}    Create Dictionary
    #参数必输性验证
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    A20001
    #点位名称重复测试
    Set To Dictionary    ${data}    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=财务部子组织    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    M00032
    #正常添加点位信息
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=jeffrey-ceshi修改    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    log    ${response.json()['data']['locationId']}
    log    点位${response.json()['data']['locationId']}添加成功
    #点位修改-名称修改
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=jeffrey-ceshi修改测试    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1    locationId=${response.json()['data']['locationId']}
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    #点位删除
    ${location_delete_data}    Create Dictionary    ids=${response.json()['data']['locationId']}
    ${location_delete_response}    post request    global_session    ${location_delete}    data=${location_delete_data}    headers=${token_headers}
    log    ${location_delete_response.text}
    Should Be Equal As Strings    ${location_delete_response.json()['code']}    000002
    log    点位${response.json()['data']['locationId']}删除成功

点位新增_01_必输性验证_名称为空
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationStatus=1    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    A20001

点位新增_02_必输性验证_省市区为空
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    ${data}    Create Dictionary    locationStatus=1    address=详细地址    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0
    ...    operatorId=201372223579398144000001    locationName=jeffrey-ceshi修改
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    A20001

点位新增_03_必输性验证_组织机构/运营商为空
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    ${data}    Create Dictionary    locationStatus=1    address=详细地址    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0
    ...    operatorId=201372223579398144000001    locationName=jeffrey-ceshi修改
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    A20001

点位新增_04_重复性验证_点位名称重复
    [Tags]    location
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    #为验证点位名称重复添加数据
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=jeffrey-ceshi修改    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    log    ${response.json()['data']['locationId']}
    log    点位${response.json()['data']['locationId']}添加成功
    #验证点位名称重复
    ${response_delete}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response_delete.text}
    Should Be Equal As Strings    ${response_delete.json()['code']}    M00032
    #将新增的数据删除
    ${location_delete_data}    Create Dictionary    ids=${response.json()['data']['locationId']}
    ${location_delete_response}    post request    global_session    ${location_delete}    data=${location_delete_data}    headers=${token_headers}
    log    ${location_delete_response.text}
    Should Be Equal As Strings    ${location_delete_response.json()['code']}    000002
    log    点位${response.json()['data']['locationId']}删除成功

点位新增_05_正常点位新增
    [Tags]    location
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    ${location_name}    生成随机字符串    location
    log    ${location_name}
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=${location_name}    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    log    ${response.json()['data']['locationId']}
    log    点位${response.json()['data']['locationId']}添加成功
    #将新增的数据删除
    ${location_delete_data}    Create Dictionary    ids=${response.json()['data']['locationId']}
    ${location_delete_response}    post request    global_session    ${location_delete}    data=${location_delete_data}    headers=${token_headers}
    log    ${location_delete_response.text}
    Should Be Equal As Strings    ${location_delete_response.json()['code']}    000002
    log    点位${response.json()['data']['locationId']}删除成功

点位修改_01_点位修改_点位名称修改
    [Tags]    location
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    #为修改点位名称添加数据
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=jeffrey-ceshi    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    log    ${response.json()['data']['locationId']}
    log    点位${response.json()['data']['locationId']}添加成功
    #验证点位名称修改
    Set To Dictionary    ${data}    locationName=jeffrey-ceshi修改    locationId=${response.json()['data']['locationId']}
    ${response_delete}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response_delete.text}
    Should Be Equal As Strings    ${response_delete.json()['code']}    000000
    #将新增的数据删除
    ${location_delete_data}    Create Dictionary    ids=${response.json()['data']['locationId']}
    ${location_delete_response}    post request    global_session    ${location_delete}    data=${location_delete_data}    headers=${token_headers}
    log    ${location_delete_response.text}
    Should Be Equal As Strings    ${location_delete_response.json()['code']}    000002
    log    点位${response.json()['data']['locationId']}删除成功

点位修改_02_点位修改_点位类型修改
    [Tags]    location
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    #为修改点位类型添加数据
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=jeffrey-ceshi    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    log    ${response.json()['data']['locationId']}
    log    点位${response.json()['data']['locationId']}添加成功
    #验证点位类型修改
    Set To Dictionary    ${data}    locationType=1    locationId=${response.json()['data']['locationId']}
    ${response_delete}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response_delete.text}
    Should Be Equal As Strings    ${response_delete.json()['code']}    000000
    #将新增的数据删除
    ${location_delete_data}    Create Dictionary    ids=${response.json()['data']['locationId']}
    ${location_delete_response}    post request    global_session    ${location_delete}    data=${location_delete_data}    headers=${token_headers}
    log    ${location_delete_response.text}
    Should Be Equal As Strings    ${location_delete_response.json()['code']}    000002
    log    点位${response.json()['data']['locationId']}删除成功

点位删除_01_点位删除
    [Tags]    location
    ${token_headers}    登陆
    Set To Dictionary    ${token_headers}    Content-Type=application/x-www-form-urlencoded
    #为点位删除添加数据
    ${data}    Create Dictionary    provinceId=jeffrey-省    cityId=jeffrey-市    districtId=jeffrey-区    locationName=jeffrey-ceshi    address=详细地址
    ...    orgId=244391243970551808000001    cascadeId=0.001.001    locationType=0    operatorId=201372223579398144000001    locationStatus=1
    ${response}    post request    global_session    ${location_save}    data=${data}    headers=${token_headers}
    log    ${response.text}
    Should Be Equal As Strings    ${response.json()['code']}    000000
    log    ${response.json()['data']['locationId']}
    log    点位${response.json()['data']['locationId']}添加成功
    #将新增的数据删除
    ${location_delete_data}    Create Dictionary    ids=${response.json()['data']['locationId']}
    ${location_delete_response}    post request    global_session    ${location_delete}    data=${location_delete_data}    headers=${token_headers}
    log    ${location_delete_response.text}
    Should Be Equal As Strings    ${location_delete_response.json()['code']}    000002
    log    点位${response.json()['data']['locationId']}删除成功
