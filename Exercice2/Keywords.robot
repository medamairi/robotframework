*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Navigate to URL
    [Arguments]    ${baseurl}   
    Open Browser    ${baseurl}    Chrome
    Maximize Browser Window
    Reload Page
    Page Should Contain Element    css=div[data-ride="carousel"]

 Search product
     [Arguments]     ${item}
     Click Element    xpath=//a[@href="/products"]
     Go To    https://automationexercise.com/products
     Element Should Be Visible    css=input[placeholder="Search Product"]
     Input Text    css=#search_product    ${item}
     Click Button    css=button[id="submit_search"]
     Element Should Contain    css=.features_items    SEARCHED PRODUCTS
     Capture Page Screenshot
     Execute Javascript    window.scrollBy(0,500)
     FOR    ${i}    IN RANGE    2    10
        ${element_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[${i}]/div/div[1]
        Run Keyword If    not ${element_visible}    Exit For Loop
        Element Should Contain    xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[${i}]/div/div[1]    ${item}
     END   

     
             