*** Settings ***
Library       RequestsLibrary
Library    OperatingSystem

*** Test Cases ***
TC1
    Create Session    petshop    https://petstore.swagger.io/v2
    ${response}=    Get Request    petshop    pet/105
    Log To Console    ${response}
    Log To Console    ${response.json()}
    Log To Console    ${response.json()}[id]
    Log To Console    ${response.json()}[category]
    Status Should Be    200    ${response}
    ${body}     Convert To String    ${response.json()}
    Should Contain    ${body}    category

TC2
    Create Session    petshop    https://petstore.swagger.io/v2
    ${response}=    Get Request    petshop    pet/findByStatus?status=sold
    Log To Console    ${response}
    Log To Console    ${response.json()}
    Status Should Be    200    ${response}
    ${body}     Convert To String    ${response.json()}
    Should Contain    ${body}    category

TC3
    ${json}     Get Binary File     ${EXECDIR}\\testdata\\addrecord.json
    Create Session    petshop    https://petstore.swagger.io/v2
    &{type}     Create Dictionary    Content-Type=application/json
    ${response}=    Post Request    alias=petshop    uri=pet      headers=${type}     data=${json}
    Log To Console    ${response}
    Log To Console    ${response.json()}
    Status Should Be    200    ${response}
