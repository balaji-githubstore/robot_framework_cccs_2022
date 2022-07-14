*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library    String
Library    Telnet

*** Test Cases ***
TC1
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc      options=add_argument("--disable-notifications")
    Maximize Browser Window
    Go To    https://www.irctc.co.in/nget/train-search
    Set Selenium Implicit Wait    20s
    Run Keyword And Ignore Error
    ...     Click Element    //button[text()='OK']

TC2
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc      options=add_argument("--disable-notifications")
    Maximize Browser Window
    Go To    https://www.royalcaribbean.com/
    Set Selenium Implicit Wait    20s
#    Set Selenium Speed    1s
#    Set Selenium Timeout    50s
    Run Keyword And Ignore Error
    ...     Click Element    //*[@class="email-capture__close"]

    #    Press Keys      //*[@class="email-capture__close"]      ESCAPE
    #    Press Keys      NONE      ESCAPE

    Click Element    //*[text()='Sign In']
    Click Element    link=Create an account
    Input Text    //input[@data-placeholder="First name/Given name"]    Bala
    Input Text    //input[@data-placeholder="Last name/Surname"]    Dina
    
    Click Element    //span[text()='Month']
    Wait Until Page Contains    December
    Click Element    //span[contains(text(),'December')]

TC3
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc      options=add_argument("--disable-notifications")
    Maximize Browser Window
    Go To    https://onlinehtmleditor.dev/
    Set Selenium Implicit Wait    20s
    Select Frame    //iframe[contains(@title,'Rich')]

    ${ele}      Get WebElement    //*[@contenteditable="true"]/p
#    Execute Javascript      document.getElementById("demo").innerHTML = "Paragraph changed!";
    Execute JavaScript      arguments[0].innerHTML = "Paragraph changed by balaji!";   ARGUMENTS     ${ele}


TC4_currentusername
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc      options=add_argument("--disable-notifications")
    Maximize Browser Window
    Go To    https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE
    ${name}     Get Environment Variable    USERNAME
    Log To Console    ${name}
    File Should Exist    C:\\Users\\${name}\\Downloads\\IEDriverServer_Win32_3.150.1.zip

TC5
    &{prefs}    Create Dictionary       download.default_directory=${EXECDIR}${/}downloads

    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc      options=add_experimental_option("prefs",${prefs})
    Maximize Browser Window
    Go To    https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE

    File Should Exist    ${EXECDIR}${/}driver//IEDriverServer_Win32_3.150.1.zip


TC6
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    browser=gc      alias=b1
    Open Browser    browser=ff      alias=b2
    Go To    https://www.selenium.dev/
    ${title}    Get Title
    Log To Console    ${title}
    Switch Browser    b1
    Go To    https://www.google.com
    Close All Browsers

    
    
    
    
    
    
    