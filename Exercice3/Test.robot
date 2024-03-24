*** Settings ***
Resource    keywords.robot
Resource    variables.robot
Test Teardown    Close All Browsers
Library    XML

*** Test Cases ***

Create new account
    [Tags]    regression
    Navigate to URL    ${url}
    Create Account    ${email}    ${password}

Sgin In succefully
    [Tags]    regression
    Navigate to URL    ${url}
    Sign In    ${email}    ${password}
    Page Should Contain    My Account

Sgin IN with bad credentials
    [Tags]    error
    Navigate to URL    ${url}
    Sign In    abc@gmail.com    ${password}         
    ${message}=    Get Text   css=div[role="alert"]
    Should Be Equal    ${message}    The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.

Add product_Jacket to cart
    [Documentation]    Add the cheapest women jacket to cart 
    [Tags]    regression
    Navigate to URL    ${url}
    Sign In    ${email}    ${password}
    Add product

   







