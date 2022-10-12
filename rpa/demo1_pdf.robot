*** Settings ***
Library    RPA.PDF
Library    Collections


*** Test Cases ***
TC1
    Open Pdf    source_path=D:\\Mine\\Balaji-Profile_2022.pdf
    ${page_count}    Get Number Of Pages
    Log To Console    ${page_count}

    &{text}    Get Text From Pdf
    Log     ${text}

    ${page1}    Convert To Integer    1
    Log    ${text}[${page1}]

   @{keys}     Get Dictionary Keys    ${text}
   Log    ${keys}

# will start at 3:40 PM IST
    