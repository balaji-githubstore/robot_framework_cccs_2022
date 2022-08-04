*** Settings ***
Library     SSHLibrary

*** Test Cases ***
TC1
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    Enable SSH Logging	myserver.log  
    
    Put File    source=D:\\MailId for Camp.txt    destination=C:\\MailId for Camp.txt
    Directory Should Exist    path=C:\\android

TC2
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    ${stdout}=	Execute Command  git --version
    Log To Console    ${stdout}

TC3
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    ${stdout}=	Execute Command  appium -p 7272
    Log To Console    ${stdout}
    ${stdout}    Get Connection
    Log To Console    ${stdout}
     ${stdout}    Get Connections
    Log To Console    ${stdout}

TC4
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    Get Directory    source=C:\\mine\\temp    destination=E:\\mine\\temp
    ${stdout}    Read
    Log To Console    ${stdout}