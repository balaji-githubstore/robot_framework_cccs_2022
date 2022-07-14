*** Settings ***
Documentation   This file will handle all the elements in the login page

Resource    ../Base/common_functionality.resource

*** Variables ***
${USERNAME_LOCATOR}      id=authUser
${PASSWORD_LOCATOR}      id=clearPass
${LANGUAGE_LOCATOR}      name=languageChoice
${LOGIN_LOCATOR}    xpath=//button[@type='submit']
${ERROR_LOCATOR}    xpath=//div[contains(text(),'Invalid')]

*** Keywords ***
Enter Username
    [Arguments]     ${username}
    [Documentation]    This keyword will send username \n
    ...     Examples: \n
    ...     | Enter Username |  admin |
    ...     | Enter Username |  accountant |
    Input Text      ${USERNAME_LOCATOR}       ${username}

Enter Password
    [Arguments]     ${password}
    [Documentation]    This keyword will send password \n
    ...     Examples: \n
    ...     | Enter Password |  pass |
    ...     | Enter Password |  accountant |
    Input Password    ${PASSWORD_LOCATOR}       ${password}

Select Language
    [Arguments]     ${language}
    [Documentation]    This keyword will select dropdown using the text/label \n
    ...     Examples: \n
    ...     | Select Language |  Dutch |
    ...     | Select Language |  Danish |
    Select From List By Label      ${LANGUAGE_LOCATOR}       ${language}

Click Login
    [Documentation]    This keyword use to click login button \n
    ...     Examples: \n
    ...     | Click Login |
    Click Element      ${LOGIN_LOCATOR}

Validate Invalid Error Message
    [Arguments]     ${expectedvalue}
    [Documentation]    This keyword will return the invalid credential error message \n
    ...     Examples: \n
    ...     | Validate Invalid Error Message | Invalid username |
    ...     | Validate Invalid Error Message | Invalid username |
    Element Should Contain      ${ERROR_LOCATOR}       ${expectedvalue}
