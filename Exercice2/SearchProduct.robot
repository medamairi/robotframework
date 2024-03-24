*** Settings ***

Resource    ./Variables.robot
Resource    ./Keywords.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Verify searched product
    [Documentation]    Exercice robot framework
    [Tags]    Auto
    Navigate to URL    ${url}
    Search product    Dress
