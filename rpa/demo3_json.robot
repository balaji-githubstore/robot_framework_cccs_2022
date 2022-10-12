*** Settings ***
Library    RPA.JSON
Library    Collections
Library    OperatingSystem
Library    RPA.Tables
*** Test Cases ***
TC1
    &{json}    Load JSON from file    ${EXECDIR}${/}files${/}data.json
    Log To Console    ${json.browser}
    Log To Console    ${json.connectionstringdb}
    Log To Console    ${json.validcredentialtestdata}
    Log To Console    ${json.validcredentialtestdata}[0]
    Log To Console    ${json.validcredentialtestdata}[0][0]

    Log To Console    ${json}[browser]
    Log To Console    ${json['browser']}
    Log To Console    ${json['validcredentialtestdata'][0][0]}

    &{dic}    Convert To Dictionary    ${json}
    Log To Console    ${dic}

    ${len}    Get Length    ${json.validcredentialtestdata}
    Log To Console    ${len}
   
TC2
    &{json}    Load JSON from file    ${EXECDIR}${/}files${/}data.json
    

    &{json2}    Update value to JSON    ${json}    browser   ff
    Log To Console    ${json2}

    ${first}=     Get value from JSON      ${json}   browser
    Log To Console    ${first}

     ${first}=     Get value from JSON      ${json}   validcredentialtestdata
    Log To Console    ${first}

    Save JSON to file   ${json2}    ${EXECDIR}\\d.json

TC3
    &{json}    Load JSON from file    ${EXECDIR}${/}files${/}data.json
    ${tbl}    Create Table    ${json}
    Log To Console    ${tbl}

    ${cell}    Get Table Cell    ${tbl}    0    browser
    Log To Console    ${cell}
