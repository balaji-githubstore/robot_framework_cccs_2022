*** Settings ***
Library     RPA.Excel.Files

*** Test Cases ***
TC1
    Open Workbook    C:\\Users\\JiDi\\Desktop\\EMRData.xlsx
    ${sheets}   List Worksheets 
    FOR    ${sheet}    IN    @{sheets}
        #printing sheetname
        Log To Console    ${sheet}

        #read current sheet
        ${sheet}    Read Worksheet  ${sheet}

        ${rowcount}     Get Length      ${sheet}
        Log To Console    ${rowcount}
    END

TC2
    Open Workbook    C:\\Users\\JiDi\\Desktop\\EMRData.xlsx
    ${sheet}    Read Worksheet      InvalidCredentialTest
    Log To Console     ${sheet}
    Log To Console     ${sheet}[0][A]
    Log To Console     ${sheet}[0][C]
#    check on Table in RPA framework

TC3
    Open Workbook    C:\\Users\\JiDi\\Desktop\\EMRData.xlsx
    ${sheet}    Read Worksheet      InvalidCredentialTest
    
    ${rowcount}     Get Length    ${sheet}
    Log To Console    ${rowcount}

    ${rowcount}     Get Length    ${sheet}[0]
    Log To Console    ${rowcount}


    ${cellValue}   Get Worksheet Value    1    1
    Log To Console    ${cellValue}
    Close Workbook


TC4
    Open Workbook    C:\\Users\\JiDi\\Desktop\\EMRData.xlsx
    ${sheet}    Read Worksheet      InvalidCredentialTest
    Set Worksheet Value    1    1    Balaji
    Save Workbook
    Close Workbook