*** Settings ***
Library    SeleniumLibrary 
Library    OperatingSystem         
 
*** Test Cases ***

CreateWebDriverTest
    #Use below to setup chromedriver
   # Create Webdriver    Chrome    executable_path=D:\\Mine\\Company\\Tieto\\chromedriver.exe
   Log To Console    	${CURDIR}${/}driver${/}chromedriver.exe 
   Log To Console    ${CURDIR} 
   Log To Console    ${OUTPUT_DIR}
   Log To Console    ${TEMPDIR}   
   Create Webdriver    Chrome    executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
   Go To    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default
   Sleep    3s
   Close All Browsers
   
OpenBrowserTest
    #below take chromedriver from path variable
   #set in environment path
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Sleep    3s
   Close All Browsers
      
OpenBrowserSetPathLocalTest
   #set in environment path
   Append To Environment Variable    PATH    C:\\Components
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Sleep    3s
   Close All Browsers
   
*** Test Cases ***
OpenBrowserSetRelativePathLocalTest
    Append To Environment Variable    ../driver/chromedriver.exe    
    Open Browser    browser=chrome    
    Maximize Browser Window
    Go To    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default

OpenBrowserBinaryLocationTest
   #set in environment path through code
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome    options=binary_location="D:\\Mine\\Company\\Tieto"
   Sleep    3s
   Close All Browsers
   
OpenEMRTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window
   Set Browser Implicit Wait    20
   Input Text    name=authUser   admin
   Input Password    id=clearPass    pass
   Select From List By Label    name=languageChoice    English (Indian)
   # Click Element    xpath=//button   
   Press Keys    id=clearPass   ENTER
   Mouse Over    xpath=//*[text()='Patient/Client']
   Click Element    xpath=//*[text()='Patients']
   Select Frame    name=fin
   #Wait Until Location Is    xpath=//*[text()='Add New Patient']    40
   Sleep    5s 
   Click Element    xpath=//*[text()='Add New Patient']   
   Unselect Frame    
   Click Element    xpath=//*[text()='Billy']
   Click Element    xpath=//*[text()='Logout']
   Sleep    5s     
   Close All Browsers  
   
LoginValidCredentialTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window
   Set Browser Implicit Wait    20
   Input Text    name=authUser   admin
   Input Password    id=clearPass    pass
   Select From List By Label    name=languageChoice    English (Indian)
   Click Element    xpath=//button      
   Click Element    xpath=//*[text()='Billy']
   Click Element    xpath=//*[text()='Logout']
   Sleep    5s     
   Close All Browsers    
   
FrameHDFCTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://netbanking.hdfcbank.com/netbanking/    chrome
   Maximize Browser Window
   Set Browser Implicit Wait    10
   Frame Should Contain    name=login_page    fldLoginUserId
   Select Frame    name=login_page 
   Input Text    name=fldLoginUserId    test123   
   Input Text    name=fldLoginUserId    bala123  
   Clear Element Text    name=fldLoginUserId
   Input Text    name=fldLoginUserId    test123    
   Click Image    //*[@alt='continue']    
   Unselect Frame     
 
GetTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window
   Set Browser Implicit Wait    20
   Input Text    name=authUser   admin
   Input Password    id=clearPass    pass
   Select From List By Label    name=languageChoice    English (Indian)
   ${title}    Get Title
   Log   ${title}   
   ${titles}    Get Window Titles    
   Log   ${titles} 
   ${attribute}    Get Element Attribute    name=authUser    placeholder
   Log   ${attribute} 
   ${text}    Get Text    xpath=//a
   Log   ${text}  
   ${value}    Get Value    name=authUser
   Log    ${value}   
   ${url}    Get Location 
   Log    ${url}
   ${svalue}    Get Selected List Label    name=languageChoice
   Log    ${svalue}
   Sleep    3s    
   Log To Console    Check below details    
   Log To Console    ${title} 
   Log To Console    ${titles} 
   Log To Console    ${attribute}
   Log To Console    ${text}   
   Log To Console    ${value}
   Log To Console    ${url}
   Log To Console    ${svalue}
   Log To Console    End here     
   Close All Browsers
   
GetWindowSizeTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window    
   ${width}    ${height}    Get Window Size
   Log To Console    type        
   Log To Console    ${width} 
   Log To Console    ${height} 
   #interger convert
   # ${width}   Convert To Integer    ${width}
   ${width}    Evaluate    ${width}/3
   #decimal convert with 3 decimal point
   # ${width}   Convert To Number    ${width}    3
   ${height}    Evaluate    ${height}/2
   Log To Console    ${width}
   Log To Console    ${height}
   Set Window Size   ${width}    ${height}
   Sleep    5s    
   Close All Browsers  
     
BooleanTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window
   Element Should Be Visible   //a
   Element Should Be Enabled    //button
   Close All Browsers 
  
MultipleTabTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window
   ${excludes}    Get Window Handles 
   Log To Console    ${excludes} 
   Click Element   //a
   ${titles}    Get Window Titles      
   Log To Console    ${titles}     
   ${windows}    Get Window Handles  
   Log To Console    ${windows} 
   ${title}    Get Title
   Log To Console   ${title}
   Log To Console    -------------------- 
   #switch to new window using title   
   Switch Window    Acknowledgments, Licensing and Certification
   Title Should Be    Acknowledgments, Licensing and Certification   
   ${title}    Get Title
   Log To Console   ${title} 
    #switch to MAIN   
   Switch Window    MAIN
   Title Should Be    OpenEMR Login   
   ${title}    Get Title
   Log To Console   ${title} 
    #switch to NEW   
   Switch Window    NEW
   Title Should Be    Acknowledgments, Licensing and Certification   
   ${title}    Get Title
   Log To Console   ${title} 
   # switch to new window using window handle
   Log To Console    ${excludes}    
   Switch Window     ${excludes}  
   Title Should Be    Acknowledgments, Licensing and Certification  
   ${title}    Get Title
   Log To Console   ${title}
   Close All Browsers 
   
CloseWindowBrowserTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://www.online.citibank.co.in/products-services/online-services/internet-banking.htm    chrome
   Maximize Browser Window
   Click Element    partial link=APPLY FOR
   Close Window
   
CitiTabTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://www.online.citibank.co.in/products-services/online-services/internet-banking.htm    chrome
   Maximize Browser Window
   Click Element    partial link=APPLY FOR
   Click Link    Login    
   Switch Window    NEW
   Click Element    link=Travel 
   Switch Window    Citibank India
   Click Link    Online identity fraud / phishing    
   Switch Window    Online Security - Why you need to be aware of online fraud?
   ${actualvalue}    Get Text    //*[@class='overview']
   Log To Console    ${actualvalue}    
   Close Browser
 
AlertTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    http://echoecho.com/javascript4.htm    ff
   Maximize Browser Window
   Sleep    5s    
   Click Button    name=B3
   Sleep    2s
   ## accept the alert
   #Handle Alert
   
   ## dismiss the alert
   # Handle Alert    action=DISMISS
   
   ## Default time --> Alert not found in 5 seconds.
   # Handle Alert    timeout=10s
   
   ## get text and accept alert
   # ${message}    Handle Alert    
   # Log To Console    ${message}    
   
    ## get text and Leave alert
   # ${message}    Handle Alert   LEAVE
   # Log To Console    ${message}  
   # Sleep    3s
   
   ## verify the alert text
   # Alert Should Be Present    This is an alert box!    LEAVE    10s
   # Sleep    3s
   
   ## input text to prompt box  
   Input Text Into Alert    HelloWorld      LEAVE  
   Sleep    3s
   Close Browser
   
NavigateBrowserTest  
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://google.com    chrome
   Maximize Browser Window
   # Go To    https://google.com
   Click Element    xpath=//a
   Sleep    5s
   Go Back
   Sleep    5s   
   Press Keys  //a  ALT+ARROW_Right
   Sleep    5s 
   Press Keys  //title[contains(text(),'Gmail')]  ALT+ARROW_Left
   Sleep    15s
   Close Browser
   
AssertTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://google.com    chrome
   Maximize Browser Window
   ${title}    Get Title
   Should Be Equal    ${title}    google  hello-${title}    ignore_case=True
   Close Browser    
 
