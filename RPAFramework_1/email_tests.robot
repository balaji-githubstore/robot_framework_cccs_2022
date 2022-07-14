*** Settings ***
Library     RPA.Email.ImapSmtp
# ...    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${BODY_IMG1}            ${EXECDIR}${/}img${/}logo.png

${EMAIL_BODY}     <h1>Heading</h1><p>Status: <img src='${BODY_IMG1}' alt='approved image'/></p>
...               <p>INVOICE: <img src='${BODY_IMG1}' alt='invoice image'/></p>

*** Test Cases ***
Sending Text email
    Authorize    account=shinebrightanytime@gmail.com    password=balaji@12345
    ...    smtp_server=smtp.gmail.com    imap_server=imap.gmail.com    smtp_port=587    imap_port=993
    Send Message    sender=shinebrightanytime@gmail.com
    ...           recipients=balaji0017@gmail.com
    ...           subject=Message from RPA Robot

Sending Text HTML IMAGE email
    Authorize    account=shinebrightanytime@gmail.com    password=balaji@12345
    ...    smtp_server=smtp.gmail.com    imap_server=imap.gmail.com    smtp_port=587    imap_port=993

    Send Message    sender=shinebrightanytime@gmail.com
    ...           recipients=balaji0017@gmail.com
    ...           subject=Message from RPA Robot
    ...           body=RPA Robot message body ${EMAIL_BODY}
    ...    html=true
    ...    images=${BODY_IMG1}