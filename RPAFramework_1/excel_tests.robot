*** Settings ***
Library     RPA.Excel.Files

*** Test Cases ***
#TC1 Sheet Name And Row Count
#    [Setup]      Open Workbook    ${EXECDIR}\\testdata\\OpenEMRData.xlsx
#    @{sheets}=   List Worksheets
#
#    FOR  ${sheetname}  IN   @{sheets}
#        ${sheet}=        Read Worksheet   ${sheetname}
#        ${count}=         Get Length  ${sheet}
#        Log To Console   Worksheet '${sheetname}' has ${count} rows
#    END

#TC2 Sheet Name And Row Count
#    [Setup]      Open Workbook    ${EXECDIR}\\testdata\\OpenEMRData.xlsx
#    @{sheets}=   List Worksheets
#    ${sheet}=        Read Worksheet     Verify_Invalid_Credentials
#    Log To Console      ${sheet}
#    Log To Console      ${sheet}[0]
#    Log To Console      ${sheet}[0][A]
#     Log To Console      ${sheet}[1][A]
#
#
#     ${rowcount}    Get Length    ${sheet}
#    Log To Console    ${rowcount}
#
#    ${colcount}    Get Length    ${sheet}[0]
#    Log To Console    ${colcount}
#
#    ${cell}    Get Worksheet Value    1    1
#    Log To Console    ${cell}
#    Log To Console    ${cell}

Creating new Excel
    Create Workbook  ${EXECDIR}\\testdata\\Amount1.xlsx
#    FOR    ${index}    IN RANGE    20
#        &{row}=       Create Dictionary    Row No=${index}    Amount=${index * 25}
#        Append Rows to Worksheet  ${row}  header=${TRUE}
#    END
    &{row1}      Create Dictionary      username=username
    &{row2}      Create Dictionary      username1=admin1
    Append Rows To Worksheet    ${row1}      header=${False}
    Append Rows To Worksheet    ${row2}      header=${False}
    Save Workbook