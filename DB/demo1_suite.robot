*** Comments ***
Table name - Products
columns-product_id,productname,description


*** Settings ***
Library     DatabaseLibrary

Suite Setup     Connect To Database     dbapiModuleName=pymysql     dbName=dbfree_db    dbUsername=dbfree_db
...     dbPassword=12345678     dbHost=db4free.net  dbPort=3306

Suite Teardown   Disconnect From Database

*** Test Cases ***
TC1
    Table Must Exist    Products
    ${count}    Row Count    select * from Products where product_id<10
    Log To Console    ${count}

TC2
    Row Count Is Equal To X    select * from Products where product_id=10    1
    Row Count Is Greater Than X    select * from Products    10
    Row Count Is Less Than X    select * from Products    100
    
TC3
    Execute Sql String    Insert into Products (product_id,productname,description) values (651,'Balaji','just name')
    Row Count Is Equal To X    select * from Products where product_id=651    1

TC4
#     use keyword "Query" to get the select statement output as list
     @{output}  Query    select * from Products
     Log To Console    ${output}
      Log To Console    ${output}[0]

TC5
    Execute Sql String    update Products set productname='bala' where product_id=651
    @{output}   Query    select * from Products where product_id=651
    Log To Console    ${output}

TC6
     @{output}   Query    select * from Products where product_id=651
    Log To Console    ${output}
    Log To Console    ${output}[0]
    Log To Console    ${output}[0][1]