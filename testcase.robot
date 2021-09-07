*** Settings ***
library     SeleniumLibrary 


*** Test Cases ***
observe user is able to test sanity flow
    [Tags]  sanity  regression
    Given User Launch Browser for Flipkart
    when User lands on Homepage Enter MobileNumber and Password
    Click on login 
    then user searches for Powerbank
    user selects best selling Product then lands on product page
    user adds item to cart
    user lands on cart and verifys cart

observe user is able to test regression flow
    [Tags]  regression
    #Given User Launch Browser for Flipkart
    #when User lands on Homepage Enter MobileNumber and Password
    #Click on login 
    #then user searches for Powerbank
    #user selects best selling Product then lands on product page
    #user adds item to cart
    #user lands on cart and verifys cart

*** Variables ***

${select_product}   xpath://*[@id="container"]/div/div[3]/div[1]/div[2]/div[2]/div/div[1]/div/a[1]/div[2]/div
${handle}   NEW

*** Keywords ***
Given User Launch Browser for Flipkart
    Open Browser  https://www.flipkart.com/  gc
when User lands on Homepage Enter MobileNumber and Password
    Input Text  xpath:/html/body/div[2]/div/div/div/div/div[2]/div/form/div[1]/input  8660101596
    Input Password  xpath:/html/body/div[2]/div/div/div/div/div[2]/div/form/div[2]/input  Test@123
Click on login
    click button  xpath:/html/body/div[2]/div/div/div/div/div[2]/div/form/div[4]/button
    Maximize Browser Window
    sleep  5
then user searches for Powerbank
    Input Text  xpath://*[@id="container"]/div/div[1]/div[1]/div[2]/div[2]/form/div/div/input  mi power bank 20000mah
    click button  xpath://*[@id="container"]/div/div[1]/div[1]/div[2]/div[2]/form/div/button
user selects best selling Product then lands on product page
    #Wait Untill Page Contains Element  ${select_product}    timeout=20s
    #click Element   ${select_product}
    #Switch Window   ${handle}

    Wait Until Page Contains Element  ${select_product}    timeout=20s
    Click Element    ${select_product}
    Switch Window    ${handle}

user adds item to cart
    Click Element    xpath://*[@id="container"]/div/div[3]/div[1]/div[1]/div[2]/div/ul/li[1]/button

user lands on cart and verifys cart
    Switch Window    ${first}
    #Click Image    xpath://*[@id="container"]/div/div[1]/div[1]/div[2]/div[1]/div/a[1]/img
    Wait Until Page Contains Element  ${select_prod}    timeout=20s
    Click Element    xpath://*[@id="container"]/div/div[1]/div[1]/div[2]/div[5]/div/div/a

