*** Settings ***
Library    SeleniumLibrary 
Library    OperatingSystem         
 
*** Test Cases ***
TC1_Graph
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://www.worldometers.info/coronavirus/coronavirus-cases/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    20s
    Scroll Element Into View    xpath=(//*[@class='highcharts-root'])[3]
    Assign Id To Element    xpath=(//*[@class='highcharts-root'])[3]    id=mainsvg
    ${text}    Get Text    id=mainsvg
    Log To Console    ${text}    
    
TC1_Tooltip
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://atozgrocery.in/my-account/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    20s
    Input Text    id=reg_email    me@
    ${tooltip}    Execute Javascript    return document.querySelectorAll('#reg_email')[0].validationMessage    
    Log To Console    ${tooltip}    