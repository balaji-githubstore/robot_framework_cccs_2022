*** Settings ***
Library     SSHLibrary

*** Test Cases ***
TC1
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    Enable SSH Logging	myserver.log  
    
    Put File    source=D:\\MailId for Camp.txt    destination=C:\\MailId for Camp.txt
    # Directory Should Exist    path=C:\\android

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


TC5
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    Get File    source=C:\\users\\jidi\\.ssh\\id_rsa   destination=D:\\id_rsa
   

TC6
    Open Connection    host=192.168.1.7    port=22
    ${output}    Login With Public Key    username=jidi    keyfile=D:\\id_rsa    password=${EMPTY}
    Log To Console    ${output} 
    # Enable Ssh Logging    ${EXECDIR}${/}files${/}myserver.log
    # @{directories}    List Directories In Directory    path=C:${/}
    # Log To Console    ${directories}

TC7
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    Enable Ssh Logging    myserver.log
    ${written}=	Write	where python	
    Log To Console    ${written}
    ${output}=	Read
    Log To Console    ${output}

TC8
    Open Connection    host=192.168.1.7    port=22  
    Login    username=jidi    password=123456
    ${stdout}=	Start Command  	python -c print('Hello, world!')
    Log To Console    ${stdout}

