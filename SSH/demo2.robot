*** Settings ***
Library             Process
Library    AppiumLibrary

# Test Teardown       Terminate Process    appiumserver kill=True


*** Test Cases ***
TC1
    Start Process
    ...    appium -p 7878
    ...    shell=True
    ...    alias=appiumserver
    ...    stdout=${CURDIR}/appium_stdout.txt
    ...    stderr=${CURDIR}/appium_stderr.txt

    Open Application    remote_url=http://localhost:7878/wd/hub
    ...    platformName=windows    app=C:\\WINDOWS\\system32\\notepad.exe

    Click Element    xpath=//*[@Name='File']

TC2
    ${process} =    Start Process    python    -c    print('Hello, world!')
    Log To Console    ${process}

TC3
    Open Application    remote_url=http://localhost:4723/wd/hub
    ...    platformName=windows
    ...    app=C:\\Users\\Balaji\\AppData\\Roaming\\Zoom\\bin\\zoom.exe

    # app=C:${/}WINDOWS${/}system32${/}notepad.exe
    # ...    deviceName=WindowsPC
    Click Element    xpath=//*[@Name='File']

TC4
    Open Application    remote_url=http://localhost:4723/wd/hub
    ...    platformName=windows
    ...    app=C:${/}WINDOWS${/}system32${/}notepad.exe
    ...    alias=win
    # ...    app=C:\\Users\\Balaji\\AppData\\Roaming\\Zoom\\bin\\zoom.exe

    # ...    deviceName=WindowsPC
    Sleep    5s
    Input Text    xpath=//Edit    hello
    Click Element    xpath=//*[@Name='File']
    Click Element    xpath=//*[contains(@Name,'Save As')]
    Input Text    xpath=(//*[contains(@Name,'File name')])[2]    D:${/}hello1.txt
    Click Element    xpath=//*[@Name='Save']

TC5
    Open Application    remote_url=http://localhost:4723/wd/hub
    ...    platformName=windows
    ...    app=C:\\Users\\Balaji\\AppData\\Roaming\\Zoom\\bin\\zoom.exe

    # app=C:${/}WINDOWS${/}system32${/}notepad.exe
    # ...    deviceName=WindowsPC
    Sleep    5s
    Click Element    xpath=//*[@Name='Sign In']
    Input Text    xpath=//*[contains(@Name,'your email')]    hello@gmail.com
    Sleep    1s
    Click Element    xpath=//*[contains(@Name,'your password')]
    Input Text    xpath=//*[contains(@Name,'your password')]    hello@gmail.com
    Click Element    xpath=//*[@Name='Sign In']
    Sleep    5s
    ${text}    Get Element Attribute    xpath=xpath=//*[contains(@Name,'Failed')]     Name
    # ${text}     Get Source
    Log To Console     ${text}
    [Teardown]    Close All Applications