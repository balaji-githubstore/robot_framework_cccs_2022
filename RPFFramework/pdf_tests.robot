*** Settings ***
Library    RPA.PDF
Library    Collections

#Will start by 12:05
*** Test Cases ***
TC1
    ${output}   Get Text From Pdf   D:\\B-Mine\\Company\\Appium.pdf
#    &{output}   Convert To Dictionary    ${output}
#    All page text in dic
    Log To Console    ${output}

    #get text from page2
#    ${pagenumber}   Convert To Integer    4
#    Log To Console    ${output}[${pagenumber}]

#    FOR    ${dic}    IN    @{output}
#        Log To Console    ${output}[${dic}]
#    END
     ${keys}      Get Dictionary Keys     ${output}
      FOR    ${key}    IN    @{keys}
       Log To Console    ${output}[${key}]
    END

    ${values}    Get Dictionary Values    ${output}
    FOR    ${value}    IN    @{values}
       Log To Console    ${value}
    END

TC2
    Open Pdf    D:\\B-Mine\\Company\\Appium.pdf
    ${page_count}    Get Number Of Pages 
    Log To Console    ${page_count}

TC3
    ${images}   Save Figures As Images      source_path=D:\\Agreement.pdf     images_folder=${EXECDIR}\\Images
    Log To Console    ${images}

TC4
    ${figs}     Get All Figures     source_path=D:\\Agreement.pdf 
    Log To Console    ${figs}
    ${pagekey1}    Convert To Integer    1
    Log To Console    ${figs}[${pagekey1}]
    ${figkey1}    Convert To Integer    1
    Log To Console    -------------
    Log To Console    ${figs}[${pagekey1}][${figkey1}]
#    Set Local Variable    ${fig2}   <RPA.PDF.keywords.model.Figure object at 0x0000027D23DFDA30>

    Save Figure As Image    ${figs}[${pagekey1}][${figkey1}]    images_folder=${EXECDIR}\\Images        file_prefix=my
