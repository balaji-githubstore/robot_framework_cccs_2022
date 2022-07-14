*** Settings ***
Library     String



*** Test Cases ***
TC4
    Set Local Variable    ${val1}    bala
    Set Local Variable    ${val2}    john

    ${val1}     Replace String    ${val1}    $    ${EMPTY}


    ${to} =	Format String	To: {} <{}>	    ${val1}     ${val2}
    Log To Console    ${to}

    ${to} =	Format String	<{}-{}>	    ${val1}     ${val2}
    ${to} =	Format String	{}	    ${val1}     ${val2}
    Log To Console    ${to}

TC3
    Set Local Variable    ${val}    $120,000,000
    ${val}  Remove String    ${val}     $       ,
    Log To Console    ${val}
    ${val}  Convert To Number    ${val}
   ${val}    Evaluate    ${val}+${val}
   Log To Console    ${val}
   


TC1
    FOR    ${i}    IN RANGE    1    11
        Log To Console    ${i}
    END

TC2
    Set Local Variable    ${text}   Showing 1 to 10 of 57 entries
    Log To Console    ${text}
    ${text}     Fetch From Right    ${text}     of
    Log To Console    ${text}
    ${text}     Remove String       ${text}         entries
    Log To Console    ${text}
    ${text}    Strip String    ${text}
    Log To Console    ${text}
    ${text}     Convert To Integer    ${text}

    ${text1}      Evaluate    ${text}/10
    Log To Console    ${text1}

    ${text2}      Convert To Integer    ${text1}
    Log To Console    ${text2}

   ${text}      Evaluate    math.ceil(${text}/10)
    Log To Console    ${text}

    FOR    ${i}    IN RANGE    1    ${text}+1
        Log To Console    ${i}
    END

