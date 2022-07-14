*** Settings ***
Library    SeleniumLibrary   
Library    OperatingSystem     
Library    String

*** Keywords ***
ReturnFromForLoop
    FOR    ${i}    IN RANGE    1    5
       Return From Keyword    ${i}
    END
ReturnFromForLoopWithIf
    FOR    ${i}    IN RANGE    1    5
       Return From Keyword If    ${i}==2    ${i}
    END
ReturnFromKeywordCode
    Set Local Variable       ${i}    4    
    Run Keyword And Return    Get Title 
    Run Keyword And Return If    ${i}==4    Get Title    
    
*** Test Cases ***
TC4_check
    ${u}   ReturnFromForLoop   
    Log To Console    ${u}    

TC5_check  
    Log To Console    jjjjj  

TC6
    Log To Console    ${TEST_NAME}    
    [TearDown]    Log To Console    ${TEST_STATUS}
    