WaitTest
    Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://google.com    chrome
   Maximize Browser Window
   Wait Until Page Contains Element    //a[text()='Gmail']    50
   Wait Until Element Contains    //a    Gmail    10
   Wait Until Page Contains    Gmail    15
   Click Link    Gmail
   Sleep    5s    
   Close Browser
       
GetElementsTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    browser=chrome
   Maximize Browser Window
   Go To    https://google.com 
   Wait Until Page Contains    q
   Log To Console    print
   
   ## count of matching locator
   ${count}    Get Element Count    //a
   Log To Console    ${count}
   
   ## ids of all link   
   ${links}    Get All Links
   Log To Console    ${links}
   
   ##Count of collection item 'sbfblt' present
   ${countofItem}    Get Count     ${links}    sbfblt
   Log To Console    ${countofItem}

   #drop down text will be listed
   # ${texts}    Get List Items    //select    
   # Log To Console    ${texts}
   
   ${aelement}    Get WebElement    //a
   Log To Console     ${aelement} 
   
   ${elements}    Get WebElements    //a
   Log To Console     ${elements} 
   
   FOR    ${element}    IN    @{elements}
           ${element}    Get Text  ${element}
           Log To Console    ${element}
   END
   
   Log To Console    -------------------------
   ##click on when 
   FOR    ${element}    IN    @{elements}  
      ${txt}    Get Text  ${element}
      Continue For Loop If    '${txt}'!='Images'   
           Log To Console    ${txt}
           Click Element    ${element}    
      Exit For Loop
   END
   Close Browser
   
MagetnoLinkTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    browser=chrome
   Maximize Browser Window
   Go To    https://magento.com 
   
   ${LISTELEMENTS}    Get WebElements    //a
   
    FOR    ${element}    IN    @{LISTELEMENTS}
        ${txt}    Get Text    ${element}
        ${att}    Get Element Attribute    ${element}    data-adobe-name
        Exit For Loop if    '${txt}' == 'Community' and '${att}' == 'Header|GlobalNav|CommunityClick'
    END  
    Log To Console    ${txt} 
    Click Element    ${element}    
   Close Browser
   
 JavaScriptTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window
   Set Browser Implicit Wait    20
   # Input Text    name=authUser   admin
   # Input Password    id=clearPass    pass
   Execute Javascript    document.getElementById('authUser').value='admin'
   
   ${ele}    Get WebElement    id=clearPass
   Execute Javascript    arguments[0].value='pass';     ARGUMENTS    ${ele}
   
   Select From List By Label    name=languageChoice    English (Indian)
   Click Element    xpath=//button  
   # Execute Javascript    alert(arguments[0]);    ARGUMENTS    123 
   
   Execute Javascript    document.evaluate("//*[text()='Patients']",document.body,null,9,null).singleNodeValue.click();
   Sleep    5s  
   
   Execute Javascript    document.querySelector('[data-bind="click: changePassword"]').click();
   Sleep    5s
   
   ${ele}    Get WebElement    //*[text()='Logout']
   Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele} 
   Sleep    5s 
   Close Browser
   

JavaScriptReturnTest
   Append To Environment Variable    PATH    C:\Components
   Open Browser    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    chrome
   Maximize Browser Window
   Set Browser Implicit Wait    20
   # Input Text    name=authUser   admin
   # Input Password    id=clearPass    pass
   Execute Javascript    document.getElementById('authUser').value='admin'
   ${out}    Execute Javascript    return document.getElementById('authUser').value
   Log To Console    ${out}    
   ${ele}    Get WebElement    id=clearPass
   Execute Javascript    arguments[0].value='pass';     ARGUMENTS    ${ele}
   ${out}    Execute Javascript    return arguments[0].value;     ARGUMENTS    ${ele}
   Log To Console    ${out} 
   
MouseActionTest
   Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   Open Browser    https://www.shriramcity.in/    chrome
   Maximize Browser Window
   Set Browser Implicit Wait    20
   Click Element    class=close    
   Mouse Over    //*[contains(text(),'Products')]
   Sleep    2s    
   Mouse Over    //a[contains(text(),'Loans')]
   Sleep    1s    
   Click Element    //*[contains(text(),'Two Wheeler Loans')]    
   Sleep    3s    
   Close Browser
   
