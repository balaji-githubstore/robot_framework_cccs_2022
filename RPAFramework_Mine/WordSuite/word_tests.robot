*** Settings ***
Library    RPA.Word.Application

*** Test Cases ***
Create doc file
    Open Application
    Create New Document
    Write Text          Extra Line Text
    Write Text          Another Extra Line of Text
    Save Document AS    ${EXECDIR}\\testdata\\data.docx
    ${texts}           Get all Texts
    Log To Console    ${texts}    
    # Close Document
    Quit Application    
 
Open Read As Text
    Open Application
    Open File           ${EXECDIR}\\testdata\\data.docx
    ${text}    Get All Texts
    Log To Console    pdftotextdic    
    Log To Console    ${text} 
    Log To Console    ----------------------------------    
   
Open existing file And Sava As New Doc
    Open Application
    Open File           ${EXECDIR}\\testdata\\data.docx
    Write Text          Extra Line Text123
    Write Text          Another Extra Line of Text123
    Save Document AS    ${EXECDIR}{/}new.docx
    ${texts}           Get all Texts
    Close Document
        
   
Open existing file
    Open Application
    Open File           ${EXECDIR}\\testdata\\data.docx
    Write Text          Extra Line Text123
    Write Text          Another Extra Line of Text123
    # Save Document AS    ${EXECDIR}\\testdata\\data.docx
    Save Document
    ${texts}           Get all Texts
    # Close Document
    Quit Application    