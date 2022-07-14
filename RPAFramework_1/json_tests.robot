*** Settings ***
Library    RPA.JSON

*** Test Cases ***
TC1
    &{people}=    Convert string to JSON       {"People": [{"Name": "Mark"}, {"Name": "Jane"}]}
    ${first}=     Get value from JSON      ${people}    People[0].Name
    Log To Console    ${first}
    Log To Console     ${people.People}
    Log To Console     ${people.People[0].Name}

TC1_1
    &{data}=    Convert string to JSON       {"browser": "chrome","url":"google.com"}
    Log To Console     ${data}
    Log To Console     ${data.browser}
Tc2
    &{data}    Load JSON from file    ${EXECDIR}\\testdata\\data.json
    Log To Console      Current auth token: ${data.browser}
    Log To Console      Current auth token: ${data.validcredentialtestdata}
    Log To Console      Current auth token: ${data.validcredentialtestdata}[0][0]

TC3
    &{people}=    Convert string to JSON   {"People": [{"Name": "Mark"}, {"Name": "Jane"}]}
    @{names}=     Get values from JSON     ${people}   People[*].Name
    Log To Console    ${names}
    @{names}=     Get values from JSON     ${people}   $.People[*].Name
    Log To Console    ${names}