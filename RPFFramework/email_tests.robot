*** Settings ***
Library     RPA.Email.ImapSmtp


*** Variables ***
#${GMAIL_ACCOUNT}        ACCOUNT_NAME
#${GMAIL_PASSWORD}       ACCOUNT_PASSWORD
#${RECIPIENT_ADDRESS}    RECIPIENT
${BODY_IMG1}            ${EXECDIR}${/}Images${/}image4.jpeg
${BODY_IMG2}            ${EXECDIR}${/}Images${/}image6.jpeg
${EMAIL_BODY}     <h1>Heading</h1><p>Status: <img src='image4.png' alt='approved image'/></p>
...               <p>INVOICE: <img src='image6.png' alt='invoice image'/></p>
${attachment}        D:\\Agreement.pdf

*** Test Cases ***

Sending HTML Email With Image
    [Documentation]     Sending email with HTML content and attachment
    Authorize   account=shinebrightanytime@gmail.com    password=balaji@12345
    ...     smtp_server=smtp.gmail.com  smtp_port=587   imap_server=imap.gmail.com     imap_port=993
    Send Message
    ...                 sender=shinebrightanytime@gmail.com
    ...                 recipients=balaji0017@gmail.com
    ...                 subject=HTML email with body images (2) plus one attachment
    ...                 body=${EMAIL_BODY}
    ...                 html=${TRUE}
    ...                 images=${BODY_IMG1}, ${BODY_IMG2}
    ...                 attachments=${attachment}

TC1
    Authorize   account=shinebrightanytime@gmail.com    password=balaji@12345
    ...     smtp_server=smtp.gmail.com  smtp_port=587   imap_server=imap.gmail.com     imap_port=993
    Send Message    shinebrightanytime@gmail.com    balaji0017@gmail.com
    ...     subject=RPATest
    ...     body=Hello


TC2
    Authorize   account=shinebrightanytime@gmail.com    password=balaji@12345
    ...     smtp_server=smtp.gmail.com  smtp_port=587   imap_server=imap.gmail.com     imap_port=993
    @{emails}  List Messages  SUBJECT "critical"
    FOR  ${email}  IN  @{EMAILS}
        Log To Console    ${email}[Subject]
        Log To Console      ${email}[Body]
    END

