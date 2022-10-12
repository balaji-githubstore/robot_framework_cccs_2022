*** Settings ***
Library     FakerLibrary

Library    webdriver_setup


*** Test Cases ***
FakerLibrary Words Generation
    ${words}=    FakerLibrary.Word
    Log To Console    words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log To Console    words: ${words}
    ${words}=    Date Time
    Log To Console    words: ${words}
    ${words}=    Credit Card Number
    Log To Console    words: ${words}
