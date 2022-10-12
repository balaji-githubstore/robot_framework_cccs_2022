*** Settings ***
Library     SeleniumLibrary
Library    webdriver_setup.py
Library    DemoSetup

*** Test Cases ***
TC1
    ${path}     Get Driver Path With Browser    edge
    Log To Console    ${path}

    