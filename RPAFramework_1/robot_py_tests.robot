*** Settings ***
Library    ../Python/pdf_com.py
Library    ../Python/img_comp.py

*** Test Cases ***
TC1_PDF_Comp
    ${res}    Pdf Comp    D:\\Agreement.pdf    D:\\Agreement.pdf
    Log To Console    ${res}

TC2_IMG_Comp
    ${res}    Img Comp    D:\\B-Mine\\Company\\Image92 - Copy.png    D:\\B-Mine\\Company\\Image92.png
    Log To Console    ${res}

#TC2_IMGWrong_Comp
#    ${res}    Img Comp    D:\\B-Mine\\Company\\Image91.png    D:\\B-Mine\\Company\\Image92.png
#    Log To Console    ${res}