*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary

*** Test Cases ***
TC1 Multiple Tabs
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc
    Maximize Browser Window
    Go To    https://www.db4free.net/
    Set Selenium Implicit Wait    30s
    Click Element    //b[contains(text(),'phpMy')]
    Switch Window    NEW
    Select From List By Label    id=sel-lang    English (United Kingdom)
    Input Text    id=input_username    admin
    Input Password    id=input_password    pass123
    Click Element    id=input_go
#    get and print the Cannot log in to the MySQL server
    ${actualtext}   Get Text    xpath=(//div[@role='alert'])[2]
    Log To Console    ${actualtext}
    Log    ${actualtext}
    Switch Window      MAIN
    Title Should Be    db4free.net - MySQL Database for free

    ${actualtext}     Get Text    class=col-sm-9
    Log To Console    ${actualtext}
    Switch Window    phpMyAdmin
    Input Text    id=input_username    admin
    Input Password    id=input_password    pass123
    Click Element    id=input_go










