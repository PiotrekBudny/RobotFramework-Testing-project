*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Click Link For Shop Item With Name
    [Arguments]    ${shop_item_name}
    ${locator}=    Set Variable    xpath=//a[normalize-space(text())="${shop_item_name}"]
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}


