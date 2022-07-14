*** Settings ***
Library    SeleniumLibrary 
Library    OperatingSystem     
Library    ../Python/img_comp.py     
Library    Images   
 
Library    ../Python/pythoncode.py    
*** Test Cases ***
SaveFile
    Append To Environment Variable    PATH    C:\\Components
    Open Browser    https://google.com    chrome
    ${src}    Get Source
    Create File    ${EXECDIR}\\data\\file.html    ${src}
    Append To File    ${EXECDIR}\\data\\file.html    content 
    

ScreenShot And Python Image Compare
    Append To Environment Variable    PATH    C:\\Components
    Open Browser    https://google.com    chrome
    Set Screenshot Directory    ${EXECDIR}\\img
    Capture Element Screenshot    //*[@alt="Google"]    ${EXECDIR}\\img\\newlogo.png  
    Sleep    2s    
    ${res}    Img Comp    ${EXECDIR}\\img\\logo.png        ${EXECDIR}\\img\\newlogo.png 
    Log To Console    ${res} 
    
  
  
PixcelColor 
    ${point}    Get Point    10    10
    Log To Console    ${point}    
    ${rgb}    Get Pixel Color In Image    images=${EXECDIR}\\img\\newlogo.png    point=${point}
    Log To Console     ${rgb}       
    