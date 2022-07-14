*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library    String

*** Test Cases ***
#TC2
#    Append To Environment Variable    Path      ${EXECDIR}${/}driver
#    Open Browser    browser=gc
#    Maximize Browser Window
#    Go To    https://atozgrocery.in/my-account/
#    Set Selenium Implicit Wait    30s
    Execute Javascript  document.querySelector("[id='email']").value="bala";
#
    ${ele}      Get WebElement    //*[@id='pass']
    Execute JavaScript      arguments[0].value="bala123"   ARGUMENTS        ${ele}
#
    ${ele}      Get WebElement    //*[@id='send2']
     Execute JavaScript      arguments[0].click();   ARGUMENTS        ${ele}

#    Execute JavaScript      arguments[0].click();arguments[1].click();   ARGUMENTS        ${ele}        ${ele}
#
#TC1
#    Append To Environment Variable    Path      ${EXECDIR}${/}driver
#    Open Browser    browser=gc
#    Maximize Browser Window
#    Go To    url=https://datatables.net/examples/basic_init/scroll_y.html
#    Set Selenium Implicit Wait    30s
#
#    ${rowcount}     Get Element Count    xpath=//table[@id='example']/tbody/tr
#    Log To Console    ${rowcount}

    #    1 to 10
#    FOR    ${i}    IN RANGE    1    ${rowcount}+1
#        Scroll Element Into View    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
#        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
#        Log To Console    ${name}
#    END

#    FOR    ${i}    IN RANGE    1    ${rowcount}+1
#
#         Execute JavaScript      document.querySelectorAll("[class='dataTables_scrollBody']")[0].scrollBy(0,20)
#
#        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
#        Log To Console    ${name}
#    END

#    FOR    ${i}    IN RANGE    1    ${rowcount}+1
#
#         ${ele}      Get WebElement    //div[@class="dataTables_scrollBody"]
#        Execute JavaScript      arguments[0].scrollBy(0,50)     ARGUMENTS        ${ele}
#
#        ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
#        Log To Console    ${name}
#    END
#    Assign Id To Element    locator    id
#    Capture Element Screenshot    locator
#    document.querySelectorAll("[id='reg_email']")[0].validationMessage
    
TC3
    Append To Environment Variable    Path      ${EXECDIR}${/}driver

    &{pref}     Create Dictionary   download.default_directory=${EXECDIR}${/}downloads
    Open Browser    browser=gc      options=add_experimental_option("prefs",${pref});

    Maximize Browser Window
    Go To    https://atozgrocery.in/my-account/
    Set Selenium Implicit Wait    30s
    Input Text    id=reg_email    king
#    Click Element    name=register

    ${title}    Execute Javascript      return document.Title
    Log To Console    ${title}

    ${msg}    Execute Javascript      return document.querySelector("[id='reg_email'].validationMessage
    Log To Console    ${msg}

    ${val}   Execute Javascript      return document.querySelectorAll("[id='reg_email']")[0].validationMessage
    Log To Console    ${val}
    Should Contain    ${val}    'king' is missing an '@'

    ${ele}      Get WebElement    //*[@id='reg_email']
    Execute JavaScript      return arguments[0].validationMessage   ARGUMENTS        ${ele}
    
    
Login
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    url=https://www.pepperfry.com/    browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Run Keyword And Ignore Error
    ...   Click Element    //div[@id='regPopUp']//a[@class='popup-close']


    Input Text    id=search    bedsheets
    Click Element    id=searchButton
#    Click Element    //h2[contains(text(),'APPLY FILTERS')]
    Click Element    //label[@for='brandsnameSleep_Dove']
    Mouse Over      //div[@unbxdattr='product'][position()=1]
    Set Focus To Element    //div[@unbxdattr='product'][position()=1]
    Click Element    //div[@unbxdattr='product'][position()=1]
#    Click Element    //a[.='Proceed to pay sec
    Click Element    //a[.='Proceed to pay securely ']
    Wait Until Location Is    https://www.pepperfry.com/checkout/cart?from=minicart
    Wait Until Page Contains    IN YOUR CART
    ##Scroll Element Into View    xpath=//a[@class='btn_green_big btn_disable ']
#    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    #Click Element    //a[@class="btn_green_big  "]
    Scroll Element Into View    //a[.='PLACE ORDER'][position()=1]
    Click Element    //a[.='PLACE ORDER'][position()=1]
    Wait Until Page Contains    ORDER SUMMARY
    Input Text    //input[@id='nCheckout-userEmail']    RBARIKAR@GMAIL.COM
    Input Text     //input[@id='name']    RBARIKAR
    Input Text    //input[@id='mobile']    899902
#    Click Button    //button[.='
