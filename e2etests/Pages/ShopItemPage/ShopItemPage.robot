*** Settings ***
Library    SeleniumLibrary
Variables    locators.py

*** Keywords ***
Fetch Shop Item Name
    Wait Until Element Is Visible    ${H2_Name_Locator}
    ${product_name}=    Get Text    ${H2_Name_Locator}
    [Return]    ${product_name}
    