*** Settings ***
Library    RPA.PDF
Library    Collections    

*** Test Cases ***
Read As Text
    ${text}    Get Text From Pdf    D:\\B-Mine\\Company\\github-git-cheat-sheet.pdf
    Log To Console    pdftotextdic    
    Log To Console    ${text} 
    Log To Console    ----------------------------------        
    # Log To Console    ${text}[0]    
    
    Log To Console    Page 1 data using convert to integer  
    ${p1}    Convert To Integer    1    
    Log To Console    ${text}[${p1}]        
    Log To Console    ----------------------------------    


    ${keys}    Get Dictionary Keys    ${text} 
    Log To Console    Page 1 data using Get Dictionary Keys 
    Log To Console     ${keys}[0]    
    Log To Console    ${text}[${keys}[0]]
   Log To Console    ---------------------------------- 
     
     
    ${keys}    Get Dictionary Keys    ${text}
    Log To Console    Page All page data using Get Dictionary Keys
    FOR    ${key}    IN    @{keys}
        Log To Console     Page ${key}    
        Log To Console    ${text}[${key}]
        Log To Console    ------------
    END  
     Log To Console    ---------------------------------- 
    
    Log To Console    log to Report    
    Log Dictionary    ${text}    
    Close Pdf    
    

# GetFigs
    # ${figs}    Get All Figures    D:\\B-Mine\\Company\\Appium Learning Document.pdf 
    # Save Figures As Images    D:\\B-Mine\\Company\\github-git-cheat-sheet.pdf    ${EXECDIR}\\img\\
    # Save Figure As Image    ${figs}[] 
    # ${page1}    Convert To Integer    1
    # ${img1}    Convert To Integer    42      
    # Log To Console    ${figs}[${page1}][${img1}]
    # Save Figure As Image    ${figs}[${page1}][${img1}]    ${EXECDIR}\\testdata\\    


GetFigs
    &{figs}    Get All Figures    D:\\Agreement.pdf
    Log To Console    ${figs}
    Log To Console    ----------------------------------
    ${page1}    Convert To Number    1
    Log To Console    ${figs}[${page1}]
    ${page2}    Convert To Number    21
    Log To Console    ${figs}[${page1}][${page2}]
    ${file}     Save Figure As Image    figure=${figs}[${page1}][${page2}]
    Log To Console    ${file}

SaveFigINapge
    ${names}    Save Figures As Images    D:\\Agreement.pdf     ${EXECDIR}\\images      3       img
    Log To Console    ${names}
    
SaveAllImages
    Open Pdf    D:\\Agreement.pdf
    ${value}=  Get Text From Pdf
    Log To Console    ${value}

     ${value}=  Get Pdf Info
    Log To Console    ${value}
    ${names}    Save Figures As Images    source_path=D:\\Agreement.pdf     images_folder=${EXECDIR}\\images
    Log To Console    ${names}
    

#get all figures and save image
GetAllImagesAndSave
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
