*** Settings ***
Library     RPA.Crypto
Library     SeleniumLibrary


*** Variables ***
${enPassword}    gAAAAABjRv69-KYvfkpI6azAbmFB2-c7_miuP2GuwNqXMnw10WLHCohtyxmo9lKmlIYX4lGjztVmRPVmYcf0HIKCV71TrzAgZA==
${KEY}    FL_J89rsQ7oq4Xi0dNFFMPNeYmEBgJ6ICCpJXqQG1A4=


*** Test Cases ***
TC1 Generate Key And Encrypt Password 
   
    ${KEY}    Generate Key
    Log To Console    ${KEY}

    Use Encryption Key    ${KEY}
    ${encryptedPassword}    Encrypt String    pass
    log to console    ${encryptedPassword}


TC2 Use Key and decrypt password
    Use Encryption Key    ${KEY}
    ${password}    Decrypt String    ${enPassword}

    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr
    Input Text    id=authUser    admin
    Input Password    css=#clearPass    ${password}
    Click Element    id=login-button
