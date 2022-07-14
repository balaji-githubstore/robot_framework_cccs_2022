*** Settings ***
Library     SeleniumLibrary
Library    webdriver_setup.py

*** Test Cases ***
TC1
    ${path}     Get Driver Path With Browser    edge
    Log To Console    ${path}