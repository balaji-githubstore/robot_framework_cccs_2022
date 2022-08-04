*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
TC1
    Open Browser    https://demo.openemr.io/b/openemr/    chrome    remote_url=http://172.17.67.65:4444
    ...    executable_path=D:\\Software\\chromedriver.exe
    Maximize Browser Window
    Set Browser Implicit Wait    20
    Input Text    name=authUser    admin
    [Teardown]     Close Browser

TC2 Standalone server 
    Open Browser    https://demo.openemr.io/b/openemr/    edge    remote_url=http://172.17.67.65:4444
    Maximize Browser Window
    Set Browser Implicit Wait    20
    Input Text    name=authUser    admin
    [Teardown]     Close Browser

TC3 Hub and Node 
    Open Browser    url=https://demo.openemr.io/b/openemr/    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    url=https://demo.openemr.io/b/openemr/    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    url=https://demo.openemr.io/b/openemr/    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    url=https://demo.openemr.io/b/openemr/    browser=chrome    remote_url=http://172.17.67.65:4444
    Open Browser    url=https://demo.openemr.io/b/openemr/    browser=chrome    remote_url=http://172.17.67.65:4444
    Maximize Browser Window
    Set Browser Implicit Wait    20
    Input Text    name=authUser    admin
    [Teardown]     Close All Browsers