# UploadTest
   # Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   # Open Browser    file:///C:/Users/Balaji/Desktop/upload.html    chrome
   # Choose File    id=hello    D:\\Mine\\Company\\Maveric\\Docs\\Day1.txt
   # Sleep    5s    
   # Send    hello
   # Send    {TAB}
   # Send    passw
   # Send    {ENTER}
   # Close Browser
   
# AutoITUploadTest
   # Append To Environment Variable    PATH    D:\\Mine\\Company\\Tieto
   # Open Browser    http://demo.guru99.com/test/basic_auth.php    chrome
   # Sleep    5s    
   # Send    guru99
   # Send    {ENTER}
   # Send    guru99
   # Send    {ENTER}
   # Sleep    5s
   # Close Browser
   
# options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors")
# options=binary_location="/path/to/binary";add_argument("remote-debugging-port=port")
Notification
   Append To Environment Variable    PATH    C:\\Components
   Open Browser    https://www.redbus.in/    chrome    options=add_argument("--disable-notifications")
   Maximize Browser Window
   Set Browser Implicit Wait    20
 
   
HeadlessChromeBrowser
   Append To Environment Variable    PATH    C:\\Components
   Open Browser    https://www.google.com/    chrome    options=add_argument("--disable-notifications");add_argument("--Headless")
   Maximize Browser Window
   Set Browser Implicit Wait    20
   ${title}    Get Title
   Log To Console    ${title}    
   Close Browser

 HeadlessFFBrowser
   Append To Environment Variable    PATH    C:\\Components
   Open Browser    https://www.google.com/    ff    options=add_argument("--disable-notifications");add_argument("--Headless")
   Maximize Browser Window
   Set Browser Implicit Wait    20
   ${title}    Get Title
   Log To Console    ${title}    
   Close Browser
   
GETUSERNAMEDOWNLOADDIR
    Append To Environment Variable    PATH    C:\\Components
    Open Browser    https://chromedriver.storage.googleapis.com/index.html?path=90.0.4430.24/    chrome  
    Set Selenium Implicit Wait    20s
    Click Element    partial link=chromedriver_win3  
    Sleep    10s    
    ${title}    Get Environment Variable    USERNAME    
    Log To Console    ${title} 
    @{items}    List Directory    C:\\Users\\JiDi\\Downloads 
    File Should Exist    C:\\Users\\JiDi\\Downloads\\chromedriver_win32.zip  
   
DownloadWorking
    Append To Environment Variable    PATH    C:\\Components
    ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=c:\\your\\directory
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${chromeOptions}
  

Downloadgoogle
    ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=${EXECDIR}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    # Call Method    ${chromeOptions}    add_argument    --lang\=${browserLocale}
    Call Method    ${chromeOptions}    add_argument    --headless
    Call Method    ${chromeOptions}    add_argument    --window-size\=1024,768
    Call Method    ${chromeOptions}    add_argument    --disable-gpu
    ${webdriverCreated} =    Run Keyword And Return Status    Create Webdriver    Chrome    chrome_options=${chromeOptions}
    Run Keyword Unless    ${webdriverCreated}    Create Webdriver    Chrome    chrome_options=${chromeOptions}
    
DownloadNotWorking
   ${dic}    Create Dictionary    download.default_directory=c:\\your\\directory
   ${cap}    Create Dictionary      chromeOptions=${dic}
   Append To Environment Variable    PATH    C:\\Components
   Open Browser    https://www.google.com/    chrome    desired_capabilities=${cap}
   Maximize Browser Window
   Set Browser Implicit Wait    20
   
DownloadDirectoryChangeForSession
   Append To Environment Variable    PATH    C:\\Components
   ${prefs} =    Create Dictionary    download.default_directory=C:\\Balaji
   Open Browser    https://www.google.com/    chrome    options=add_experimental_option("prefs",${prefs})
   Maximize Browser Window
   Set Browser Implicit Wait    20
   
SaveFile
    Append To Environment Variable    PATH    C:\\Components
    Open Browser    https://google.com    chrome
    ${src}    Get Source
    Create File    ${EXECDIR}\\data\\file1.html    ${src}
    Append To File    ${EXECDIR}\\data\\file.html    content        

