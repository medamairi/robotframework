*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers


*** Variables ***
${baseurl}    https://practicetestautomation.com/practice-test-login/    
${user}    student
${psw}    Password123


*** Test Cases ***
Login succefully
    [Tags]    first
    Open URL    ${baseurl}    Login
    Login valid    ${user}    ${psw}   


*** Keywords ***
Open URL
    [Arguments]    ${base}    ${text}   
    Open Browser    ${base}    Chrome
    Maximize Browser Window
    Page Should Contain    ${text} 
  
Login valid
    [Arguments]    ${username}    ${password}    
    Input Text    css=input[name="username"]    ${username}
    Input Password    css=input[name="password"]    ${password}
    Click Button    css=button[id="submit"]
    Location Should Be    https://practicetestautomation.com/logged-in-successfully/
    Close Browser