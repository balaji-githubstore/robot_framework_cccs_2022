*** Settings ***
Library     AutoItLibrary  
Library    SeleniumLibrary      
Library    OperatingSystem    

*** Test Cases ***
TC1_SeleniumUpload
    Append To Environment Variable    PATH    C:\\Components    
    Open Browser    url=https://www.naukri.com/    browser=chrome
    Maximize Browser Window   
    Set Selenium Implicit Wait    30s
    Choose File    //*[@id='file_upload']    D:\\B-Mine\\Company\\Company\\Ericsson\\AssignmentSelenium_2.docx
    Wait Until Page Contains    uploaded Successfully    50s
    Page Should Contain    uploaded Successfully    
    
AutoitType
   Append To Environment Variable    PATH    C:\\Components
   Open Browser    http://demo.guru99.com/test/basic_auth.php    chrome
   Sleep    5s    
   Send    guru99
   Send    {ENTER}
   Sleep    5s 
   Send    guru99
   Send    {ENTER}
   Sleep    5s
   Close Browser
   
# Sleep(3000)
# ControlFocus("Open","","Edit1")
# ControlSetText("Open","","Edit1","D:\B-Mine\Company\Company\ABC\Doc\Appium Notes_Apr.docx")
# ControlClick("Open","","Button1")
UploadTest
   Append To Environment Variable    PATH    C:\\Components
   Open Browser    url=https://www.naukri.com/        browser=chrome
   Maximize Browser Window
   Set Selenium Implicit Wait    20s
   Click Element    //*[@id='wdgt-file-upload']
   Sleep    5s    
   Control Focus    Open    ${EMPTY}    Edit1
   Sleep    2s    
   Control Set Text    Open    ${EMPTY}    Edit1    D:\\B-Mine\\Company\\Company\\ABC\\Doc\\Appium Notes_Apr.docx
   Sleep    2s 
   Control Click    Open    ${EMPTY}    Button1
  
   







