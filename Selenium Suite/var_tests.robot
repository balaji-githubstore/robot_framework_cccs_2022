*** Settings ***
Library     Collections

*** Variables ***
${BROWSER}      ch
@{COLORS}   red     green      blue     yellow
&{EMPDIC}   username=admin      password=pass       language=english

&{pdfdic}   1=textonpage1     2=textonpage2       language=english

*** Test Cases ***
TC2
    @{keys}     Get Dictionary Keys    ${EMPDIC}

    FOR    ${key}    IN    @{keys}
       Log To Console    ${key}
    END





TC1 
    Log To Console    ${BROWSER}
    Log To Console    ${COLORS}[0]

    ${count}    Get Length    ${COLORS}
    Log To Console    ${count}

     FOR    ${i}    IN RANGE    0   ${count}
        Log To Console    ${COLORS}[${i}]

    END

    FOR    ${color}    IN    @{COLORS}
        Log To Console    ${color}

    END

    Log To Console    ${EMPDIC}[username]