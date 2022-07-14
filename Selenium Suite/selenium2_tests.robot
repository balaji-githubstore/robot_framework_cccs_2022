*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library    String
Library    DebugLibrary

*** Test Cases ***
TC1
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc
    Maximize Browser Window
    Go To    https://account.magento.com/customer/account/login
    Set Selenium Implicit Wait    30s
    ${att}      Get Element Attribute    id=authUser    placeholder
    Log To Console    ${att}
    Element Attribute Value Should Be    id=authUser    placeholder    Username:

    ${att}      Get Element Attribute    partial link=Acknowledgments   href
    Log To Console    ${att}
    Click Element    partial link=Acknowledgments

TC2
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc
    Maximize Browser Window
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Set Selenium Implicit Wait    30s
    Select From List By Label    name=example_length    25
    
    ${rowcount}     Get Element Count    xpath=//table[@id='example']/tbody/tr
    Log To Console    ${rowcount}

    #    1 to 10
    FOR    ${i}    IN RANGE    1    ${rowcount}+1
        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}

         ${age}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[5]
        Log To Console    ${age}

        IF   '${name}' == 'Brenden Wagner'
            Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
            Exit For Loop
        END
    END

TC3
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc
    Maximize Browser Window
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Set Selenium Implicit Wait    30s
    Select From List By Label    name=example_length    25

    ${rowcount}     Get Element Count    xpath=//table[@id='example']/tbody/tr
    Log To Console    ${rowcount}

#    Set Local Variable    ${curname}    ${EMPTY}
#    ${curname}    Set Variable    ${EMPTY}
    #    1 to 10
    FOR    ${i}    IN RANGE    1    ${rowcount}+1
        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}

         ${age}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[5]
        Log To Console    ${age}

            Run Keyword If    '${name}' == 'Brenden Wagner'
            ...    Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
#        Exit For Loop If    '${name}' == 'Brenden Wagner'

        Run Keyword If    '${name}' == 'Brenden Wagner'
        ...     Set Local Variable    ${curname}        ${name}

    END
    Log To Console    ${curname}
    ${name1}    Set Variable    bala
    ${name2}    Set Variable    ${name1}
    Set Local Variable    ${name3}     ${name1}

TC4
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc
    Maximize Browser Window
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Set Selenium Implicit Wait    30s
    Sleep    5s

    FOR    ${pagecounter}    IN RANGE    1    7

        ${rowcount}     Get Element Count    xpath=//table[@id='example']/tbody/tr
        Log To Console    ${rowcount}
        FOR    ${i}    IN RANGE    1    ${rowcount}+1
            ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            Log To Console    ${name}
        END
        Click Element    link=Next

    END

TC5
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc
    Maximize Browser Window
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Set Selenium Implicit Wait    30s
    ${text}    Get Text    //div[contains(text(),'Showing')]
    Log To Console    ${text}
    ${text}     Fetch From Right    ${text}     of
    Log To Console    ${text}
    Table Should Contain    xpath=//table[@id='example']    Brenden Wagner
    ${cellvalue}    Get Table Cell    xpath=//table[@id='example']    2    2
    Log To Console    ${cellvalue}
    Table Cell Should Contain    xpath=//table[@id='example']    3    2    Angelica Ramos123
    Table Row Should Contain    xpath=//table[@id='example']    3    Angelica Ramos
    Table Row Should Contain    xpath=//table[@id='example']    3    London
#    Click Element    month
#    Click Element    april

TC6
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    https://google.com
#    Debug
    ${title}    Get Title
    Log To Console    ${title}
    Go Back
    
