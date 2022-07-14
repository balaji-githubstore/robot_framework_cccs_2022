*** Settings ***
Library     DateTime
Library     SeleniumLibrary
Library     OperatingSystem

*** Test Cases ***
TC1 Get Datetime
    ${currentdate}     Get Current Date
    Log To Console    ${currentdate}

TC2 Print Name
    ${name1}    Set Variable    bala
    Log To Console    ${name1}
    Set Local Variable    ${name2}      bala1
    Log To Console    ${name2}

TC3_EnvironmentVariable
    Log To Console    ${TEST_NAME}
    Log To Console    ${EXECDIR}
    Log To Console    ${CURDIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${EXECDIR}\\driver
    Log To Console    ${EXECDIR}${/}driver

TC4 OpenEMR Login
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default   browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    id=authUser    admin
    Input Password    id=clearPass    pass
    Select From List By Label    name=languageChoice    English (Indian)
    Click Element   xpath=//button[@type='submit']
    Wait Until Page Contains    Flow Board      50s
    ${actualtitle}     Get Title
    Log    ${actualtitle}
    Log To Console    ${actualtitle}

    Run Keyword If    '${actualtitle}' == 'OpenEMR'
    IF    '${actualtitle}' == 'OpenEMR'
           Log To Console    pass
    ELSE
         Log To Console    fail
    END
    
     ${url}      Get Location
     Log To Console    ${url}
    
    Title Should Be    OpenEMR


TC5 OpenEMR Add patient
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default   browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    id=authUser    admin
    Input Password    id=clearPass    pass
    Select From List By Label    name=languageChoice    English (Indian)
    Click Element   xpath=//button[@type='submit']
    Wait Until Page Contains    Flow Board      50s
    Mouse Over    xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='Patients']
    Select Frame    name=fin
    Click Element    id=create_patient_btn1
    Unselect Frame
    

    ${framecount}   Get Element Count    //iframe
    Log To Console    ${framecount}

    Select Frame    xpath=//iframe[contains(@src,'new.php')]
    Input Text    id=form_fname    Peter
    Input Text    id=form_lname    paul
    Input Text    id=form_DOB    2021-07-07
    Select From List By Label    id=form_sex    Female
    Click Element    id=create
    Unselect Frame

    Select Frame    xpath=//iframe[@id='modalframe']
    Click Element    xpath=//input[@value='Confirm Create New Patient']
    Unselect Frame

    #by default alert will be accepted
    ${alerttext}  Handle Alert      action=ACCEPT    timeout=50s
    Log To Console    ${alerttext}
    Click Element    class=closeDlgIframe

    Select Frame    xpath=//iframe[@name='pat']

     ${text}    Get Text    xpath=//h2[contains(text(),'Record')]
     Log    ${text}

    Element Text Should Be    xpath=//h2[contains(text(),'Record')]    Medical Record Dashboard - Peter Paul123
    Element Should Contain    xpath=//h2[contains(text(),'Record')]     Peter Paul
    Unselect Frame
    

    
    [Teardown]  Close Browser





TC6 Upload File
    Append To Environment Variable    Path      ${EXECDIR}${/}driver
    Open Browser    url=https://www.naukri.com/   browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s

    Log To Console    ${EXECDIR}${/}files${/}Profile.docx
    Choose File    id=file_upload    ${EXECDIR}${/}files${/}Profile.docx

TC7
    Create File    C:\\Users\\JiDi\\Desktop\\hello.html    <html> sss </html>
    Append To File    C:\\Users\\JiDi\\Desktop\\Note.txt    hello123




