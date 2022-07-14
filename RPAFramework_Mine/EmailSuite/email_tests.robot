*** Settings ***
Library     RPA.Email.ImapSmtp
# ...    smtp_server=smtp.gmail.com    smtp_port=587


*** Variables ***
${BODY_IMG1}        ${EXECDIR}${/}img${/}logo.png

${EMAIL_BODY}       <h1>Heading</h1><p>Status: <img src='logo.png' alt='approved image'/></p>
...                 <p>INVOICE: <img src='${EXECDIR}${/}img${/}logo.png' alt='invoice image'/></p>


*** Test Cases ***
Sending Text email
    Authorize    account=shinebrightanytime@gmail.com    password=balaji0017
    ...    smtp_server=smtp.gmail.com    imap_server=imap.gmail.com    smtp_port=587    imap_port=993
    Send Message    sender=shinebrightanytime@gmail.com
    ...    recipients=balaji@gmail.com
    ...    subject=Message from RPA Robot

Sending Text HTML IMAGE email
    Authorize    account=shinebrightanytime@gmail.com    password=balaji0017
    ...    smtp_server=smtp.gmail.com    imap_server=imap.gmail.com    smtp_port=587    imap_port=993

    Send Message    sender=shinebrightanytime@gmail.com
    ...    recipients=balaji0017@gmail.com
    ...    subject=Message from RPA Robot
    ...    body=RPA Robot message body${EMAIL_BODY}
    ...    html=true
    ...    images=${BODY_IMG1}

ReadMessage
    Authorize    account=shinebrightanytime@gmail.com    password=balaji@12345    smtp_server=smtp.gmail.com
    ...    imap_server=imap.gmail.com    smtp_port=587    imap_port=993
    @{emails}    List Messages    SUBJECT "Critical security alert"

    Log To Console    ${emails}
    Log To Console    ----------------
    FOR    ${email}    IN    @{EMAILS}
        Log To Console    ${email}[Subject]
        Log To Console    ${email}[From]
        Log To Console    ${email}[Date]
        Log To Console    ${email}[Delivered-To]
        Log To Console    ${email}[Received]
        Log To Console    ${email}[Has-Attachments]
    END
