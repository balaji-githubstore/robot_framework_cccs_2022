*** Settings ***
Library     RPA.PDF
Library    Collections
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
TC1
      ${text}    Get Text From Pdf    D:\\Agreement.pdf
    Log To Console    pdftotextdic
    Log To Console    ${text}
    Log To Console    ----------------------------------
    # Log To Console    ${text}[0]

    ${keys}    Get Dictionary Keys    ${text}
    Log To Console    Page 1 data using Get Dictionary Keys
    Log To Console     ${keys}[0]
#    Log To Console    ${text}[${keys}[0]]


TC2
    &{figs}    Get All Figures    D:\\Agreement.pdf
    Log To Console    ${figs}
    Log To Console    ----------------------------------
    ${page1}    Convert To Number    1
    Log To Console    ${figs}[${page1}]
    ${page2}    Convert To Number    21
    Log To Console    ${figs}[${page1}][${page2}]
    ${file}     Save Figure As Image    figure=${figs}[${page1}][${page2}]
    Log To Console    ${file}

TC4
    Open Pdf    D:\\Agreement.pdf
    ${value}=  Get Text From Pdf
    Log To Console    ${value}

     ${value}=  Get Pdf Info
    Log To Console    ${value}
    ${names}    Save Figures As Images    source_path=D:\\Agreement.pdf     images_folder=${EXECDIR}\\images
    Log To Console    ${names}

#get all figures and save image
TC5
    &{figs}    Get All Figures    D:\\Agreement.pdf
    Log To Console    ${figs}

    ${pagekeys}     Get Dictionary Keys    ${figs}
    Log To Console    ${pagekeys}

    FOR    ${pagekey}    IN    @{pagekeys}

        Log To Console    ${figs}[${pagekey}]
        &{dic}  Convert To Dictionary    ${figs}[${pagekey}]
        ${imagekeys}     Get Dictionary Keys    ${dic}
        Log To Console    ${imagekeys}

        FOR    ${imagekey}    IN    @{imagekeys}
            Log To Console    ${imagekey}
            Save Figure As Image    figure=${figs}[${pagekey}][${imagekey}]    images_folder=${EXECDIR}\\images    file_prefix=AAA_${imagekey}
        END
    END
#    ${p}    Convert To Number    1
#    ${i}    Convert To Number    39
#    ${out}  Save Figure As Image    figure=${figs}[${p}][${i}]    images_folder=${EXECDIR}\\images    file_prefix=img12_${imagekey}
#    Log To Console    ${out}