*** Settings ***
Library    RPA.Email.ImapSmtp
*** Test Cases ***
TC1
    Authorize    account=balaji0017@gmail.com    password=dinakaran    smtp_server=smtp.gmail.com
    ...    imap_server=imap.gmail.com
    ...    smtp_port=587
    ...    imap_port=993
    Send Message     sender=balaji0017@gmail.com    recipients=balaji007@gmail.com    
    ...    subject=CHECK    body=hello
    ...    attachments=D:\\Mine\\Company\\Ericsson 4\\openemr_data.xlsx

# https://support.google.com/accounts/answer/6010255?hl=en&visit_id=638000454327836688-1262979472&p=less-secure-apps&rd=1
