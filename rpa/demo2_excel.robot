*** Settings ***
Library    RPA.Excel.Files

*** Test Cases ***
TC1
    Open Workbook    path=D:\\Mine\\Company\\Ericsson 4\\openemr_data.xlsx
    @{sheets}     List Worksheets
    Log To Console    ${sheets}
    Log To Console    ${sheets}[1]

    FOR    ${sheet}    IN    @{sheets}
        Log To Console    ${sheet} 
    END

TC2
    Open Workbook    path=D:\\Mine\\Company\\Ericsson 4\\openemr_data.xlsx
    ${sheet}    Read Worksheet    Sheet1
    Log To Console    ${sheet}
    Log    ${sheet}
    Log To Console    ${sheet}[0]
    Log To Console    ${sheet}[0][A]
    Log To Console    ${sheet}[0][B]

    Log To Console    ${sheet}[2]
    Log To Console    ${sheet}[2][A]
    Log To Console    ${sheet}[2][B]

TC3
    Open Workbook    path=D:\\Mine\\Company\\Ericsson 4\\openemr_data.xlsx
    @{sheet}    Read Worksheet    Sheet1

    ${row_count}     Get Length    ${sheet}
    Log To Console    ${row_count}

    ${value}    Get Worksheet Value    1    1
    Log To Console    ${value}

    ${value}    Get Worksheet Value    1    2
    Log To Console    ${value}


    Set Worksheet Value    1    1    bala
    Save Workbook
