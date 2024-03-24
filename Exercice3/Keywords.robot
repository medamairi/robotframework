*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Navigate to URL
    [Arguments]    ${baseurl}   
    Open Browser    ${baseurl}    Chrome
    Maximize Browser Window
    Title Should Be    Home Page  

Create Account
    [Arguments]    ${email}    ${pwd}
    Click Element    css=a[href="https://magento.softwaretestingboard.com/customer/account/create/"]
    Page Should Contain    Create New Customer Account
    Input Text    css=#firstname    mohamed
    Input Text    css=#lastname    amairi
    Input Text    css=#email_address    ${email}
    Input Password    css=#password    ${pwd}         
    Input Password    css=#password-confirmation    ${pwd}
    Click Button    css=button[title="Create an Account"]
    Sleep    10S    
    Page Should Contain    My Account

Sign In
    [Arguments]    ${email}    ${pwd}
    Click Element    css=a[href="https://magento.softwaretestingboard.com/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLnNvZnR3YXJldGVzdGluZ2JvYXJkLmNvbS8%2C/"]    
    Page Should Contain    Customer Login
    Input Text    css=#email    ${email}
    Input Password    css=#pass    ${pwd}
    Click Button    css=#send2    

Add product
    Click Element    css=a[href="https://magento.softwaretestingboard.com/women.html"]
    Execute Javascript    window.scrollBy(0,300)
    Click Element    xpath=//*[@id="maincontent"]/div[4]/div[2]/div[2]/div/ul[1]/li[2]/a
    Page Should Contain    Jackets
    Select From List By Value    css=#sorter    price
    ${condition}=    Run Keyword And Return Status    Element Should Be Visible    css=a[title="Set Ascending Direction"]        
    Run Keyword If    ${condition}    Click Element    css=a[data-role="direction-switcher"]
    Click Element    xpath=//*[@id="maincontent"]/div[3]/div[1]/div[4]/ol/li[1]
    Sleep    5S
    Execute Javascript    window.scrollBy(0,300)
    Click Element    css=div[aria-label="S"]
    Click Element    css=div[option-label="Blue"]
    Click Button     css=button[title="Add to Cart"]
    Page Should Contain Link    css=a[href="https://magento.softwaretestingboard.com/checkout/cart/"]
