*** Settings ***
Library    SeleniumLibrary 
Library    OperatingSystem  
Library    String    

*** Keywords ***
GetCellValue
    [Arguments]   ${cell}    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr 
    FOR    ${i}    IN RANGE    1    ${rowcount}+1  
            ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[${cell}]
            Log To Console    ${name}               
    END
    Log To Console    ----------------------

*** Test Cases ***
TC2_GetCellEachPage
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${pagecount}    Get Element Count    //*[@id='example_paginate']/span/a
    Log To Console    ${pagecount}    
    
    FOR    ${i}    IN RANGE    1    ${pagecount}
             GetCellValue    2
             Click Element    //*[text()='Next']    
             Run Keyword If    ${i}==(6-1)    GetCellValue    2    
    END
    
TC3_Index
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://editor.datatables.net/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    # Sleep    2s    
    Scroll Element Into View    //*[contains(text(),'Showing 1')]
    ${text}    Get Text    //*[contains(text(),'Showing 1')]
    Log To Console    ${text}
    
    # Log To Console    ${text.index(" of")}    
    ${endindex}    Set Variable    ${text.index(" of")}
    ${value1}    Get Substring    ${text}    13    ${endindex}
    Log To Console    ${value1}
    
    # Log To Console    ${text.index(" entries")}    
    ${endindex}    Set Variable    ${text.index(" entries")}
    ${value2}    Get Substring    ${text}    19    ${endindex}
    Log To Console    ${value2}

    ${pagecount}    Evaluate    math.ceil(${value2}/${value1})    
    Log To Console    ${pagecount}   
    # ${text}    Get Substring    ${text}    13  
        
    # ${text}    Remove String    ${text}    Showing 1 to
    # Log To Console    ${text}

  
    
    # FOR    ${i}    IN RANGE    1    ${pagecount}
             # GetCellValue    2
             # Click Element    //*[text()='Next']    
             # Run Keyword If    ${i}==(6-1)    GetCellValue    2    
    # END
    
TC3_GetCellEachPage
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://editor.datatables.net/    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    # Sleep    2s    
    Scroll Element Into View    //*[contains(text(),'Showing 1')]
    ${text}    Get Text    //*[contains(text(),'Showing 1')]
    Log To Console    ${text}
        
    ${endindex}    Set Variable    ${text.index(" of")}
    ${text}    Get Substring    ${text}    13    ${endindex}
    Log To Console    ${text}
    
    FOR    ${i}    IN RANGE    1    ${text}
             GetCellValue    2
             Click Element    //*[text()='Next']    
             Run Keyword If    ${i}==(6-1)    GetCellValue    2    
    END
    
TC4_TableScroll
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_y.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr 
    FOR    ${i}    IN RANGE    1    ${rowcount}+1  
        
            Scroll Element Into View    //table[@id='example']/tbody/tr[${i}]/td[2] 
            
            ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[1]
            Log To Console    ${name}               
    END
    Log To Console    ----------------------
   
TC4_TableScrollArrowDown
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_y.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr 
    FOR    ${i}    IN RANGE    1    ${rowcount}+1  
        
            Press Keys    //table[@id='example']/tbody/tr[${i}]/td[2]    ARROW_DOWN    
             
            ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[1]
            Log To Console    ${name}               
    END
    Log To Console    ----------------------


    
TC4_TableScrollJS
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_y.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr 
    FOR    ${i}    IN RANGE    1    ${rowcount}+1  
        
            Execute Javascript    document.querySelectorAll('[class="dataTables_scrollBody"]')[0].scrollBy(0,20)   
            
            ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[1]
            Log To Console    ${name}               
    END
    Log To Console    ----------------------
    
TC4_TableScrollVertical
    Append To Environment Variable    Path    C:\\Components
    Open Browser    url=https://datatables.net/examples/basic_init/scroll_x.html    browser=CHROME
    Maximize Browser Window 
    Set Selenium Implicit Wait    30s
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr 
    
    Execute Javascript    document.querySelectorAll('[class="dataTables_scrollBody"]')[0].scrollBy(900,0)
    FOR    ${i}    IN RANGE    1    ${rowcount}+1       
            ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[9]
            Log To Console    ${name}               
    END
    Log To Console    ----------------------
    

