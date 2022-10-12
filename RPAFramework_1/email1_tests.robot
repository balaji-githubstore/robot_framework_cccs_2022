*** Settings ***
Library    RPA.Email.ImapSmtp

*** Variables ***
${GMAIL_ACCOUNT}        shinebrightanytime@gmail.com
${GMAIL_PASSWORD}       balaji0017
${RECIPIENT_ADDRESS}    balaji0017@gmail.com
${BODY_IMG1}            D:\\BDD Feedback.png
${BODY_IMG2}            ${EXECDIR}${/}img${/}logo.png
${EMAIL_BODY}     <h1>Heading</h1><p>Status: <img src='BDD Feedback.png' alt='google image1'/></p>
...               <p>INVOICE: <img src='logo.png' alt='google image2'/></p>
${attachment1}    D:\\Agreement.pdf
${attachment2}    D:\\Agreement.pdf
*** Test Cases ***
TC1 Sending email
    Authorize    account=shinebrightanytime@gmail.com     password=balaji@12345    smtp_server=smtp.gmail.com
    ...     imap_server=imap.gmail.com    smtp_port=587    imap_port=993
    
    Send Message  sender=shinebrightanytime@gmail.com
    ...           recipients=balaji0017@gmail.com
    ...           subject=Message from RPA Robot
    ...           body=RPA Robot message body
    
Sending Text HTML IMAGE email
    [Documentation]     Sending email with HTML content and attachment
    Authorize    account=shinebrightanytime@gmail.com     password=balaji@12345    smtp_server=smtp.gmail.com
    ...     imap_server=imap.gmail.com    smtp_port=587    imap_port=993
        
    Send Message
    ...    sender=${GMAIL_ACCOUNT}
    ...    recipients=${RECIPIENT_ADDRESS}
    ...    subject=HTML email with body images (2) plus one attachment
    ...    body=${EMAIL_BODY}
    ...    html=true
    ...    images=${BODY_IMG1}
    ...    attachments=${attachment1},${attachment2}

ReadMessage
    Authorize    account=balaji0017@gmail.com     password=dinakaran    smtp_server=smtp.gmail.com
    ...     imap_server=imap.gmail.com    smtp_port=587    imap_port=993
    @{emails}  List Messages  SUBJECT "Critical security alert"

    Log To Console    ${emails}
    Log To Console    ----------------
    FOR  ${email}  IN  @{EMAILS}
        Log To Console    ${email}[Subject]
        Log To Console    ${email}[From]
        Log To Console    ${email}[Date]
        Log To Console    ${email}[Delivered-To]
        Log To Console    ${email}[Received]
        Log To Console    ${email}[Has-Attachments]
    END
