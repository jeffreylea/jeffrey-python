*** Test Cases ***
Convert
    ${a}    set variable    100
    ${integer}    convert to integer    ${a}    2
    ${number}    convert to number    ${a}
    ${binary}    convert to binary    ${a}    6
    ${octal}    convert to octal    ${a}    8
    ${hex}    convert to hex    ${a}    10
    ${String}    convert to String    ${a}
    ${Bytes}    convert to Bytes    ${a}
    ${boolean}    convert to boolean    ${a}

Verify
    Fail    停止当前Case
    Log    不会打印
    Fatal error    停止所有case    #后面的案例都会停止
    should not be empty    A
    should start with    hello    he

Variables
    [Tags]    test
    ${var}    set variable    a
    ${var2}    set variable if    '${var}'>'0'    9
    ${var3}    get variable value    ${var2}
    log    ${var3}
    log variables
    Variable Should Exist    ${var3}
    log    ${var3}
    ${var4}    replace variables    2222
    log    ${var4}

RunKeyword
    [Tags]    test
    run keyword    log    abc
    Run Keywords    log    cde
    ...    AND    log    detr
