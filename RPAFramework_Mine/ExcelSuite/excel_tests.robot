*** Settings ***
Library    RPA.Excel.Files
Library    Tables

# *** Keywords ***
# Get row count in the sheet
    # [Arguments]      ${SHEET_NAME}
    # ${sheet}=        Read Worksheet   ${SHEET_NAME}
    # ${rows}=         Get Length  ${sheet}
    # [Return]         ${rows}
    
*** Test Cases ***
Sheet Name And Row Count
    [Setup]      Open Workbook    ${EXECDIR}\\testdata\\OpenEMRData.xlsx
    @{sheets}=   List Worksheets
    
    FOR  ${sheetname}  IN   @{sheets}
        ${sheet}=        Read Worksheet   ${sheetname}
        ${count}=         Get Length  ${sheet}
        Log To Console   Worksheet '${sheetname}' has ${count} rows
    END
    
Read WorkSheet
    Open Workbook    ${EXECDIR}\\testdata\\OpenEMRData.xlsx
    
    ${sheet}        Read Worksheet   Sheet1
    Log To Console    ${sheet} 
    Log To Console    ${sheet}[0][A] 
    Log To Console    ${sheet}[1][A] 
    
    ${rowcount}    Get Length    ${sheet}
    Log To Console    ${rowcount} 
    
    ${colcount}    Get Length    ${sheet}[0]
    Log To Console    ${colcount}    

    ${cell}    Get Worksheet Value    1    1    
    Log To Console    ${cell}    

    Close Workbook

Creating new Excel
    Create Workbook  ${EXECDIR}\\testdata\\Amount.xlsx
    FOR    ${index}    IN RANGE    20
        &{row}=       Create Dictionary    Row No=${index}    Amount=${index * 25}
        Append Rows to Worksheet  ${row}  header=${TRUE}
    END
    Save Workbook
    

Edit Excel
    Open Workbook    ${EXECDIR}\\testdata\\OpenEMRData.xlsx  
    ${sheet}        Read Worksheet   Sheet1
    Set Worksheet Value    1    1    Balaji    
    Save Workbook    
    Close Workbook

