*** Settings ***
Library    SeleniumLibrary
Variables    locators.py

*** Keywords ***
Go To Shopping cart
    Wait Until Element Is Visible    ${shopping_cart_locator}
    Click Link    ${shopping_cart_locator}

Go To Main Page
    Wait Until Element Is Visible    ${home_page_link_locator}
    Click Link    ${home_page_link_locator}
    
